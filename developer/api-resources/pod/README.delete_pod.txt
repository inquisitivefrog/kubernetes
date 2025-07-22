
sre@k8s-controller-01:~/api$ kubectl delete pod nginx
pod "nginx" deleted

^Csre@k8s-controller-01:~/api$ kubectl get pods
NAME    READY   STATUS        RESTARTS   AGE
nginx   1/2     Terminating   7          17m
sre@k8s-controller-01:~/api$ kubectl get pods
NAME    READY   STATUS        RESTARTS   AGE
nginx   1/2     Terminating   7          19m

sre@k8s-controller-01:~/api$ kubectl delete pod nginx --force
Warning: Immediate deletion does not wait for confirmation that the running resource has been terminated. The resource may continue to run on the cluster indefinitely.
pod "nginx" force deleted
sre@k8s-controller-01:~/api$ kubectl get pods
No resources found in default namespace.
sre@k8s-controller-01:~/api$ 

