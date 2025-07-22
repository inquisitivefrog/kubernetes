
tim@Tims-MBP pods % vi pod-guard.yml 
tim@Tims-MBP pods % cat pod-guard.yml 
apiVersion: v1
kind: Pod
metadata:
  name: kuard-config
spec:
  containers:
  - name: test-container
    image: gcr.io/kuar-demo/kuard-amd64:1
    imagePullPolicy: Always
    command:
      - "/kuard"
      - "$(EXTRA_PARAM)"
    env:
      - name: ANOTHER_PARAM
        valueFrom:
          configMapKeyRef:
            name: my-config
            key: another-param
      - name: EXTRA_PARAM
        valueFrom:
          configMapKeyRef:
            name: my-config
            key: extra-param
    volumeMounts:
      - name: config-volume
        mountPath: /config
  volumes:
    - name: config-volume
      configMap:
        name: my-config
  restartPolicy: Never

tim@Tims-MBP pods % kubectl apply -f pod-guard.yml
pod/kuard-config created
tim@Tims-MBP pods % kubectl get pods
NAME           READY   STATUS              RESTARTS   AGE
kuard-config   0/1     ContainerCreating   0          8s

tim@Tims-MBP pods % kubectl describe pod kuard-config
Name:             kuard-config
Namespace:        default
Priority:         0
Service Account:  default
Node:             docker-desktop/192.168.65.3
Start Time:       Fri, 01 Nov 2024 11:47:38 -0700
Labels:           <none>
Annotations:      <none>
Status:           Pending
IP:               
IPs:              <none>
Containers:
  test-container:
    Container ID:  
    Image:         gcr.io/kuar-demo/kuard-amd64:1
    Image ID:      
    Port:          <none>
    Host Port:     <none>
    Command:
      /kuard
      $(EXTRA_PARAM)
    State:          Waiting
      Reason:       ContainerCreating
    Ready:          False
    Restart Count:  0
    Environment:
      ANOTHER_PARAM:  <set to the key 'another-param' of config map 'my-config'>  Optional: false
      EXTRA_PARAM:    <set to the key 'extra-param' of config map 'my-config'>    Optional: false
    Mounts:
      /config from config-volume (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-2dk7k (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   False 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  config-volume:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      my-config
    Optional:  false
  kube-api-access-2dk7k:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason       Age               From               Message
  ----     ------       ----              ----               -------
  Normal   Scheduled    14s               default-scheduler  Successfully assigned default/kuard-config to docker-desktop
  Warning  FailedMount  7s (x5 over 14s)  kubelet            MountVolume.SetUp failed for volume "config-volume" : configmap "my-config" not found

tim@Tims-MBP pods % ls -l ../configmaps/my-configmap.txt
-rw-r--r--  1 tim  staff  40 Nov  1 10:50 ../configmaps/my-configmap.txt
tim@Tims-MBP pods % cat ../configmaps/my-configmap.txt 
parameter1 = value1
parameter2 = value2

tim@Tims-MBP pods % kubectl create configmap my-config --from-file=../configmaps/my-configmap.txt --from-literal=extra-param=extra-value --from-literal=another-param=another-value
configmap/my-config created

tim@Tims-MBP pods % kubectl get configmap my-config
NAME        DATA   AGE
my-config   3      8s
tim@Tims-MBP pods % kubectl get configmap my-config -o yaml
apiVersion: v1
data:
  another-param: another-value
  extra-param: extra-value
  my-configmap.txt: |
    parameter1 = value1
    parameter2 = value2
kind: ConfigMap
metadata:
  creationTimestamp: "2024-11-01T18:49:20Z"
  name: my-config
  namespace: default
  resourceVersion: "58473"
  uid: 6216fb49-7764-474b-b357-c2433c5b5e79

tim@Tims-MBP pods % kubectl get pods                    
NAME           READY   STATUS              RESTARTS   AGE
kuard-config   0/1     ContainerCreating   0          2m14s
tim@Tims-MBP pods % kubectl describe pod kuard-config   
Name:             kuard-config
Namespace:        default
Priority:         0
Service Account:  default
Node:             docker-desktop/192.168.65.3
Start Time:       Fri, 01 Nov 2024 11:47:38 -0700
Labels:           <none>
Annotations:      <none>
Status:           Pending
IP:               
IPs:              <none>
Containers:
  test-container:
    Container ID:  
    Image:         gcr.io/kuar-demo/kuard-amd64:1
    Image ID:      
    Port:          <none>
    Host Port:     <none>
    Command:
      /kuard
      $(EXTRA_PARAM)
    State:          Waiting
      Reason:       ContainerCreating
    Ready:          False
    Restart Count:  0
    Environment:
      ANOTHER_PARAM:  <set to the key 'another-param' of config map 'my-config'>  Optional: false
      EXTRA_PARAM:    <set to the key 'extra-param' of config map 'my-config'>    Optional: false
    Mounts:
      /config from config-volume (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-2dk7k (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   False 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  config-volume:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      my-config
    Optional:  false
  kube-api-access-2dk7k:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason       Age                  From               Message
  ----     ------       ----                 ----               -------
  Normal   Scheduled    2m18s                default-scheduler  Successfully assigned default/kuard-config to docker-desktop
  Warning  FailedMount  75s (x8 over 2m18s)  kubelet            MountVolume.SetUp failed for volume "config-volume" : configmap "my-config" not found
  Normal   Pulling      3s                   kubelet            Pulling image "gcr.io/kuar-demo/kuard-amd64:1"

tim@Tims-MBP pods % kubectl describe pod kuard-config
Name:             kuard-config
Namespace:        default
Priority:         0
Service Account:  default
Node:             docker-desktop/192.168.65.3
Start Time:       Fri, 01 Nov 2024 11:47:38 -0700
Labels:           <none>
Annotations:      <none>
Status:           Running
IP:               10.1.0.23
IPs:
  IP:  10.1.0.23
Containers:
  test-container:
    Container ID:  docker://3fbff9574d6fb9bc2423ca9d9d86e8bf03c46685f3fb7bd9f80bf975c79fc5a2
    Image:         gcr.io/kuar-demo/kuard-amd64:1
    Image ID:      docker-pullable://gcr.io/kuar-demo/kuard-amd64@sha256:bd17153e9a3319f401acc7a27759243f37d422c06cbbf01cb3e1f54bbbfe14f4
    Port:          <none>
    Host Port:     <none>
    Command:
      /kuard
      $(EXTRA_PARAM)
    State:          Running
      Started:      Fri, 01 Nov 2024 11:49:58 -0700
    Ready:          True
    Restart Count:  0
    Environment:
      ANOTHER_PARAM:  <set to the key 'another-param' of config map 'my-config'>  Optional: false
      EXTRA_PARAM:    <set to the key 'extra-param' of config map 'my-config'>    Optional: false
    Mounts:
      /config from config-volume (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-2dk7k (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  config-volume:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      my-config
    Optional:  false
  kube-api-access-2dk7k:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason       Age                  From               Message
  ----     ------       ----                 ----               -------
  Normal   Scheduled    2m29s                default-scheduler  Successfully assigned default/kuard-config to docker-desktop
  Warning  FailedMount  86s (x8 over 2m29s)  kubelet            MountVolume.SetUp failed for volume "config-volume" : configmap "my-config" not found
  Normal   Pulling      14s                  kubelet            Pulling image "gcr.io/kuar-demo/kuard-amd64:1"
  Normal   Pulled       10s                  kubelet            Successfully pulled image "gcr.io/kuar-demo/kuard-amd64:1" in 4.087s (4.087s including waiting). Image size: 9515871 bytes.
  Normal   Created      9s                   kubelet            Created container test-container
  Normal   Started      9s                   kubelet            Started container test-container

tim@Tims-MBP pods % kubectl get pods
NAME           READY   STATUS    RESTARTS   AGE
kuard-config   1/1     Running   0          2m43s
tim@Tims-MBP pods % kubectl exec -it kuard-config -- sh
~ $ env | sort
ANOTHER_PARAM=another-value
EXTRA_PARAM=extra-value
HOME=/
HOSTNAME=kuard-config
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_PORT_443_TCP_PORT=443
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_SERVICE_HOST=10.96.0.1
KUBERNETES_SERVICE_PORT=443
KUBERNETES_SERVICE_PORT_HTTPS=443
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PWD=/
SHLVL=1
TERM=xterm
~ $ ps -ef
PID   USER     TIME  COMMAND
    1 nobody    0:00 /kuard extra-value
   11 nobody    0:00 sh
   19 nobody    0:00 ps -ef
~ $ df -h
Filesystem                Size      Used Available Use% Mounted on
overlay                  58.4G      3.6G     51.8G   6% /
tmpfs                    64.0M         0     64.0M   0% /dev
/dev/vda1                58.4G      3.6G     51.8G   6% /config
shm                      64.0M         0     64.0M   0% /dev/shm
/dev/vda1                58.4G      3.6G     51.8G   6% /dev/termination-log
/dev/vda1                58.4G      3.6G     51.8G   6% /etc/resolv.conf
/dev/vda1                58.4G      3.6G     51.8G   6% /etc/hostname
/dev/vda1                58.4G      3.6G     51.8G   6% /etc/hosts
tmpfs                     7.6G     12.0K      7.6G   0% /run/secrets/kubernetes.io/serviceaccount
tmpfs                     3.8G         0      3.8G   0% /proc/acpi
tmpfs                    64.0M         0     64.0M   0% /proc/kcore
tmpfs                    64.0M         0     64.0M   0% /proc/keys
tmpfs                    64.0M         0     64.0M   0% /proc/timer_list
tmpfs                     3.8G         0      3.8G   0% /sys/firmware
~ $ ls -l /config
total 0
lrwxrwxrwx    1 root     root            20 Nov  1 18:49 another-param -> ..data/another-param
lrwxrwxrwx    1 root     root            18 Nov  1 18:49 extra-param -> ..data/extra-param
lrwxrwxrwx    1 root     root            23 Nov  1 18:49 my-configmap.txt -> ..data/my-configmap.txt
~ $ ls /
bin     config  dev     etc     home    kuard   lib     media   mnt     proc    root    run     sbin    srv     sys     tmp     usr     var
~ $ cat /config/another-param
another-value~ $ 
~ $ cat ./config/extra-param
extra-value~ $ 
~ $ cat /config/extra-param
extra-value~ $ 
~ $ cat /config/my-configmap.txt
parameter1 = value1
parameter2 = value2
~ $ exit

tim@Tims-MBP pods % kubectl logs kuard-config
2024/11/01 18:49:58 Starting kuard version: v0.8.1-1
2024/11/01 18:49:58 **********************************************************************
2024/11/01 18:49:58 * WARNING: This server may expose sensitive
2024/11/01 18:49:58 * and secret information. Be careful.
2024/11/01 18:49:58 **********************************************************************
2024/11/01 18:49:58 Config: 
{
  "address": ":8080",
  "debug": false,
  "debug-sitedata-dir": "./sitedata",
  "keygen": {
    "enable": false,
    "exit-code": 0,
    "exit-on-complete": false,
    "memq-queue": "",
    "memq-server": "",
    "num-to-gen": 0,
    "time-to-run": 0
  },
  "liveness": {
    "fail-next": 0
  },
  "readiness": {
    "fail-next": 0
  },
  "tls-address": ":8443",
  "tls-dir": "/tls"
}
2024/11/01 18:49:58 Could not find certificates to serve TLS
2024/11/01 18:49:58 Serving on HTTP on :8080

