
sre@k8s-controller-01:~$ sudo bash
root@k8s-controller-01:/etc# etcdctl
Command 'etcdctl' not found, but can be installed with:
snap install etcd         # version 3.4.22, or
apt  install etcd-client  # version 3.4.30-1ubuntu0.24.04.1
See 'snap info etcd' for additional versions.
root@k8s-controller-01:/etc# snap install etcd
2024-11-07T20:35:39Z INFO Waiting for automatic snapd restart...
etcd 3.4.22 from Canonical✓ installed
root@k8s-controller-01:/etc# which etcdctl
/snap/bin/etcdctl
root@k8s-controller-01:/etc# etcdctl version
etcdctl version: 3.4.22
API version: 3.4

