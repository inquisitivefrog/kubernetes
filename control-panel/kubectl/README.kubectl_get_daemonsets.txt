
sre@k8s-controller-01:~$ kubectl get daemonsets --all-namespaces=true
NAMESPACE      NAME              DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
kube-flannel   kube-flannel-ds   2         2         2       2            2           <none>                   6d23h
kube-system    kube-proxy        2         2         2       2            2           kubernetes.io/os=linux   6d23h
kube-system    weave-net         2         2         2       2            2           <none>                   6d23h

sre@k8s-controller-01:~$ kubectl get daemonsets --all-namespaces=true -o wide
NAMESPACE      NAME              DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE     CONTAINERS        IMAGES                                                     SELECTOR
kube-flannel   kube-flannel-ds   2         2         2       2            2           <none>                   6d23h   kube-flannel      docker.io/flannel/flannel:v0.26.1                          app=flannel,k8s-app=flannel
kube-system    kube-proxy        2         2         2       2            2           kubernetes.io/os=linux   6d23h   kube-proxy        registry.k8s.io/kube-proxy:v1.28.15                        k8s-app=kube-proxy
kube-system    weave-net         2         2         2       2            2           <none>                   6d23h   weave,weave-npc   weaveworks/weave-kube:latest,weaveworks/weave-npc:latest   name=weave-net

