
sre@k8s-controller-01:~/api$ vi nginx-config-configmap.yml 
sre@k8s-controller-01:~/api$ cat nginx-config-configmap.yml 
apiVersion: v1
data:
  demo.conf: |
    server { 
      listen 80;
      listen [::]:80;
      server_name localhost;
      location / {
        root /usr/share/nginx/html;
        index index.html;
      }
      location /demo {
        root /usr/share/nginx/html;
        index return 203;
      }
    }
  #  location /demo {index return 200 \"hello world\"}"
kind: ConfigMap
metadata:
  name: nginx-config
  namespace: default
sre@k8s-controller-01:~/api$ vi nginx-html-configmap.yml 
sre@k8s-controller-01:~/api$ cat nginx-html-configmap.yml 
apiVersion: v1
data:
  demo.conf: |
    <!DOCTYPE html>
    <html>
    <head>
    <title>Welcome to nginx!</title>
    <style>
    html { color-scheme: light dark; }
    body { width: 35em; margin: 0 auto;
      font-family: Tahoma, Verdana, Arial, sans-serif; }
    </style>
    </head>
    <body>
    <h1>My Demo Page!</h1>
    <p>This is a demo page.</p>
    </body>
    </html>
kind: ConfigMap
metadata:
  name: nginx-html
  namespace: default
sre@k8s-controller-01:~/api$ vi pod.yml 
sre@k8s-controller-01:~/api$ cat pod.yml 
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
        - name: html-volume
          mountPath: /var/share/nginx/html/
  volumes:
    - name: config-volume
      configMap:
        name: nginx-config
    - name: html-volume
      configMap:
        name: nginx-html
  restartPolicy: Never

sre@k8s-controller-01:~/api$ kubectl apply -f nginx-config-configmap.yml 
configmap/nginx-config created
sre@k8s-controller-01:~/api$ kubectl apply -f nginx-html-configmap.yml 
configmap/nginx-html created
sre@k8s-controller-01:~/api$ kubectl apply -f pod.yml 
pod/nginx created
sre@k8s-controller-01:~/api$ 

sre@k8s-controller-01:~/api$ kubectl get cm 
NAME               DATA   AGE
kube-root-ca.crt   1      4d22h
nginx-config       1      60s
nginx-html         1      54s
sre@k8s-controller-01:~/api$ kubectl get cm nginx-config -o yaml
apiVersion: v1
data:
  demo.conf: "server { \n  listen 80;\n  listen [::]:80;\n  server_name localhost;\n
    \ location / {\n    root /usr/share/nginx/html;\n    index index.html;\n  }\n
    \ location /demo {\n    root /usr/share/nginx/html;\n    index return 203;\n  }\n}\n"
kind: ConfigMap
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","data":{"demo.conf":"server { \n  listen 80;\n  listen [::]:80;\n  server_name localhost;\n  location / {\n    root /usr/share/nginx/html;\n    index index.html;\n  }\n  location /demo {\n    root /usr/share/nginx/html;\n    index return 203;\n  }\n}\n"},"kind":"ConfigMap","metadata":{"annotations":{},"name":"nginx-config","namespace":"default"}}
  creationTimestamp: "2024-11-12T20:02:45Z"
  name: nginx-config
  namespace: default
  resourceVersion: "45581"
  uid: e0a557dd-e221-4d76-81ea-3a6a078a21e6
sre@k8s-controller-01:~/api$ kubectl get cm nginx-html -o yaml
apiVersion: v1
data:
  demo.conf: |
    <!DOCTYPE html>
    <html>
    <head>
    <title>Welcome to nginx!</title>
    <style>
    html { color-scheme: light dark; }
    body { width: 35em; margin: 0 auto;
      font-family: Tahoma, Verdana, Arial, sans-serif; }
    </style>
    </head>
    <body>
    <h1>My Demo Page!</h1>
    <p>This is a demo page.</p>
    </body>
    </html>
kind: ConfigMap
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","data":{"demo.conf":"\u003c!DOCTYPE html\u003e\n\u003chtml\u003e\n\u003chead\u003e\n\u003ctitle\u003eWelcome to nginx!\u003c/title\u003e\n\u003cstyle\u003e\nhtml { color-scheme: light dark; }\nbody { width: 35em; margin: 0 auto;\n  font-family: Tahoma, Verdana, Arial, sans-serif; }\n\u003c/style\u003e\n\u003c/head\u003e\n\u003cbody\u003e\n\u003ch1\u003eMy Demo Page!\u003c/h1\u003e\n\u003cp\u003eThis is a demo page.\u003c/p\u003e\n\u003c/body\u003e\n\u003c/html\u003e\n"},"kind":"ConfigMap","metadata":{"annotations":{},"name":"nginx-html","namespace":"default"}}
  creationTimestamp: "2024-11-12T20:02:51Z"
  name: nginx-html
  namespace: default
  resourceVersion: "45589"
  uid: c4d02b1f-25cc-4b12-81b2-3660578da234

