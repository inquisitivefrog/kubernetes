
Summary
-------
1. kubeadm is a separate package
2. kubeadm can call kubelet but it is does, nothing appears to be configured by default


sre@k8s-controller-01:~$ dpkg -l | grep kubeadm
hi  kubeadm                              1.28.14-2.1                             amd64        Command-line utility for administering a Kubernetes cluster

sre@k8s-controller-01:~$ find /var/lib/dpkg/ -print | grep kubeadm
/var/lib/dpkg/info/kubeadm.list
/var/lib/dpkg/info/kubeadm.md5sums

sre@k8s-controller-01:~$ sudo cat /var/lib/dpkg/info/kubeadm.list
/.
/lib
/lib/systemd
/lib/systemd/system
/lib/systemd/system/kubelet.service.d
/lib/systemd/system/kubelet.service.d/10-kubeadm.conf
/usr
/usr/bin
/usr/bin/kubeadm
/usr/share
/usr/share/doc
/usr/share/doc/kubeadm
/usr/share/doc/kubeadm/LICENSE
/usr/share/doc/kubeadm/README.md
sre@k8s-controller-01:~$ cat /lib/systemd/system/kubelet.service.d/10-kubeadm.conf 
# Note: This dropin only works with kubeadm and kubelet v1.11+
[Service]
Environment="KUBELET_KUBECONFIG_ARGS=--bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf"
Environment="KUBELET_CONFIG_ARGS=--config=/var/lib/kubelet/config.yaml"
# This is a file that "kubeadm init" and "kubeadm join" generates at runtime, populating the KUBELET_KUBEADM_ARGS variable dynamically
EnvironmentFile=-/var/lib/kubelet/kubeadm-flags.env
# This is a file that the user can use for overrides of the kubelet args as a last resort. Preferably, the user should use
# the .NodeRegistration.KubeletExtraArgs object in the configuration files instead. KUBELET_EXTRA_ARGS should be sourced from this file.
EnvironmentFile=-/etc/default/kubelet
ExecStart=
ExecStart=/usr/bin/kubelet $KUBELET_KUBECONFIG_ARGS $KUBELET_CONFIG_ARGS $KUBELET_KUBEADM_ARGS $KUBELET_EXTRA_ARGS

sre@k8s-controller-01:~$ cat /var/lib/kubelet/config.yaml
cat: /var/lib/kubelet/config.yaml: No such file or directory
sre@k8s-controller-01:~$ cat /var/lib/kubelet/kubeadm-flags.env
cat: /var/lib/kubelet/kubeadm-flags.env: No such file or directory
sre@k8s-controller-01:~$ cat /etc/default/kubelet
KUBELET_EXTRA_ARGS=
sre@k8s-controller-01:~$ cat /etc/kubernetes/bootstrap-kubelet.conf
cat: /etc/kubernetes/bootstrap-kubelet.conf: No such file or directory
sre@k8s-controller-01:~$ cat /etc/kubernetes/kubelet.conf
cat: /etc/kubernetes/kubelet.conf: No such file or directory

sre@k8s-controller-01:~$ grep kub /etc/passwd
sre@k8s-controller-01:~$ grep kub /etc/group
sre@k8s-controller-01:~$ 

