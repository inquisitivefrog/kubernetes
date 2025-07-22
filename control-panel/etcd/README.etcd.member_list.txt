
sre@k8s-controller-01:~$ ETCDCTL_API=3 sudo /home/sre/etcd/bin/etcdctl --endpoints=127.0.0.1:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/apiserver-etcd-client.crt --key /etc/kubernetes/pki/apiserver-etcd-client.key member list
d6b41b608ff76c2, started, k8s-controller-01, https://192.168.1.105:2380, https://192.168.1.105:2379, false
sre@k8s-controller-01:~$ 