sre@k8s-controller-01:~/api$ kubectl get pods -o wide
NAME    READY   STATUS    RESTARTS   AGE    IP            NODE          NOMINATED NODE   READINESS GATES
nginx   1/1     Running   0          104s   10.244.1.22   k8s-node-01   <none>           <none>
sre@k8s-controller-01:~/api$ kubectl describe pod nginx
Name:             nginx
Namespace:        default
Priority:         0
Service Account:  default
Node:             k8s-node-01/192.168.1.107
Start Time:       Tue, 12 Nov 2024 20:02:56 +0000
Labels:           <none>
Annotations:      <none>
Status:           Running
IP:               10.244.1.22
IPs:
  IP:  10.244.1.22
Containers:
  main:
    Container ID:   containerd://5973ba79930dc61bc9fbe21eab4b652892e0438ac115aa07cf4dc3c21f4260f8
    Image:          nginx:1.26.2
    Image ID:       docker.io/library/nginx@sha256:2a7ba4bea138a22356b18add64cd93e808e3cb273051cdcb3a17aa4dbe58eec6
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Tue, 12 Nov 2024 20:02:57 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /etc/nginx/conf.d from config-volume (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-r7445 (ro)
      /var/share/nginx/html/ from html-volume (rw)
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
  html-volume:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      nginx-html
    Optional:  false
  kube-api-access-r7445:
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
  Normal  Scheduled  110s  default-scheduler  Successfully assigned default/nginx to k8s-node-01
  Normal  Pulled     109s  kubelet            Container image "nginx:1.26.2" already present on machine
  Normal  Created    109s  kubelet            Created container main
  Normal  Started    109s  kubelet            Started container main
sre@k8s-controller-01:~/api$ kubectl logs nginx
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: /etc/nginx/conf.d/default.conf is not a file or does not exist
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2024/11/12 20:02:57 [notice] 1#1: using the "epoll" event method
2024/11/12 20:02:57 [notice] 1#1: nginx/1.26.2
2024/11/12 20:02:57 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2024/11/12 20:02:57 [notice] 1#1: OS: Linux 6.8.0-47-generic
2024/11/12 20:02:57 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2024/11/12 20:02:57 [notice] 1#1: start worker processes
2024/11/12 20:02:57 [notice] 1#1: start worker process 20
2024/11/12 20:02:57 [notice] 1#1: start worker process 21
sre@k8s-controller-01:~/api$ 

sre@k8s-controller-01:~/api$ curl http://10.244.1.22/
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
sre@k8s-controller-01:~/api$ 
sre@k8s-controller-01:~/api$ curl http://10.244.1.22/demo
<html>
<head><title>404 Not Found</title></head>
<body>
<center><h1>404 Not Found</h1></center>
<hr><center>nginx/1.26.2</center>
</body>
</html>
sre@k8s-controller-01:~/api$ kubectl logs nginx
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: /etc/nginx/conf.d/default.conf is not a file or does not exist
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2024/11/12 20:02:57 [notice] 1#1: using the "epoll" event method
2024/11/12 20:02:57 [notice] 1#1: nginx/1.26.2
2024/11/12 20:02:57 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2024/11/12 20:02:57 [notice] 1#1: OS: Linux 6.8.0-47-generic
2024/11/12 20:02:57 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2024/11/12 20:02:57 [notice] 1#1: start worker processes
2024/11/12 20:02:57 [notice] 1#1: start worker process 20
2024/11/12 20:02:57 [notice] 1#1: start worker process 21
10.244.0.0 - - [12/Nov/2024:20:05:27 +0000] "GET / HTTP/1.1" 200 615 "-" "curl/8.5.0" "-"
2024/11/12 20:05:31 [error] 21#21: *2 open() "/usr/share/nginx/html/demo" failed (2: No such file or directory), client: 10.244.0.0, server: localhost, request: "GET /demo HTTP/1.1", host: "10.244.1.22"
10.244.0.0 - - [12/Nov/2024:20:05:31 +0000] "GET /demo HTTP/1.1" 404 153 "-" "curl/8.5.0" "-"
sre@k8s-controller-01:~/api$ 

sre@k8s-controller-01:~/api$ kubectl delete cm nginx-html
configmap "nginx-html" deleted
sre@k8s-controller-01:~/api$ kubectl delete cm nginx-config
configmap "nginx-config" deleted
sre@k8s-controller-01:~/api$ kubectl delete pod nginx
pod "nginx" deleted
^Csre@k8s-controller-01:~/api$ kubectl delete pod nginx --force
Warning: Immediate deletion does not wait for confirmation that the running resource has been terminated. The resource may continue to run on the cluster indefinitely.
pod "nginx" force deleted


sre@k8s-controller-01:~/api$ cat configmap.yml 
apiVersion: v1
data:
  demo.conf: "server { listen 80; listen [::]:80; server_name localhost;}"
  #  location /demo {index return 200 \"hello world\"}"
kind: ConfigMap
metadata:
  name: nginx-config
  namespace: default

sre@k8s-controller-01:~/api$ cat pod.yml 
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
  volumes:
    - name: config-volume
      configMap:
        name: nginx-config
  restartPolicy: Never

sre@k8s-controller-01:~/api$ kubectl apply -f configmap.yml 
configmap/nginx-config created
sre@k8s-controller-01:~/api$ kubectl apply -f pod.yml 
pod/nginx created
sre@k8s-controller-01:~/api$ kubectl get pods
NAME    READY   STATUS    RESTARTS   AGE
nginx   1/1     Running   0          25s

sre@k8s-controller-01:~/api$ kubectl describe pod nginx
Name:             nginx
Namespace:        default
Priority:         0
Service Account:  default
Node:             k8s-node-01/192.168.1.107
Start Time:       Tue, 12 Nov 2024 19:19:59 +0000
Labels:           <none>
Annotations:      <none>
Status:           Running
IP:               10.244.1.15
IPs:
  IP:  10.244.1.15
Containers:
  main:
    Container ID:   containerd://6b4c1c8ad8c28c0e2552176a5b2edf632760dbc6936959afee343039472a8f0f
    Image:          nginx:1.26.2
    Image ID:       docker.io/library/nginx@sha256:2a7ba4bea138a22356b18add64cd93e808e3cb273051cdcb3a17aa4dbe58eec6
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Tue, 12 Nov 2024 19:19:59 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /etc/nginx/conf.d from config-volume (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-79pzn (ro)
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
  kube-api-access-79pzn:
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
  Normal  Scheduled  9s    default-scheduler  Successfully assigned default/nginx to k8s-node-01
  Normal  Pulled     9s    kubelet            Container image "nginx:1.26.2" already present on machine
  Normal  Created    9s    kubelet            Created container main
  Normal  Started    9s    kubelet            Started container main

sre@k8s-controller-01:~/api$ kubectl logs nginx
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: /etc/nginx/conf.d/default.conf is not a file or does not exist
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2024/11/12 19:19:59 [notice] 1#1: using the "epoll" event method
2024/11/12 19:19:59 [notice] 1#1: nginx/1.26.2
2024/11/12 19:19:59 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2024/11/12 19:19:59 [notice] 1#1: OS: Linux 6.8.0-47-generic
2024/11/12 19:19:59 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2024/11/12 19:19:59 [notice] 1#1: start worker processes
2024/11/12 19:19:59 [notice] 1#1: start worker process 20
2024/11/12 19:19:59 [notice] 1#1: start worker process 21

sre@k8s-controller-01:~/api$ kubectl exec -it nginx -- /bin/sh
# cd /etc/nginx/conf.d
# ls
demo.conf
# cat demo.conf
server { listen 80; listen [::]:80; server_name localhost;}# 
# mount | grep config
# df -h | grep config
# exit

sre@k8s-controller-01:~/api$ kubectl get pods -o wide
NAME    READY   STATUS    RESTARTS   AGE     IP            NODE          NOMINATED NODE   READINESS GATES
nginx   1/1     Running   0          6m43s   10.244.1.15   k8s-node-01   <none>           <none>
sre@k8s-controller-01:~/api$ curl http://10.244.1.15/
<html>
<head><title>404 Not Found</title></head>
<body>
<center><h1>404 Not Found</h1></center>
<hr><center>nginx/1.26.2</center>
</body>
</html>


