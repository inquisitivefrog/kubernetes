
sre@k8s-controller-01:~$ sudo kubeadm config images pull
I1024 21:31:43.048450   14727 version.go:256] remote version is much newer: v1.31.2; falling back to: stable-1.28
[config/images] Pulled registry.k8s.io/kube-apiserver:v1.28.15
[config/images] Pulled registry.k8s.io/kube-controller-manager:v1.28.15
[config/images] Pulled registry.k8s.io/kube-scheduler:v1.28.15
[config/images] Pulled registry.k8s.io/kube-proxy:v1.28.15
[config/images] Pulled registry.k8s.io/pause:3.9
[config/images] Pulled registry.k8s.io/etcd:3.5.15-0
[config/images] Pulled registry.k8s.io/coredns/coredns:v1.10.1
sre@k8s-controller-01:~$ 

