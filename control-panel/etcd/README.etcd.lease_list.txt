
sre@k8s-controller-01:~$ ETCDCTL_API=3 sudo /home/sre/etcd/bin/etcdctl --endpoints=127.0.0.1:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/apiserver-etcd-client.crt --key /etc/kubernetes/pki/apiserver-etcd-client.key lease list
found 14 leases
76c292c46d7ba253
76c292c46d7ba280
76c292c46d7b603f
76c292c46d7b65f9
76c292c46d7b6bc3
76c292c46d7b7199
76c292c46d7b7760
76c292c46d7b7d29
76c292c46d7b82f9
76c292c46d7b88c7
76c292c46d7b8e8c
76c292c46d7b9456
76c292c46d7b9a34
76c292c46d7ba00f
sre@k8s-controller-01:~$
