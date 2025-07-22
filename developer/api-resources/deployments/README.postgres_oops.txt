
sre@k8s-controller-01:~/api/resourcequota/space$ cat postgres.yml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgres
spec:
  replicas: 3
  selector:
    matchLabels:
      app: postgres
  template:
    metadata:
      labels:
        app: postgres
    spec:
      containers:
        - name: postgres
          image: 'postgres:14'
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: 5432
          envFrom:
            - configMapRef:
                name: postgres-secret
          volumeMounts:
            - mountPath: /var/lib/postgresql/data
              name: postgresdata
      volumes:
        - name: postgresdata
          persistentVolumeClaim:
            claimName: postgres-pvc-space

sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space create -f postgres.yml 
deployment.apps/postgres created
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space get deployment
NAME       READY   UP-TO-DATE   AVAILABLE   AGE
postgres   0/3     3            0           10s
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space get replicaset
NAME                  DESIRED   CURRENT   READY   AGE
postgres-7f65b66466   3         3         0       28s

sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space describe deployment postgres
Name:                   postgres
Namespace:              space
CreationTimestamp:      Sat, 07 Dec 2024 03:00:24 +0000
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=postgres
Replicas:               3 desired | 3 updated | 3 total | 0 available | 3 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=postgres
  Containers:
   postgres:
    Image:      postgres:14
    Port:       5432/TCP
    Host Port:  0/TCP
    Environment Variables from:
      postgres-secret  ConfigMap  Optional: false
    Environment:       <none>
    Mounts:
      /var/lib/postgresql/data from postgresdata (rw)
  Volumes:
   postgresdata:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  postgres-pvc-space
    ReadOnly:   false
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      False   MinimumReplicasUnavailable
  Progressing    True    ReplicaSetUpdated
