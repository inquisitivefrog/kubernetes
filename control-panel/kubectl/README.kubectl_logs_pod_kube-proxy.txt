
sre@k8s-controller-01:~$ kubectl get pods --all-namespaces=true -o wide
NAMESPACE     NAME                                        READY   STATUS    RESTARTS       AGE   IP              NODE                NOMINATED NODE   READINESS GATES
kube-system   coredns-5dd5756b68-2zrhr                    0/1     Pending   0              20h   <none>          <none>              <none>           <none>
kube-system   coredns-5dd5756b68-wcs5x                    0/1     Pending   0              20h   <none>          <none>              <none>           <none>
kube-system   etcd-k8s-controller-01                      1/1     Running   1 (128m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-apiserver-k8s-controller-01            1/1     Running   1 (128m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-controller-manager-k8s-controller-01   1/1     Running   1 (128m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-proxy-p4jmn                            1/1     Running   1 (128m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-scheduler-k8s-controller-01            1/1     Running   1 (128m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>

sre@k8s-controller-01:~$ kubectl --namespace=kube-system logs kube-proxy-p4jmn --container=kube-proxy
I1025 16:06:08.409876       1 server_others.go:69] "Using iptables proxy"
I1025 16:06:08.463579       1 node.go:141] Successfully retrieved node IP: 192.168.1.105
I1025 16:06:08.470852       1 conntrack.go:100] "Set sysctl" entry="net/netfilter/nf_conntrack_max" value=131072
I1025 16:06:08.470954       1 conntrack.go:52] "Setting nf_conntrack_max" nfConntrackMax=131072
I1025 16:06:08.471656       1 conntrack.go:100] "Set sysctl" entry="net/netfilter/nf_conntrack_tcp_timeout_close_wait" value=3600
I1025 16:06:08.574230       1 server.go:632] "kube-proxy running in dual-stack mode" primary ipFamily="IPv4"
I1025 16:06:08.585503       1 server_others.go:152] "Using iptables Proxier"
I1025 16:06:08.585578       1 server_others.go:421] "Detect-local-mode set to ClusterCIDR, but no cluster CIDR for family" ipFamily="IPv6"
I1025 16:06:08.585630       1 server_others.go:438] "Defaulting to no-op detect-local"
I1025 16:06:08.586691       1 proxier.go:250] "Setting route_localnet=1 to allow node-ports on localhost; to change this either disable iptables.localhostNodePorts (--iptables-localhost-nodeports) or set nodePortAddresses (--nodeport-addresses) to filter loopback addresses"
I1025 16:06:08.591636       1 server.go:846] "Version info" version="v1.28.15"
I1025 16:06:08.591719       1 server.go:848] "Golang settings" GOGC="" GOMAXPROCS="" GOTRACEBACK=""
I1025 16:06:08.600326       1 config.go:188] "Starting service config controller"
I1025 16:06:08.602621       1 shared_informer.go:311] Waiting for caches to sync for service config
I1025 16:06:08.602705       1 config.go:97] "Starting endpoint slice config controller"
I1025 16:06:08.602714       1 shared_informer.go:311] Waiting for caches to sync for endpoint slice config
I1025 16:06:08.605895       1 config.go:315] "Starting node config controller"
I1025 16:06:08.605936       1 shared_informer.go:311] Waiting for caches to sync for node config
I1025 16:06:08.702938       1 shared_informer.go:318] Caches are synced for endpoint slice config
I1025 16:06:08.703053       1 shared_informer.go:318] Caches are synced for service config
I1025 16:06:08.706363       1 shared_informer.go:318] Caches are synced for node config
sre@k8s-controller-01:~$ 

