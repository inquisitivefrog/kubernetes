
sre@k8s-controller-01:~/api$ vi nginx-config-configmap.yml 
sre@k8s-controller-01:~/api$ cat nginx-config-configmap.yml 
apiVersion: v1
data:
  default.conf: |
    server { 
      listen 80;
      listen [::]:80;
      server_name localhost;
      location /demo {
        return 200 'hello world\n';
        add_header Content-Type text/plain;
      }
      error_page   500 502 503 504  /50x.html;
      location = /50x.html {
        root   /usr/share/nginx/html;
      }
    }
kind: ConfigMap
metadata:
  name: nginx-config
  namespace: default

sre@k8s-controller-01:~/api$ kubectl apply -f nginx-config-configmap.yml 
configmap/nginx-config created
sre@k8s-controller-01:~/api$ cat nginx-pod.yml 
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
    - name: main
      image: nginx:1.26.2
      volumeMounts:
        - name: config-volume
          mountPath: /etc/nginx/conf.d
            #- name: html-volume
            #mountPath: /usr/share/nginx/html/
  volumes:
    - name: config-volume
      configMap:
        name: nginx-config
  restartPolicy: Never

sre@k8s-controller-01:~/api$ kubectl apply -f nginx-pod.yml
pod/nginx created
sre@k8s-controller-01:~/api$ kubectl get pods -o wide
NAME    READY   STATUS    RESTARTS   AGE   IP            NODE          NOMINATED NODE   READINESS GATES
nginx   1/1     Running   0          6s    10.244.1.37   k8s-node-01   <none>           <none>
sre@k8s-controller-01:~/api$ curl http://10.244.1.37/demo
hello world
sre@k8s-controller-01:~/api$ 
sre@k8s-controller-01:~/api$ kubectl logs nginx
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: can not modify /etc/nginx/conf.d/default.conf (read-only file system?)
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2024/11/13 02:05:18 [notice] 1#1: using the "epoll" event method
2024/11/13 02:05:18 [notice] 1#1: nginx/1.26.2
2024/11/13 02:05:18 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2024/11/13 02:05:18 [notice] 1#1: OS: Linux 6.8.0-47-generic
2024/11/13 02:05:18 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2024/11/13 02:05:18 [notice] 1#1: start worker processes
2024/11/13 02:05:18 [notice] 1#1: start worker process 21
2024/11/13 02:05:18 [notice] 1#1: start worker process 22
10.244.0.0 - - [13/Nov/2024:02:05:30 +0000] "GET /demo HTTP/1.1" 200 11 "-" "curl/8.5.0" "-"

sre@k8s-controller-01:~/api$ kubectl describe pod nginx
Name:             nginx
Namespace:        default
Priority:         0
Service Account:  default
Node:             k8s-node-01/192.168.1.107
Start Time:       Wed, 13 Nov 2024 02:05:17 +0000
Labels:           <none>
Annotations:      <none>
Status:           Running
IP:               10.244.1.37
IPs:
  IP:  10.244.1.37
Containers:
  main:
    Container ID:   containerd://682db4736c6ca9250024487bb377fc8859b97bf399d1dba59a554c4cc24ae21e
    Image:          nginx:1.26.2
    Image ID:       docker.io/library/nginx@sha256:2a7ba4bea138a22356b18add64cd93e808e3cb273051cdcb3a17aa4dbe58eec6
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Wed, 13 Nov 2024 02:05:18 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /etc/nginx/conf.d from config-volume (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-z7z2p (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  config-volume:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      nginx-config
    Optional:  false
  kube-api-access-z7z2p:
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
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  35s   default-scheduler  Successfully assigned default/nginx to k8s-node-01
  Normal  Pulled     34s   kubelet            Container image "nginx:1.26.2" already present on machine
  Normal  Created    34s   kubelet            Created container main
  Normal  Started    34s   kubelet            Started container main
sre@k8s-controller-01:~/api$ kubectl delete cm nginx-config
configmap "nginx-config" deleted
sre@k8s-controller-01:~/api$ kubectl delete pod nginx --force
Warning: Immediate deletion does not wait for confirmation that the running resource has been terminated. The resource may continue to run on the cluster indefinitely.
pod "nginx" force deleted
sre@k8s-controller-01:~/api$ 

