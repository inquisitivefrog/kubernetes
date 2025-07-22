
sre@k8s-controller-01:~/api$ kubectl delete pod nginx
pod "nginx" deleted
^Csre@k8s-controller-01:~/api$ kubectl delete pod nginx --force
Warning: Immediate deletion does not wait for confirmation that the running resource has been terminated. The resource may continue to run on the cluster indefinitely.
pod "nginx" force deleted

sre@k8s-controller-01:~/api$ kubectl apply -f pod.yml 
pod/nginx created
sre@k8s-controller-01:~/api$ kubectl logs pod nginx
Error from server (NotFound): pods "pod" not found

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
2024/11/11 23:17:22 [notice] 1#1: using the "epoll" event method
2024/11/11 23:17:22 [notice] 1#1: nginx/1.26.2
2024/11/11 23:17:22 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2024/11/11 23:17:22 [notice] 1#1: OS: Linux 6.8.0-47-generic
2024/11/11 23:17:22 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2024/11/11 23:17:22 [notice] 1#1: start worker processes
2024/11/11 23:17:22 [notice] 1#1: start worker process 28
2024/11/11 23:17:22 [notice] 1#1: start worker process 29

sre@k8s-controller-01:~/api$ kubectl exec -it nginx -- /bin/sh
# exit

