
sre@k8s-controller-01:~$ kubectl --all-namespaces=true get deployments
NAMESPACE              NAME                                   READY   UP-TO-DATE   AVAILABLE   AGE
argocd                 argocd-applicationset-controller       1/1     1            1           105m
argocd                 argocd-dex-server                      1/1     1            1           105m
argocd                 argocd-notifications-controller        1/1     1            1           105m
argocd                 argocd-redis-ha-haproxy                2/3     3            2           105m
argocd                 argocd-repo-server                     1/2     2            1           105m
argocd                 argocd-server                          2/2     2            2           105m
default                kuard                                  1/1     1            1           9d
kube-system            coredns                                2/2     2            2           35d
kube-system            metrics-server                         1/1     1            1           27d
kubernetes-dashboard   kubernetes-dashboard-api               1/1     1            1           28d
kubernetes-dashboard   kubernetes-dashboard-auth              1/1     1            1           28d
kubernetes-dashboard   kubernetes-dashboard-kong              1/1     1            1           28d
kubernetes-dashboard   kubernetes-dashboard-metrics-scraper   1/1     1            1           28d
kubernetes-dashboard   kubernetes-dashboard-web               1/1     1            1           28d
projectcontour         contour                                2/2     2            2           17d

sre@k8s-controller-01:~$ kubectl rollout restart deployment coredns --namespace kube-system
deployment.apps/coredns restarted

sre@k8s-controller-01:~$ kubectl --namespace=kube-system get pods
NAME                                        READY   STATUS        RESTARTS       AGE
coredns-5dd5756b68-j5scx                    1/1     Terminating   15 (64m ago)   35d
coredns-5dd5756b68-jb9j9                    1/1     Terminating   0              18m
coredns-5dd5756b68-wjzc2                    1/1     Terminating   15 (64m ago)   35d
coredns-784d4fcc8d-7t49h                    1/1     Running       0              55s
coredns-784d4fcc8d-rbj59                    1/1     Running       0              55s
etcd-k8s-controller-01                      1/1     Running       29 (64m ago)   35d
kube-apiserver-k8s-controller-01            1/1     Running       29 (64m ago)   35d
kube-controller-manager-k8s-controller-01   1/1     Running       48 (64m ago)   35d
kube-proxy-9dj7f                            1/1     Running       13 (64m ago)   31d
kube-proxy-gghxc                            1/1     Running       0              49m
kube-proxy-vk8w5                            1/1     Running       15 (64m ago)   35d
kube-scheduler-k8s-controller-01            1/1     Running       51 (64m ago)   35d
metrics-server-596474b58-xmsln              1/1     Running       3 (64m ago)    3d6h
weave-net-6ql5s                             2/2     Running       0              49m
weave-net-cwdmr                             2/2     Running       26 (64m ago)   31d
weave-net-pqb6f                             2/2     Running       29 (64m ago)   35d

