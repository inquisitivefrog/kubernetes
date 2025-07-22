
sre@k8s-controller-01:~$ kubectl get pods --all-namespaces=true 
NAMESPACE              NAME                                                    READY   STATUS    RESTARTS        AGE
kube-flannel           kube-flannel-ds-jlqqp                                   1/1     Running   6 (136m ago)    6d22h
kube-flannel           kube-flannel-ds-mqqdb                                   1/1     Running   2 (135m ago)    3d2h
kube-system            coredns-5dd5756b68-j5scx                                1/1     Running   5 (136m ago)    6d23h
kube-system            coredns-5dd5756b68-wjzc2                                1/1     Running   5 (136m ago)    6d23h
kube-system            etcd-k8s-controller-01                                  1/1     Running   19 (136m ago)   6d23h
kube-system            kube-apiserver-k8s-controller-01                        1/1     Running   19 (136m ago)   6d23h
kube-system            kube-controller-manager-k8s-controller-01               1/1     Running   20 (136m ago)   6d23h
kube-system            kube-proxy-9dj7f                                        1/1     Running   2 (135m ago)    3d2h
kube-system            kube-proxy-vk8w5                                        1/1     Running   5 (136m ago)    6d23h
kube-system            kube-scheduler-k8s-controller-01                        1/1     Running   20 (136m ago)   6d23h
kube-system            weave-net-cwdmr                                         2/2     Running   4 (135m ago)    3d2h
kube-system            weave-net-pqb6f                                         2/2     Running   11 (136m ago)   6d22h
kubernetes-dashboard   kubernetes-dashboard-api-8c6bf4788-c9px4                1/1     Running   0               50m
kubernetes-dashboard   kubernetes-dashboard-auth-cd58bb9b9-v9nts               1/1     Running   0               50m
kubernetes-dashboard   kubernetes-dashboard-kong-76dff7b666-jhkws              1/1     Running   0               50m
kubernetes-dashboard   kubernetes-dashboard-metrics-scraper-5f645f778c-zfl49   1/1     Running   0               50m
kubernetes-dashboard   kubernetes-dashboard-web-5bf7668478-4p42g               1/1     Running   0               50m