OldReplicaSets:  <none>
NewReplicaSet:   postgres-7f65b66466 (3/3 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  51s   deployment-controller  Scaled up replica set postgres-7f65b66466 to 3
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space get pods
NAME                        READY   STATUS                       RESTARTS   AGE
postgres-7f65b66466-9dn2v   0/1     CreateContainerConfigError   0          68s
postgres-7f65b66466-g7qmv   0/1     CreateContainerConfigError   0          68s
postgres-7f65b66466-m7g5l   0/1     CreateContainerConfigError   0          68s

sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space logs postgres-7f65b66466-9dn2v
Error from server (BadRequest): container "postgres" in pod "postgres-7f65b66466-9dn2v" is waiting to start: CreateContainerConfigError

sre@k8s-controller-01:~/api/resourcequota/space$ cat postgres-space.yml
# https://hub.docker.com/_/postgres
apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgres-space
  namespace: space
  labels:
    app: "postgres"
spec:
  replicas: 1
  selector:
    matchLabels:
      app: postgres
  strategy:
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: postgres
        upstream: "kafka"
        downstream: "None"
    spec:
      containers:
        - name: postgres
          image: docker.io/postgres:17.1
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: 5432
              name: sql
              protocol: TCP
          resources:
            - requests:
                cpu: "10m"
                memory: "2Mi"
            - limits:
                cpu: "100m"
                memory: "5Mi"
          livenessProbe:
            - httpGet:
                path: /healthy
                port: 8080
              initialDelaySeconds: 5
              timeoutSeconds: 1
              periodSeconds: 10
              failureThreshold: 3
          readinessProbe:
            - httpGet:
                path: /ready
                port: 8080
              initialDelaySeconds: 30
              timeoutSeconds: 1
              periodSeconds: 10
              failureThreshold: 3
          volumeMounts:
            - name: config-volume
              mountPath: /tmp-postgres
          volumes:
            - name: config-volume
              configMap:
                name: postgres-secrets
      restartPolicy: Always
      schedulerName: default-scheduler
      dnsPolicy: ClusterFirst
      securityContext: {}
      terminationGracePeriodSeconds: 5
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space create -f postgres-space.yml
Error from server (BadRequest): error when creating "postgres-space.yml": Deployment in version "v1" cannot be handled as a Deployment: json: cannot unmarshal array into Go struct field Container.spec.template.spec.containers.livenessProbe of type v1.Probe

sre@k8s-controller-01:~/api/resourcequota/space$ vi postgres-space.yml
sre@k8s-controller-01:~/api/resourcequota/space$ cat postgres-space.yml 
# https://hub.docker.com/_/postgres
apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgres-space
  namespace: space
  labels:
    app: "postgres"
spec:
  replicas: 1
  selector:
    matchLabels:
      app: postgres
  strategy:
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: postgres
        upstream: "kafka"
        downstream: "None"
    spec:
      containers:
        - name: postgres
          image: docker.io/postgres:17.1
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: 5432
              name: sql
              protocol: TCP
          resources:
            requests:
              cpu: "10m"
              memory: "2Mi"
            limits:
              cpu: "100m"
              memory: "5Mi"
          livenessProbe:
            httpGet:
              path: /healthy
              port: 8080
            initialDelaySeconds: 5
            timeoutSeconds: 1
            periodSeconds: 10
            failureThreshold: 3
          readinessProbe:
            httpGet:
              path: /ready
              port: 8080
            initialDelaySeconds: 30
            timeoutSeconds: 1
            periodSeconds: 10
            failureThreshold: 3
          volumeMounts:
            - name: config-volume
              mountPath: /tmp-postgres
      volumes:
        - name: config-volume
          configMap:
            name: postgres-secrets
      restartPolicy: Always
      schedulerName: default-scheduler
      dnsPolicy: ClusterFirst
      securityContext: {}
      terminationGracePeriodSeconds: 5

sre@k8s-controller-01:~/api/resourcequota/space$ kubectl create -f postgres-space.yml 
deployment.apps/postgres-space created

sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space get deployments postgres-space -o yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "1"
  creationTimestamp: "2024-12-07T03:42:22Z"
  generation: 1
  labels:
    app: postgres
  name: postgres-space
  namespace: space
  resourceVersion: "206295"
  uid: 82fafeb9-f430-44e5-88ea-80b30b7605d0
spec:
  progressDeadlineSeconds: 600
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: postgres
  strategy:
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: postgres
        downstream: None
        upstream: kafka
    spec:
      containers:
      - image: docker.io/postgres:17.1
        imagePullPolicy: IfNotPresent
        livenessProbe:
          failureThreshold: 3
          httpGet:
            path: /healthy
            port: 8080
            scheme: HTTP
          initialDelaySeconds: 5
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 1
        name: postgres
        ports:
        - containerPort: 5432
          name: sql
          protocol: TCP
        readinessProbe:
          failureThreshold: 3
          httpGet:
            path: /ready
            port: 8080
            scheme: HTTP
          initialDelaySeconds: 30
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 1
        resources:
          limits:
            cpu: 100m
            memory: 5Mi
          requests:
            cpu: 10m
            memory: 2Mi
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
        volumeMounts:
        - mountPath: /tmp-postgres
          name: config-volume
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 5
      volumes:
      - configMap:
          defaultMode: 420
          name: postgres-secrets
        name: config-volume
status:
  conditions:
  - lastTransitionTime: "2024-12-07T03:42:22Z"
    lastUpdateTime: "2024-12-07T03:42:22Z"
    message: Deployment has minimum availability.
    reason: MinimumReplicasAvailable
    status: "True"
    type: Available
  - lastTransitionTime: "2024-12-07T03:42:22Z"
    lastUpdateTime: "2024-12-07T03:43:51Z"
    message: ReplicaSet "postgres-space-667d6b9d6f" is progressing.
    reason: ReplicaSetUpdated
    status: "True"
    type: Progressing
  observedGeneration: 1
  replicas: 1
  unavailableReplicas: 1
  updatedReplicas: 1

sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space get replicasets
NAME                        DESIRED   CURRENT   READY   AGE
postgres-7f65b66466         3         3         0       44m
postgres-space-667d6b9d6f   1         1         0       2m48s
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space get replicasets postgres-space-667d6b9d6f -o yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  annotations:
    deployment.kubernetes.io/desired-replicas: "1"
    deployment.kubernetes.io/max-replicas: "2"
    deployment.kubernetes.io/revision: "1"
  creationTimestamp: "2024-12-07T03:42:22Z"
  generation: 1
  labels:
    app: postgres
    downstream: None
    pod-template-hash: 667d6b9d6f
    upstream: kafka
  name: postgres-space-667d6b9d6f
  namespace: space
  ownerReferences:
  - apiVersion: apps/v1
    blockOwnerDeletion: true
    controller: true
    kind: Deployment
    name: postgres-space
    uid: 82fafeb9-f430-44e5-88ea-80b30b7605d0
  resourceVersion: "206293"
  uid: e4de24f1-7022-4ae9-92a3-d4a6942167fb
spec:
  replicas: 1
  selector:
    matchLabels:
      app: postgres
      pod-template-hash: 667d6b9d6f
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: postgres
        downstream: None
        pod-template-hash: 667d6b9d6f
        upstream: kafka
    spec:
      containers:
      - image: docker.io/postgres:17.1
        imagePullPolicy: IfNotPresent
        livenessProbe:
          failureThreshold: 3
          httpGet:
            path: /healthy
            port: 8080
            scheme: HTTP
          initialDelaySeconds: 5
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 1
        name: postgres
        ports:
        - containerPort: 5432
          name: sql
          protocol: TCP
        readinessProbe:
          failureThreshold: 3
          httpGet:
            path: /ready
            port: 8080
            scheme: HTTP
          initialDelaySeconds: 30
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 1
        resources:
          limits:
            cpu: 100m
            memory: 5Mi
          requests:
            cpu: 10m
            memory: 2Mi
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
        volumeMounts:
        - mountPath: /tmp-postgres
          name: config-volume
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 5
      volumes:
      - configMap:
          defaultMode: 420
          name: postgres-secrets
        name: config-volume
status:
  fullyLabeledReplicas: 1
  observedGeneration: 1
  replicas: 1

sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space logs postgres-space-667d6b9d6f-v5prk
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space logs postgres-space-667d6b9d6f-cv6bk
unable to retrieve container logs for containerd://959475f613bde06ad8ddcbeed4aade23a2b0a95bdcb7f0e1c85ed1adbab512c7
sre@k8s-controller-01:~/api/resourcequota/space$ 

sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space describe pod postgres-space-667d6b9d6f-v5prk
Name:             postgres-space-667d6b9d6f-v5prk
Namespace:        space
Priority:         0
Service Account:  default
Node:             <none>
Labels:           app=postgres
                  downstream=None
                  pod-template-hash=667d6b9d6f
                  upstream=kafka
Annotations:      <none>
Status:           Pending
IP:               
IPs:              <none>
Controlled By:    ReplicaSet/postgres-space-667d6b9d6f
Containers:
  postgres:
    Image:      docker.io/postgres:17.1
    Port:       5432/TCP
    Host Port:  0/TCP
    Limits:
      cpu:     100m
      memory:  5Mi
    Requests:
      cpu:        10m
      memory:     2Mi
    Liveness:     http-get http://:8080/healthy delay=5s timeout=1s period=10s #success=1 #failure=3
    Readiness:    http-get http://:8080/ready delay=30s timeout=1s period=10s #success=1 #failure=3
    Environment:  <none>
    Mounts:
      /tmp-postgres from config-volume (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-xm6vj (ro)
Conditions:
  Type           Status
  PodScheduled   False 
Volumes:
  config-volume:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      postgres-secrets
    Optional:  false
  kube-api-access-xm6vj:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason            Age    From               Message
  ----     ------            ----   ----               -------
  Warning  FailedScheduling  3m30s  default-scheduler  0/2 nodes are available: 1 node(s) had untolerated taint {node.kubernetes.io/disk-pressure: }, 1 node(s) were unschedulable. preemption: 0/2 nodes are available: 2 Preemption is not helpful for scheduling..
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl get nodes -o wide
NAME                STATUS                     ROLES           AGE   VERSION    INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
k8s-controller-01   Ready,SchedulingDisabled   control-plane   29d   v1.28.14   192.168.1.105   <none>        Ubuntu 24.04.1 LTS   6.8.0-47-generic   containerd://1.7.12
k8s-node-01         Ready                      <none>          25d   v1.28.14   192.168.1.107   <none>        Ubuntu 24.04.1 LTS   6.8.0-47-generic   containerd://1.7.12
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl top nodes
NAME                CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
k8s-controller-01   224m         11%    1176Mi          62%       
k8s-node-01         79m          3%     793Mi           42%       

tim@Tims-MBP deployments % ssh sre@k8s-node-01
sre@k8s-node-01:~$ df -h
Filesystem                         Size  Used Avail Use% Mounted on
tmpfs                              197M  3.9M  193M   2% /run
/dev/mapper/ubuntu--vg-ubuntu--lv   12G  8.5G  2.2G  80% /
tmpfs                              984M     0  984M   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
/dev/sda2                          2.0G   95M  1.7G   6% /boot
shm                                 64M     0   64M   0% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/eafc12a1f9c92405a890021cbecd527c4d14a99df6710183effe6212364fa3f0/shm
shm                                 64M     0   64M   0% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/3c7a64871d46cd28b7023935429c74a2637d87c35c14897b653f9f3a11503dfe/shm
shm                                 64M     0   64M   0% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/d59d88713f836a3c655570368c2d9512d9c78ff335f56d2d73d1b0f7e46550b3/shm
shm                                 64M     0   64M   0% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/89ac6dfad2c4a7b5e93efd9a6c02d75349a900d724e318a820033a45cdd3e495/shm
shm                                 64M     0   64M   0% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/e6f883e9d2cc8e5655b1de61811bbf2976599b640b00e0d84489b45dbbb3f089/shm
shm                                 64M     0   64M   0% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/3dc2fc4201ff02f148c7e2500ce3f13c971f1e5749c98d7f1d64bd2f5c186b63/shm
shm                                 64M  4.0K   64M   1% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/5939d1b1886e03fa21109a2c7d41804234f2d5ef7ebb269a9c225f161b907a89/shm
be38033841d4d52d7eb772f57b0d80272e119bd/shm
shm                                 64M     0   64M   0% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/ee26f19e63d26e5e6b31a0e1eac26e39da7379757b7ff5af5e7faa7dcb4aad3d/shm
shm                                 64M     0   64M   0% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/cf5ae8832a0321c271e582ffdd324cacbc93e1647a70664066528b5a9b4bd237/shm
shm                                 64M     0   64M   0% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/608bf326983b3bbfbb7c0556c924c0ad7f36901402649dbda3e39303940fb4c1/shm
shm                                 64M     0   64M   0% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/d552a2ca22a7ff3b03968cca175bf90c5a47b1f150ca2006cd91acffcc36f0c3/shm
shm                                 64M     0   64M   0% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/d137a8739e395f18bb0b466601b5d61d40e75bcaf2c0bea1a4118725db97d5d9/shm
shm                                 64M     0   64M   0% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/da18e955dde392cb327121e99e52f8406e5a3fdb5b4729d54b4b528748e88bee/shm
shm                                 64M     0   64M   0% /run/containerd/io.containerd.grpc.v1.cri/sandboxes/97e5d95813a3675f5103c8b30792d543b097e6d36ff57f59277f62cf564aa062/shm
tmpfs                              197M   12K  197M   1% /run/user/1000
sre@k8s-node-01:~$ free -m
               total        used        free      shared  buff/cache   available
Mem:            1967         719         323           4        1097        1248
Swap:              0           0           0

tim@Tims-MBP deployments % ssh sre@k8s-node-02
sre@k8s-node-02:~$ ps -ef | grep kube
sre         1418    1356  0 03:53 pts/0    00:00:00 grep --color=auto kube
sre@k8s-node-02:~$ df -h
Filesystem                         Size  Used Avail Use% Mounted on
tmpfs                              197M  1.1M  196M   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv   12G  5.3G  5.4G  50% /
tmpfs                              984M     0  984M   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
/dev/sda2                          2.0G   95M  1.7G   6% /boot
tmpfs                              197M   12K  197M   1% /run/user/1000
sre@k8s-node-02:~$ free -m
               total        used        free      shared  buff/cache   available
Mem:            1967         353        1305           1         456        1614
Swap:              0           0           0

