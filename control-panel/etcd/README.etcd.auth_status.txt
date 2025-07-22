
sre@k8s-controller-01:~$ ETCDCTL_API=3 sudo /home/sre/etcd/bin/etcdctl --endpoints=127.0.0.1:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/apiserver-etcd-client.crt --key /etc/kubernetes/pki/apiserver-etcd-client.key auth status
Authentication Status: false
AuthRevision: 1

