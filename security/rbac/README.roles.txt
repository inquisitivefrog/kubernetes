
sre@k8s-controller01:~/k8s-users$ kubectl get nodes
NAME               STATUS   ROLES           AGE   VERSION
k8s-controller01   Ready    control-plane   97m   v1.30.14
k8s-node01         Ready    <none>          87m   v1.30.14
k8s-node02         Ready    <none>          86m   v1.30.14
k8s-node03         Ready    <none>          87m   v1.30.14

sre@k8s-controller01:~/k8s-users$ kubectl label node k8s-node01 node-role.kubernetes.io/worker=worker
node/k8s-node01 labeled
sre@k8s-controller01:~/k8s-users$ kubectl label node k8s-node02 node-role.kubernetes.io/worker=worker
node/k8s-node02 labeled
sre@k8s-controller01:~/k8s-users$ kubectl label node k8s-node03 node-role.kubernetes.io/worker=worker
node/k8s-node03 labeled

sre@k8s-controller01:~/k8s-users$ kubectl get nodes
NAME               STATUS   ROLES           AGE   VERSION
k8s-controller01   Ready    control-plane   98m   v1.30.14
k8s-node01         Ready    worker          89m   v1.30.14
k8s-node02         Ready    worker          88m   v1.30.14
k8s-node03         Ready    worker          89m   v1.30.14

