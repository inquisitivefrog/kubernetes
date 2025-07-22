
sre@k8s-controller-01:~$ kubectl --namespace=kube-system get pods
NAME                                        READY   STATUS    RESTARTS       AGE
coredns-784d4fcc8d-7t49h                    1/1     Running   0              13m
coredns-784d4fcc8d-rbj59                    1/1     Running   0              13m
etcd-k8s-controller-01                      1/1     Running   29 (77m ago)   35d
kube-apiserver-k8s-controller-01            1/1     Running   29 (77m ago)   35d
kube-controller-manager-k8s-controller-01   1/1     Running   48 (77m ago)   35d
kube-proxy-9dj7f                            1/1     Running   13 (77m ago)   31d
kube-proxy-gghxc                            1/1     Running   0              62m
kube-proxy-vk8w5                            1/1     Running   15 (77m ago)   35d
kube-scheduler-k8s-controller-01            1/1     Running   51 (77m ago)   35d
metrics-server-596474b58-xmsln              1/1     Running   3 (77m ago)    3d6h
weave-net-6ql5s                             2/2     Running   0              62m
weave-net-cwdmr                             2/2     Running   26 (77m ago)   31d
weave-net-pqb6f                             2/2     Running   29 (77m ago)   35d
sre@k8s-controller-01:~$ kubectl --namespace=kube-system logs coredns-784d4fcc8d-7t49h
.:53
[INFO] plugin/reload: Running configuration SHA512 = 591cf328cccc12bc490481273e738df59329c62c0b729d94e8b61db9961c2fa5f046dd37f1cf888b953814040d180f52594972691cd6ff41be96639138a43908
CoreDNS-1.10.1
linux/amd64, go1.20, 055b2c3
sre@k8s-controller-01:~$ kubectl --namespace=kube-system logs coredns-784d4fcc8d-rbj59
.:53
[INFO] plugin/reload: Running configuration SHA512 = 591cf328cccc12bc490481273e738df59329c62c0b729d94e8b61db9961c2fa5f046dd37f1cf888b953814040d180f52594972691cd6ff41be96639138a43908
CoreDNS-1.10.1
linux/amd64, go1.20, 055b2c3


