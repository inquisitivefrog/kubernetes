
sre@k8s-controller-01:~$ ps -ef | grep etcd
root       14215   14012  9 21:23 ?        00:05:10 kube-apiserver --advertise-address=192.168.1.105 --allow-privileged=true --authorization-mode=Node,RBAC --client-ca-file=/etc/kubernetes/pki/ca.crt --enable-admission-plugins=NodeRestriction --enable-bootstrap-token-auth=true --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt --etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key --etc-servers=https://127.0.0.1:2379 --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key --requestheader-allowed-names=front-proxy-client --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --requestheader-extra-headers-prefix=X-Remote-Extra- --requestheader-group-headers=X-Remote-Group --requestheader-username-headers=X-Remote-User --secure-port=6443 --service-account-issuer=https://kubernetes.default.svc.cluster.local --service-account-key-file=/etc/kubernetes/pki/sa.pub --service-account-signing-key-file=/etc/kubernetes/pki/sa.key --service-cluster-ip-range=10.96.0.0/12 --tls-cert-file=/etc/kubernetes/pki/apiserver.crt --tls-private-key-file=/etc/kubernetes/pki/apiserver.key
root       14238   14011  4 21:23 ?        00:02:26 etcd --advertise-client-urls=https://192.168.1.105:2379 --cert-file=/etc/kubernetes/pki/etcd/server.crt --client-cert-auth=true --data-dir=/var/lib/etcd --experimental-initial-corrupt-check=true --experimental-watch-progress-notify-interval=5s --initial-advertise-peer-urls=https://192.168.1.105:2380 --initial-cluster=k8s-controller-01=https://192.168.1.105:2380 --key-file=/etc/kubernetes/pki/etcd/server.key --listen-client-urls=https://127.0.0.1:2379,https://192.168.1.105:2379 --listen-metrics-urls=http://127.0.0.1:2381 --listen-peer-urls=https://192.168.1.105:2380 --name=k8s-controller-01 --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt --peer-client-cert-auth=true --peer-key-file=/etc/kubernetes/pki/etcd/peer.key --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt --snapshot-count=10000 --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
sre        15601    2104  0 22:17 pts/0    00:00:00 grep --color=auto etcd

sre@k8s-controller-01:~$ systemctl status kubelet
● kubelet.service - kubelet: The Kubernetes Node Agent
     Loaded: loaded (/usr/lib/systemd/system/kubelet.service; enabled; preset: enabled)
    Drop-In: /usr/lib/systemd/system/kubelet.service.d
             └─10-kubeadm.conf
     Active: active (running) since Thu 2024-10-24 21:23:48 UTC; 54min ago
       Docs: https://kubernetes.io/docs/
   Main PID: 14362 (kubelet)
      Tasks: 11 (limit: 2276)
     Memory: 36.3M (peak: 37.3M)
        CPU: 2min 4.623s
     CGroup: /system.slice/kubelet.service
             └─14362 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config>

Oct 24 22:17:16 k8s-controller-01 kubelet[14362]: E1024 22:17:16.384316   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:21 k8s-controller-01 kubelet[14362]: E1024 22:17:21.386515   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:26 k8s-controller-01 kubelet[14362]: E1024 22:17:26.388643   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:31 k8s-controller-01 kubelet[14362]: E1024 22:17:31.390535   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:36 k8s-controller-01 kubelet[14362]: E1024 22:17:36.392786   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:41 k8s-controller-01 kubelet[14362]: E1024 22:17:41.394990   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:46 k8s-controller-01 kubelet[14362]: E1024 22:17:46.397570   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:51 k8s-controller-01 kubelet[14362]: E1024 22:17:51.399721   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:56 k8s-controller-01 kubelet[14362]: E1024 22:17:56.401927   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:18:01 k8s-controller-01 kubelet[14362]: E1024 22:18:01.403943   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
sre@k8s-controller-01:~$ journalctl -xe --unit kubelet
Oct 24 22:16:06 k8s-controller-01 kubelet[14362]: E1024 22:16:06.345961   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:16:11 k8s-controller-01 kubelet[14362]: E1024 22:16:11.347901   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:16:16 k8s-controller-01 kubelet[14362]: E1024 22:16:16.351494   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:16:21 k8s-controller-01 kubelet[14362]: E1024 22:16:21.357429   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:16:26 k8s-controller-01 kubelet[14362]: E1024 22:16:26.359681   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:16:31 k8s-controller-01 kubelet[14362]: E1024 22:16:31.361429   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:16:36 k8s-controller-01 kubelet[14362]: E1024 22:16:36.363536   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:16:41 k8s-controller-01 kubelet[14362]: E1024 22:16:41.365642   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:16:46 k8s-controller-01 kubelet[14362]: E1024 22:16:46.367992   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:16:51 k8s-controller-01 kubelet[14362]: E1024 22:16:51.369796   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:16:56 k8s-controller-01 kubelet[14362]: E1024 22:16:56.372771   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:01 k8s-controller-01 kubelet[14362]: E1024 22:17:01.374265   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:06 k8s-controller-01 kubelet[14362]: E1024 22:17:06.381057   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:11 k8s-controller-01 kubelet[14362]: E1024 22:17:11.382862   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:16 k8s-controller-01 kubelet[14362]: E1024 22:17:16.384316   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:21 k8s-controller-01 kubelet[14362]: E1024 22:17:21.386515   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:26 k8s-controller-01 kubelet[14362]: E1024 22:17:26.388643   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:31 k8s-controller-01 kubelet[14362]: E1024 22:17:31.390535   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:36 k8s-controller-01 kubelet[14362]: E1024 22:17:36.392786   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:41 k8s-controller-01 kubelet[14362]: E1024 22:17:41.394990   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:46 k8s-controller-01 kubelet[14362]: E1024 22:17:46.397570   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:51 k8s-controller-01 kubelet[14362]: E1024 22:17:51.399721   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:17:56 k8s-controller-01 kubelet[14362]: E1024 22:17:56.401927   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:18:01 k8s-controller-01 kubelet[14362]: E1024 22:18:01.403943   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:18:06 k8s-controller-01 kubelet[14362]: E1024 22:18:06.406581   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
Oct 24 22:18:11 k8s-controller-01 kubelet[14362]: E1024 22:18:11.408661   14362 kubelet.go:2874] "Container runtime network not ready" networkReady="N>
sre@k8s-controller-01:~$ 

