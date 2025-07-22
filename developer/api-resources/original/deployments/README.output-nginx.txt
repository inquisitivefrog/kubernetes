
tim@Tims-MBP deployments % kubectl get deployments
No resources found in default namespace.
tim@Tims-MBP deployments % kubectl get deployments --all-namespaces
NAMESPACE     NAME      READY   UP-TO-DATE   AVAILABLE   AGE
kube-system   coredns   2/2     2            2           79m

tim@Tims-MBP deployments % vi deployment-nginx.yml 
tim@Tims-MBP deployments % cat deployment-nginx.yml  
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: main
        image: nginx:1.26.2
        imagePullPolicy: Never
        ports:
        - containerPort: 80
        readinessProbe:
          tcpSocket:
            port: 8080
          initialDelaySeconds: 5
          periodSeconds: 10
        livenessProbe:
          httpGet:
            scheme: HTTP
            path: /index.html
            port: 80
          initialDelaySeconds: 5
          periodSeconds: 10
      - name: sidecar
        image: busybox
        imagePullPolicy: Never
        command: ["/bin/sh", "-c", "sleep 3600"]

tim@Tims-MBP deployments % kubectl --namespace=default apply -f deployment-nginx.yml 
deployment.apps/nginx created

tim@Tims-MBP pods % kubectl --namespace=default get deployments                     
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
nginx   0/2     2            0           2m34s

tim@Tims-MBP pods % kubectl --namespace=default describe deployment nginx
Name:                   nginx
Namespace:              default
CreationTimestamp:      Thu, 31 Oct 2024 15:41:59 -0700
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=nginx
Replicas:               2 desired | 2 updated | 2 total | 0 available | 2 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx
  Containers:
   main:
    Image:        nginx:1.26.2
    Port:         80/TCP
    Host Port:    0/TCP
    Liveness:     http-get http://:80/index.html delay=5s timeout=1s period=10s #success=1 #failure=3
    Readiness:    tcp-socket :8080 delay=5s timeout=1s period=10s #success=1 #failure=3
    Environment:  <none>
    Mounts:       <none>
   sidecar:
    Image:      busybox
    Port:       <none>
    Host Port:  <none>
    Command:
      /bin/sh
      -c
      sleep 3600
    Environment:   <none>
    Mounts:        <none>
  Volumes:         <none>
  Node-Selectors:  <none>
  Tolerations:     <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      False   MinimumReplicasUnavailable
  Progressing    True    ReplicaSetUpdated
OldReplicaSets:  <none>
NewReplicaSet:   nginx-dbc848cf5 (2/2 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  3m15s  deployment-controller  Scaled up replica set nginx-dbc848cf5 to 2

tim@Tims-MBP pods % kubectl --namespace=default get pods                 
NAME                    READY   STATUS    RESTARTS   AGE
nginx-dbc848cf5-hjchr   1/2     Running   0          3m26s
nginx-dbc848cf5-nhg84   1/2     Running   0          3m26s

tim@Tims-MBP pods % kubectl --namespace=default logs nginx-dbc848cf5-hjchr | head -20
Defaulted container "main" out of: main, sidecar
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2024/10/31 22:42:01 [notice] 1#1: using the "epoll" event method
2024/10/31 22:42:01 [notice] 1#1: nginx/1.26.2
2024/10/31 22:42:01 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2024/10/31 22:42:01 [notice] 1#1: OS: Linux 6.10.4-linuxkit
2024/10/31 22:42:01 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2024/10/31 22:42:01 [notice] 1#1: start worker processes
2024/10/31 22:42:01 [notice] 1#1: start worker process 29
2024/10/31 22:42:01 [notice] 1#1: start worker process 30
2024/10/31 22:42:01 [notice] 1#1: start worker process 31
2024/10/31 22:42:01 [notice] 1#1: start worker process 32
2024/10/31 22:42:01 [notice] 1#1: start worker process 33
tim@Tims-MBP pods % kubectl --namespace=default logs nginx-dbc848cf5-hjchr | head -25
Defaulted container "main" out of: main, sidecar
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2024/10/31 22:42:01 [notice] 1#1: using the "epoll" event method
2024/10/31 22:42:01 [notice] 1#1: nginx/1.26.2
2024/10/31 22:42:01 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2024/10/31 22:42:01 [notice] 1#1: OS: Linux 6.10.4-linuxkit
2024/10/31 22:42:01 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2024/10/31 22:42:01 [notice] 1#1: start worker processes
2024/10/31 22:42:01 [notice] 1#1: start worker process 29
2024/10/31 22:42:01 [notice] 1#1: start worker process 30
2024/10/31 22:42:01 [notice] 1#1: start worker process 31
2024/10/31 22:42:01 [notice] 1#1: start worker process 32
2024/10/31 22:42:01 [notice] 1#1: start worker process 33
2024/10/31 22:42:01 [notice] 1#1: start worker process 34
2024/10/31 22:42:01 [notice] 1#1: start worker process 35
2024/10/31 22:42:01 [notice] 1#1: start worker process 36
10.1.0.1 - - [31/Oct/2024:22:42:10 +0000] "GET /index.html HTTP/1.1" 200 615 "-" "kube-probe/1.30" "-"
10.1.0.1 - - [31/Oct/2024:22:42:20 +0000] "GET /index.html HTTP/1.1" 200 615 "-" "kube-probe/1.30" "-"
tim@Tims-MBP pods % 

tim@Tims-MBP pods % kubectl --namespace=default get pods -o wide
NAME                    READY   STATUS    RESTARTS       AGE   IP          NODE             NOMINATED NODE   READINESS GATES
nginx-dbc848cf5-hjchr   1/2     Running   7 (177m ago)   16h   10.1.0.10   docker-desktop   <none>           <none>
nginx-dbc848cf5-nhg84   1/2     Running   7 (177m ago)   16h   10.1.0.11   docker-desktop   <none>           <none>

tim@Tims-MBP pods % kubectl get services -o wide
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE   SELECTOR
kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   18h   <none>


