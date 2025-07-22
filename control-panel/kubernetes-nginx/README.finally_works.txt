
sre@k8s-controller-01:~/api$ vi nginx-html-configmap.yml 
sre@k8s-controller-01:~/api$ cat nginx-html-configmap.yml 
apiVersion: v1
data:
  demo.html: |
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

sre@k8s-controller-01:~/api$ vi nginx-pod.yml 
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
        - name: html-volume
          mountPath: /usr/share/nginx/html/
  volumes:
    - name: html-volume
      configMap:
        name: nginx-html
  restartPolicy: Never

sre@k8s-controller-01:~/api$ kubectl apply -f nginx-html-configmap.yml 
configmap/nginx-html created
sre@k8s-controller-01:~/api$ kubectl apply -f nginx-pod.yml 
pod/nginx created
sre@k8s-controller-01:~/api$ kubectl get pod
NAME    READY   STATUS    RESTARTS   AGE
nginx   1/1     Running   0          3s
sre@k8s-controller-01:~/api$ kubectl describe pod nginx
Name:             nginx
Namespace:        default
Priority:         0
Service Account:  default
Node:             k8s-node-01/192.168.1.107
Start Time:       Wed, 13 Nov 2024 01:54:52 +0000
Labels:           <none>
Annotations:      <none>
Status:           Running
IP:               10.244.1.34
IPs:
  IP:  10.244.1.34
Containers:
  main:
    Container ID:   containerd://364d6858a3d3311acfa04b05cabacf6746b769c70bd8e964679de60ff9a9be00
    Image:          nginx:1.26.2
    Image ID:       docker.io/library/nginx@sha256:2a7ba4bea138a22356b18add64cd93e808e3cb273051cdcb3a17aa4dbe58eec6
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Wed, 13 Nov 2024 01:54:53 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /usr/share/nginx/html/ from html-volume (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-vjs9k (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  html-volume:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      nginx-html
    Optional:  false
  kube-api-access-vjs9k:
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
  Normal  Scheduled  7s    default-scheduler  Successfully assigned default/nginx to k8s-node-01
  Normal  Pulled     7s    kubelet            Container image "nginx:1.26.2" already present on machine
  Normal  Created    7s    kubelet            Created container main
  Normal  Started    7s    kubelet            Started container main

sre@k8s-controller-01:~/api$ kubectl get pods -o wide
NAME    READY   STATUS    RESTARTS   AGE   IP            NODE          NOMINATED NODE   READINESS GATES
nginx   1/1     Running   0          17s   10.244.1.34   k8s-node-01   <none>           <none>
sre@k8s-controller-01:~/api$ curl http://10.244.1.34/demo.html
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
sre@k8s-controller-01:~/api$ kubectl logs nginx
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2024/11/13 01:54:53 [notice] 1#1: using the "epoll" event method
2024/11/13 01:54:53 [notice] 1#1: nginx/1.26.2
2024/11/13 01:54:53 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2024/11/13 01:54:53 [notice] 1#1: OS: Linux 6.8.0-47-generic
2024/11/13 01:54:53 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2024/11/13 01:54:53 [notice] 1#1: start worker processes
2024/11/13 01:54:53 [notice] 1#1: start worker process 29
2024/11/13 01:54:53 [notice] 1#1: start worker process 30
10.244.0.0 - - [13/Nov/2024:01:55:21 +0000] "GET /demo.html HTTP/1.1" 200 286 "-" "curl/8.5.0" "-"

