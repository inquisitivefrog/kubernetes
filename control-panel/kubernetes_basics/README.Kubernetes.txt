
1. a cluster exists consisting of 
   i. 1+ controller/master nodes, preferably 3 for High Availability
   ii. 1+ worker nodes, preferably 3+ to seamlessly manage traffic spikes

2. package kubeadm is needed on each node for
   i. kubeadm init: to start the cluster
   ii. kubeadm join: to add worker nodes
   iii. <TBD>: to add additional controller nodes

3. package kubelet is needed on each worker node
   i. kubelet service is started by kubeadm join
   ii. kubelet service state is visible from systemctl status/start/stop kubelet
   iii. kubelet service logs are visible from journalctl -xe --unit kubelet
   iv. kube-proxy service is also started by kubeadm join
   v. kube-proxy service is not managed by systemctl

4. kube-apiserver runs on controller nodes

5. kubectl is needed on each node because
   i. kubectl can execute from any node 
   ii. kubectl should be executed only from controller nodes
   iii. kubectl can also be executed from a JumpHost or laptop if
        a. kubeadm package is installed
        b. $HOME/.kube/config is configured from /etc/kubernetes/admin.conf

6. an etcd database is bundled with kubelet package
   i. this etcd instance is accessible locally or remotely using
      client tool etcdctl missing from kubelet package
   i. etcd can be downloaded from GitHub and built from scratch
   ii. etcd build requires package golang
   iii. etcd build also creates etcdctl client tool
   iv. the etcd database provided by kubelet lacks auth or users/members/roles
   v. key:value pairs stored in the etcd database provided by kubelet are
      accessible using etcdctl but TLS certificates are required
      see: kube-apiserver or etcd services for paths to these certificates
   vi. etcdctl client tool must be run as sudo in addition to using TLS

7. the etcd database bundled with kubelet package must be backed up regularly
   using etcdctl snapshot save with TLS certificates

8. the Kubernetes certificates expire after one year so  
   i. /etc/kubernetes/pki 
   ii. /etc/kubernetes/pki/etcd
   back them up regularly with tar cvf <file> /etc/kubernetes


