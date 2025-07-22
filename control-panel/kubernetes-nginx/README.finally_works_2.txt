
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
        - name: config-volume
          mountPath: /etc/nginx/conf.d
            #- name: html-volume
            #mountPath: /usr/share/nginx/html/
  volumes:
    - name: config-volume
      configMap:
        name: nginx-config
          #- name: html-volume
          #configMap:
          #name: nginx-html
  restartPolicy: Never
sre@k8s-controller-01:~/api$ kubectl apply -f nginx-pod.yml
pod/nginx created
sre@k8s-controller-01:~/api$ kubectl get pods -o wide
NAME    READY   STATUS   RESTARTS   AGE   IP            NODE          NOMINATED NODE   READINESS GATES
nginx   0/1     Error    0          4s    10.244.1.35   k8s-node-01   <none>           <none>
sre@k8s-controller-01:~/api$ curl http://10.244.1.35/demo
curl: (7) Failed to connect to 10.244.1.35 port 80 after 3135 ms: Couldn't connect to server
sre@k8s-controller-01:~/api$ kubectl logs nginx
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: can not modify /etc/nginx/conf.d/default.conf (read-only file system?)
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2024/11/13 02:01:41 [emerg] 1#1: invalid return code "200l" in /etc/nginx/conf.d/default.conf:6
nginx: [emerg] invalid return code "200l" in /etc/nginx/conf.d/default.conf:6
sre@k8s-controller-01:~/api$ vi nginx-config-configmap.yml 
sre@k8s-controller-01:~/api$ kubectl delete cm nginx-config
configmap "nginx-config" deleted
sre@k8s-controller-01:~/api$ kubectl delete pod nginx --force
Warning: Immediate deletion does not wait for confirmation that the running resource has been terminated. The resource may continue to run on the cluster indefinitely.
pod "nginx" force deleted
sre@k8s-controller-01:~/api$ kubectl apply -f nginx-config-configmap.yml 
configmap/nginx-config created
sre@k8s-controller-01:~/api$ kubectl apply -f nginx-pod.yml 
pod/nginx created
sre@k8s-controller-01:~/api$ kubectl get pods -o wide
NAME    READY   STATUS    RESTARTS   AGE   IP            NODE          NOMINATED NODE   READINESS GATES
nginx   1/1     Running   0          7s    10.244.1.36   k8s-node-01   <none>           <none>
sre@k8s-controller-01:~/api$ curl http://10.244.1.36/demo
sre@k8s-controller-01:~/api$ kubectl logs nginx
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: can not modify /etc/nginx/conf.d/default.conf (read-only file system?)
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2024/11/13 02:02:52 [notice] 1#1: using the "epoll" event method
2024/11/13 02:02:52 [notice] 1#1: nginx/1.26.2
2024/11/13 02:02:52 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2024/11/13 02:02:52 [notice] 1#1: OS: Linux 6.8.0-47-generic
2024/11/13 02:02:52 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2024/11/13 02:02:52 [notice] 1#1: start worker processes
2024/11/13 02:02:52 [notice] 1#1: start worker process 21
2024/11/13 02:02:52 [notice] 1#1: start worker process 22
10.244.0.0 - - [13/Nov/2024:02:03:07 +0000] "GET /demo HTTP/1.1" 200 0 "-" "curl/8.5.0" "-"
sre@k8s-controller-01:~/api$ kubectl delete cm nginx-config
configmap "nginx-config" deleted
sre@k8s-controller-01:~/api$ kubectl delete pod nginx --force
Warning: Immediate deletion does not wait for confirmation that the running resource has been terminated. The resource may continue to run on the cluster indefinitely.
pod "nginx" force deleted

