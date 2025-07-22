
tim@Tims-MBP pods % cat pod-nginx.yml 
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
    - name: main
      image: nginx:1.26.2
    - name: sidecar
      image: busybox
      command: ["/bin/sh", "-c", "sleep 3600"]

tim@Tims-MBP pods % kubectl apply -f pod-nginx.yml
pod/nginx created

tim@Tims-MBP pods % kubectl config view | grep namespace
    namespace: default
tim@Tims-MBP pods % kubectl --namespace=default get pods -o wide
NAME    READY   STATUS    RESTARTS   AGE     IP         NODE             NOMINATED NODE   READINESS GATES
nginx   2/2     Running   0          3m37s   10.1.0.7   docker-desktop   <none>           <none>

tim@Tims-MBP pods % kubectl get pods --all-namespaces
NAMESPACE     NAME                                     READY   STATUS    RESTARTS   AGE
default       nginx                                    2/2     Running   0          107s
kube-system   coredns-7db6d8ff4d-8488v                 1/1     Running   0          27m
kube-system   coredns-7db6d8ff4d-p7f2n                 1/1     Running   0          27m
kube-system   etcd-docker-desktop                      1/1     Running   0          27m
kube-system   kube-apiserver-docker-desktop            1/1     Running   0          27m
kube-system   kube-controller-manager-docker-desktop   1/1     Running   0          27m
kube-system   kube-proxy-w9qcj                         1/1     Running   0          27m
kube-system   kube-scheduler-docker-desktop            1/1     Running   0          28m
kube-system   storage-provisioner                      1/1     Running   0          27m
kube-system   vpnkit-controller                        1/1     Running   0          27m

tim@Tims-MBP pods % kubectl describe pod nginx
Name:             nginx
Namespace:        default
Priority:         0
Service Account:  default
Node:             docker-desktop/192.168.65.3
Start Time:       Thu, 31 Oct 2024 14:47:52 -0700
Labels:           <none>
Annotations:      <none>
Status:           Running
IP:               10.1.0.7
IPs:
  IP:  10.1.0.7
Containers:
  main:
    Container ID:   docker://fd316df3e9c1e3e0a6efb95dce6613787933c6f60e5f22b84d6c5462129199cd
    Image:          nginx:1.26.2
    Image ID:       docker-pullable://nginx@sha256:2a7ba4bea138a22356b18add64cd93e808e3cb273051cdcb3a17aa4dbe58eec6
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Thu, 31 Oct 2024 14:47:52 -0700
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-4cgsr (ro)
  sidecar:
    Container ID:  docker://5c92c8108f22d003a762ec8423859dad7e053c75cbafc745cbbfe70dd5ced958
    Image:         busybox
    Image ID:      docker-pullable://busybox@sha256:768e5c6f5cb6db0794eec98dc7a967f40631746c32232b78a3105fb946f3ab83
    Port:          <none>
    Host Port:     <none>
    Command:
      /bin/sh
      -c
      sleep 3600
    State:          Running
      Started:      Thu, 31 Oct 2024 14:47:55 -0700
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-4cgsr (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-4cgsr:
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
  Normal  Scheduled  14s   default-scheduler  Successfully assigned default/nginx to docker-desktop
  Normal  Pulled     14s   kubelet            Container image "nginx:1.26.2" already present on machine
  Normal  Created    14s   kubelet            Created container main
  Normal  Started    14s   kubelet            Started container main
  Normal  Pulling    14s   kubelet            Pulling image "busybox"
  Normal  Pulled     12s   kubelet            Successfully pulled image "busybox" in 1.989s (1.989s including waiting). Image size: 2166802 bytes.
  Normal  Created    11s   kubelet            Created container sidecar
  Normal  Started    11s   kubelet            Started container sidecar

tim@Tims-MBP pods % kubectl --namespace=default exec -it --container=main nginx -- /bin/sh
# ps -ef
/bin/sh: 1: ps: not found
# ss -at  
/bin/sh: 33: ss: not found
# echo /proc/[0-9]
/proc/1
# echo /proc/[0-9][0-9]
/proc/29 /proc/30 /proc/31 /proc/32 /proc/33 /proc/34 /proc/35 /proc/36 /proc/43
# cat /proc/1/cmdline
nginx: master process nginx -g daemon off;# 
# cat /proc/29/cmdline
nginx: worker process# 
# cat /proc/30/cmdline
nginx: worker process# 
# cat /proc/31/cmdline
nginx: worker process# 
# cat /proc/32/cmdline
nginx: worker process# 
# cat /proc/33/cmdline
nginx: worker process# 
# cat /proc/34/cmdline

# cat /etc/nginx/nginx.conf

user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}

