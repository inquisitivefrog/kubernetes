
sre@k8s-controller-01:~$ ps -ef | grep kubeadm
sre        14773    2104  0 21:32 pts/0    00:00:00 grep --color=auto kubeadm
sre@k8s-controller-01:~$ ps -ef | grep kubelet
root       14215   14012 10 21:23 ?        00:00:56 kube-apiserver --advertise-address=192.168.1.105 --allow-privileged=true --authorization-mode=Node,RBAC --client-ca-file=/etc/kubernetes/pki/ca.crt --enable-admission-plugins=NodeRestriction --enable-bootstrap-token-auth=true --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt --etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key --etcd-servers=https://127.0.0.1:2379 --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key --requestheader-allowed-names=front-proxy-client --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --requestheader-extra-headers-prefix=X-Remote-Extra- --requestheader-group-headers=X-Remote-Group --requestheader-username-headers=X-Remote-User --secure-port=6443 --service-account-issuer=https://kubernetes.default.svc.cluster.local --service-account-key-file=/etc/kubernetes/pki/sa.pub --service-account-signing-key-file=/etc/kubernetes/pki/sa.key --service-cluster-ip-range=10.96.0.0/12 --tls-cert-file=/etc/kubernetes/pki/apiserver.crt --tls-private-key-file=/etc/kubernetes/pki/apiserver.key
root       14362       1  4 21:23 ?        00:00:24 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config=/var/lib/kubelet/config.yaml --container-runtime-endpoint=unix:///var/run/containerd/containerd.sock --pod-infra-container-image=registry.k8s.io/pause:3.9
sre        14775    2104  0 21:32 pts/0    00:00:00 grep --color=auto kubelet
sre@k8s-controller-01:~$ ps -ef | grep kube-
root       14207   14013  0 21:23 ?        00:00:05 kube-scheduler --authentication-kubeconfig=/etc/kubernetes/scheduler.conf --authorization-kubeconfig=/etc/kubernetes/scheduler.conf --bind-address=127.0.0.1 --kubeconfig=/etc/kubernetes/scheduler.conf --leader-elect=true
root       14215   14012 10 21:23 ?        00:00:57 kube-apiserver --advertise-address=192.168.1.105 --allow-privileged=true --authorization-mode=Node,RBAC --client-ca-file=/etc/kubernetes/pki/ca.crt --enable-admission-plugins=NodeRestriction --enable-bootstrap-token-auth=true --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt --etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key --etcd-servers=https://127.0.0.1:2379 --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key --requestheader-allowed-names=front-proxy-client --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --requestheader-extra-headers-prefix=X-Remote-Extra- --requestheader-group-headers=X-Remote-Group --requestheader-username-headers=X-Remote-User --secure-port=6443 --service-account-issuer=https://kubernetes.default.svc.cluster.local --service-account-key-file=/etc/kubernetes/pki/sa.pub --service-account-signing-key-file=/etc/kubernetes/pki/sa.key --service-cluster-ip-range=10.96.0.0/12 --tls-cert-file=/etc/kubernetes/pki/apiserver.crt --tls-private-key-file=/etc/kubernetes/pki/apiserver.key
root       14254   14029  3 21:23 ?        00:00:19 kube-controller-manager --allocate-node-cidrs=true --authentication-kubeconfig=/etc/kubernetes/controller-manager.conf --authorization-kubeconfig=/etc/kubernetes/controller-manager.conf --bind-address=127.0.0.1 --client-ca-file=/etc/kubernetes/pki/ca.crt --cluster-cidr=10.244.0.0/16 --cluster-name=kubernetes --cluster-signing-cert-file=/etc/kubernetes/pki/ca.crt --cluster-signing-key-file=/etc/kubernetes/pki/ca.key --controllers=*,bootstrapsigner,tokencleaner --kubeconfig=/etc/kubernetes/controller-manager.conf --leader-elect=true --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --root-ca-file=/etc/kubernetes/pki/ca.crt --service-account-private-key-file=/etc/kubernetes/pki/sa.key --service-cluster-ip-range=10.96.0.0/12 --use-service-account-credentials=true
root       14448   14398  0 21:24 ?        00:00:00 /usr/local/bin/kube-proxy --config=/var/lib/kube-proxy/config.conf --hostname-override=k8s-controller-01
sre        14779    2104  0 21:32 pts/0    00:00:00 grep --color=auto kube-

sre@k8s-controller-01:~$ systemctl status kubelet
● kubelet.service - kubelet: The Kubernetes Node Agent
     Loaded: loaded (/usr/lib/systemd/system/kubelet.service; enabled; preset: enabled)
    Drop-In: /usr/lib/systemd/system/kubelet.service.d
             └─10-kubeadm.conf
     Active: active (running) since Thu 2024-10-24 21:23:48 UTC; 13min ago
       Docs: https://kubernetes.io/docs/
   Main PID: 14362 (kubelet)
      Tasks: 11 (limit: 2276)
     Memory: 35.3M (peak: 36.0M)
        CPU: 36.369s
     CGroup: /system.slice/kubelet.service
             └─14362 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config>

Oct 24 21:36:29 k8s-controller-01 kubelet[14362]: E1024 21:36:29.982900   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 21:36:34 k8s-controller-01 kubelet[14362]: E1024 21:36:34.985409   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 21:36:39 k8s-controller-01 kubelet[14362]: E1024 21:36:39.997263   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 21:36:45 k8s-controller-01 kubelet[14362]: E1024 21:36:44.999882   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 21:36:50 k8s-controller-01 kubelet[14362]: E1024 21:36:50.001871   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 21:36:55 k8s-controller-01 kubelet[14362]: E1024 21:36:55.003783   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 21:37:00 k8s-controller-01 kubelet[14362]: E1024 21:37:00.008712   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 21:37:05 k8s-controller-01 kubelet[14362]: E1024 21:37:05.010833   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 21:37:10 k8s-controller-01 kubelet[14362]: E1024 21:37:10.015131   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 21:37:15 k8s-controller-01 kubelet[14362]: E1024 21:37:15.016554   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
sre@k8s-controller-01:~$ 

