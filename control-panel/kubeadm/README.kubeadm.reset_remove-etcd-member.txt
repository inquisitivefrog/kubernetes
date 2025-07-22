
sre@k8s-controller-01:~$ sudo kubeadm reset phase remove-etcd-member
W1107 20:43:57.291819   17491 removeetcdmember.go:106] [reset] No kubeadm config, using etcd pod spec to get data directory
sre@k8s-controller-01:~$ sudo kubeadm reset phase remove-etcd-member --v=5
I1107 20:44:04.815740   17532 reset.go:123] [reset] Could not obtain a client set from the kubeconfig file: /etc/kubernetes/admin.conf
I1107 20:44:04.815797   17532 removeetcdmember.go:60] [reset] Checking for etcd config
W1107 20:44:04.815807   17532 removeetcdmember.go:106] [reset] No kubeadm config, using etcd pod spec to get data directory

sre@k8s-controller-01:~$ ps -ef | grep kube
root        1373    1065  9 19:54 ?        00:04:54 kube-apiserver --advertise-address=192.168.1.105 --allow-privileged=true --authorization-mode=Node,RBAC --client-ca-file=/etc/kubernetes/pki/ca.crt --enable-admission-plugins=NodeRestriction --enable-bootstrap-token-auth=true --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt --etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key --etcd-servers=https://127.0.0.1:2379 --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key --requestheader-allowed-names=front-proxy-client --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --requestheader-extra-headers-prefix=X-Remote-Extra- --requestheader-group-headers=X-Remote-Group --requestheader-username-headers=X-Remote-User --secure-port=6443 --service-account-issuer=https://kubernetes.default.svc.cluster.local --service-account-key-file=/etckubernetes/pki/sa.pub --service-account-signing-key-file=/etc/kubernetes/pki/sa.key --service-cluster-ip-range=10.96.0.0/12 --tls-cert-file=/etc/kubernetes/pki/apiserver.crt --tls-private-key-file=/etc/kubernetes/pki/apiserver.key

sre@k8s-controller-01:~$ systemctl status kubelet
○ kubelet.service - kubelet: The Kubernetes Node Agent
     Loaded: loaded (/usr/lib/systemd/system/kubelet.service; enabled; preset: enabled)
    Drop-In: /usr/lib/systemd/system/kubelet.service.d
             └─10-kubeadm.conf
     Active: inactive (dead) since Thu 2024-11-07 20:29:35 UTC; 15min ago
   Duration: 35min 5.733s
       Docs: https://kubernetes.io/docs/
   Main PID: 823 (code=exited, status=0/SUCCESS)
        CPU: 1min 26.616s

Nov 07 19:55:24 k8s-controller-01 kubelet[823]: E1107 19:55:24.669243     823 kuberuntime_sandbox.go:72] "Failed to create sandbox for pod" err="rpc error: code = Unknown de>
Nov 07 19:55:24 k8s-controller-01 kubelet[823]: E1107 19:55:24.669263     823 kuberuntime_manager.go:1181] "CreatePodSandbox for pod failed" err="rpc error: code = Unknown d>
Nov 07 19:55:24 k8s-controller-01 kubelet[823]: E1107 19:55:24.669308     823 pod_workers.go:1300] "Error syncing pod, skipping" err="failed to \"CreatePodSandbox\" for \"co>
Nov 07 19:55:38 k8s-controller-01 kubelet[823]: I1107 19:55:38.902632     823 pod_startup_latency_tracker.go:102] "Observed pod startup duration" pod="kube-system/coredns-5d>
Nov 07 19:55:39 k8s-controller-01 kubelet[823]: I1107 19:55:39.853566     823 pod_startup_latency_tracker.go:102] "Observed pod startup duration" pod="kube-system/coredns-5d>
Nov 07 20:29:35 k8s-controller-01 systemd[1]: Stopping kubelet.service - kubelet: The Kubernetes Node Agent...
Nov 07 20:29:35 k8s-controller-01 kubelet[823]: I1107 20:29:35.772573     823 dynamic_cafile_content.go:171] "Shutting down controller" name="client-ca-bundle::/etc/kubernet>