# cat /usr/share/nginx/html/index.html
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

# curl http://localhost:80/
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

# df -h
Filesystem      Size  Used Avail Use% Mounted on
overlay          59G  3.5G   52G   7% /
tmpfs            64M     0   64M   0% /dev
shm              64M     0   64M   0% /dev/shm
/dev/vda1        59G  3.5G   52G   7% /etc/hosts
tmpfs           7.6G   12K  7.6G   1% /run/secrets/kubernetes.io/serviceaccount
tmpfs           3.9G     0  3.9G   0% /proc/acpi
tmpfs           3.9G     0  3.9G   0% /sys/firmware

# cat /etc/hosts
# Kubernetes-managed hosts file.
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
fe00::0	ip6-mcastprefix
fe00::1	ip6-allnodes
fe00::2	ip6-allrouters
10.1.0.7	nginx

# ls -la /run/secrets/kubernetes.io/serviceaccount
total 4
drwxrwxrwt 3 root root  140 Oct 31 21:47 .
drwxr-xr-x 3 root root 4096 Oct 31 21:47 ..
drwxr-xr-x 2 root root  100 Oct 31 21:47 ..2024_10_31_21_47_52.2787081760
lrwxrwxrwx 1 root root   32 Oct 31 21:47 ..data -> ..2024_10_31_21_47_52.2787081760
lrwxrwxrwx 1 root root   13 Oct 31 21:47 ca.crt -> ..data/ca.crt
lrwxrwxrwx 1 root root   16 Oct 31 21:47 namespace -> ..data/namespace
lrwxrwxrwx 1 root root   12 Oct 31 21:47 token -> ..data/token

# env | sort
DYNPKG_RELEASE=2~bookworm
HOME=/root
HOSTNAME=nginx
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_PORT_443_TCP_PORT=443
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_SERVICE_HOST=10.96.0.1
KUBERNETES_SERVICE_PORT=443
KUBERNETES_SERVICE_PORT_HTTPS=443
NGINX_VERSION=1.26.2
NJS_RELEASE=1~bookworm
NJS_VERSION=0.8.5
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PKG_RELEASE=1~bookworm
PWD=/
TERM=xterm

tim@Tims-MBP pods % kubectl --namespace=default logs nginx --container=main
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2024/10/31 21:47:52 [notice] 1#1: using the "epoll" event method
2024/10/31 21:47:52 [notice] 1#1: nginx/1.26.2
2024/10/31 21:47:52 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2024/10/31 21:47:52 [notice] 1#1: OS: Linux 6.10.4-linuxkit
2024/10/31 21:47:52 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2024/10/31 21:47:52 [notice] 1#1: start worker processes
2024/10/31 21:47:52 [notice] 1#1: start worker process 29
2024/10/31 21:47:52 [notice] 1#1: start worker process 30
2024/10/31 21:47:52 [notice] 1#1: start worker process 31
2024/10/31 21:47:52 [notice] 1#1: start worker process 32
2024/10/31 21:47:52 [notice] 1#1: start worker process 33
2024/10/31 21:47:52 [notice] 1#1: start worker process 34
2024/10/31 21:47:52 [notice] 1#1: start worker process 35
2024/10/31 21:47:52 [notice] 1#1: start worker process 36
tim@Tims-MBP pods % kubectl --namespace=default logs nginx --container=sidecar
tim@Tims-MBP pods % 

# ls -l /var/log/nginx
total 0
lrwxrwxrwx 1 root root 11 Oct 17 01:14 access.log -> /dev/stdout
lrwxrwxrwx 1 root root 11 Oct 17 01:14 error.log -> /dev/stderr
# 

nginx: worker process# 
# cat /proc/35/cmdline
nginx: worker process# 
# cat /proc/36/cmdline
nginx: worker process# 
# cat /proc/43/cmdline
/bin/sh# 

# cat /etc/nginx/nginx.conf

user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}

# which curl
/usr/bin/curl
# curl http://localhost/
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

# exit

------------------------------------
tim@Tims-MBP pods % kubectl get pods
NAME      READY   STATUS    RESTARTS   AGE
nginx     2/2     Running   0          43m

tim@Tims-MBP pods % kubectl delete pod nginx
pod "nginx" deleted
tim@Tims-MBP pods % kubectl get pods          
No resources found in default namespace.


