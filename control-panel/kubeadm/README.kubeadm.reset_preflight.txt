
sre@k8s-controller-01:~$ sudo kubeadm reset preflight --v=5
I1107 20:46:37.031681   18164 resetconfiguration.go:46] detected and using CRI socket: unix:///var/run/containerd/containerd.sock
I1107 20:46:37.033151   18164 reset.go:123] [reset] Could not obtain a client set from the kubeconfig file: /etc/kubernetes/admin.conf
I1107 20:46:37.033205   18164 reset.go:141] [reset] Using specified CRI socket: unix:///var/run/containerd/containerd.sock
W1107 20:46:37.033308   18164 preflight.go:56] [reset] WARNING: Changes made to this host by 'kubeadm init' or 'kubeadm join' will be reverted.
[reset] Are you sure you want to proceed? [y/N]: y
[preflight] Running pre-flight checks
I1107 20:46:44.071236   18164 removeetcdmember.go:60] [reset] Checking for etcd config
W1107 20:46:44.071247   18164 removeetcdmember.go:106] [reset] No kubeadm config, using etcd pod spec to get data directory
I1107 20:46:44.071376   18164 cleanupnode.go:66] [reset] Getting init system
[reset] Stopping the kubelet service
[reset] Unmounting mounted directories in "/var/lib/kubelet"
I1107 20:46:44.083629   18164 cleanupnode.go:97] [reset] Removing Kubernetes-managed containers
I1107 20:46:44.121881   18164 runtime.go:107] Attempting to remove container c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42
I1107 20:46:44.171031   18164 runtime.go:107] Attempting to remove container c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42
I1107 20:46:44.213377   18164 runtime.go:107] Attempting to remove container c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42
I1107 20:46:44.274644   18164 runtime.go:107] Attempting to remove container c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42
I1107 20:46:44.324556   18164 runtime.go:107] Attempting to remove container c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42
I1107 20:46:44.371291   18164 runtime.go:107] Attempting to remove container e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a
I1107 20:46:44.423663   18164 runtime.go:107] Attempting to remove container e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a
I1107 20:46:44.467828   18164 runtime.go:107] Attempting to remove container e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a
I1107 20:46:44.514352   18164 runtime.go:107] Attempting to remove container e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a
I1107 20:46:44.557442   18164 runtime.go:107] Attempting to remove container e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a
I1107 20:46:44.605009   18164 runtime.go:107] Attempting to remove container c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b
I1107 20:46:44.652715   18164 runtime.go:107] Attempting to remove container c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b
I1107 20:46:44.696663   18164 runtime.go:107] Attempting to remove container c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b
I1107 20:46:44.741345   18164 runtime.go:107] Attempting to remove container c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b
I1107 20:46:44.789962   18164 runtime.go:107] Attempting to remove container c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b
I1107 20:46:44.838161   18164 runtime.go:107] Attempting to remove container 6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84
I1107 20:46:44.890698   18164 runtime.go:107] Attempting to remove container 6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84
I1107 20:46:44.945836   18164 runtime.go:107] Attempting to remove container 6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84
I1107 20:46:44.994654   18164 runtime.go:107] Attempting to remove container 6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84
I1107 20:46:45.048484   18164 runtime.go:107] Attempting to remove container 6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84
W1107 20:46:45.101332   18164 cleanupnode.go:99] [reset] Failed to remove containers: [failed to stop running pod c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42: output: E1107 20:46:44.368842   18260 remote_runtime.go:222] "StopPodSandbox from runtime service failed" err=<
	rpc error: code = Unknown desc = failed to stop container "4eb9aada7a51bc4e034c8a01346fa1cf0507f508e47219656571cc7e4f464df9": failed to kill container "4eb9aada7a51bc4e034c8a01346fa1cf0507f508e47219656571cc7e4f464df9": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied
	: unknown
 > podSandboxID="c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42"
time="2024-11-07T20:46:44Z" level=fatal msg="stopping the pod sandbox \"c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42\": rpc error: code = Unknown desc = failed to stop container \"4eb9aada7a51bc4e034c8a01346fa1cf0507f508e47219656571cc7e4f464df9\": failed to kill container \"4eb9aada7a51bc4e034c8a01346fa1cf0507f508e47219656571cc7e4f464df9\": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied\n: unknown"
: exit status 1, failed to stop running pod e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a: output: E1107 20:46:44.603185   18312 remote_runtime.go:222] "StopPodSandbox from runtime service failed" err=<
	rpc error: code = Unknown desc = failed to stop container "dc97a878df0ae879016aa82cce1ed9e0730005899d066156e4316ca3eddedf0e": failed to kill container "dc97a878df0ae879016aa82cce1ed9e0730005899d066156e4316ca3eddedf0e": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied
	: unknown
 > podSandboxID="e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a"
time="2024-11-07T20:46:44Z" level=fatal msg="stopping the pod sandbox \"e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a\": rpc error: code = Unknown desc = failed to stop container \"dc97a878df0ae879016aa82cce1ed9e0730005899d066156e4316ca3eddedf0e\": failed to kill container \"dc97a878df0ae879016aa82cce1ed9e0730005899d066156e4316ca3eddedf0e\": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied\n: unknown"
: exit status 1, failed to stop running pod c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b: output: E1107 20:46:44.835871   18365 remote_runtime.go:222] "StopPodSandbox from runtime service failed" err=<
	rpc error: code = Unknown desc = failed to stop container "e90edfee884afa8af764e356a3239da9425ef9465a189a9fa206490446b2c77d": failed to kill container "e90edfee884afa8af764e356a3239da9425ef9465a189a9fa206490446b2c77d": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied
	: unknown
 > podSandboxID="c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b"
time="2024-11-07T20:46:44Z" level=fatal msg="stopping the pod sandbox \"c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b\": rpc error: code = Unknown desc = failed to stop container \"e90edfee884afa8af764e356a3239da9425ef9465a189a9fa206490446b2c77d\": failed to kill container \"e90edfee884afa8af764e356a3239da9425ef9465a189a9fa206490446b2c77d\": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied\n: unknown"
: exit status 1, failed to stop running pod 6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84: output: E1107 20:46:45.098751   18418 remote_runtime.go:222] "StopPodSandbox from runtime service failed" err=<
	rpc error: code = Unknown desc = failed to stop container "1f457ee8e043753b030ee61fb4698ee7985998fac3107279b9ee0f832c20666c": failed to kill container "1f457ee8e043753b030ee61fb4698ee7985998fac3107279b9ee0f832c20666c": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied
	: unknown
 > podSandboxID="6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84"
time="2024-11-07T20:46:45Z" level=fatal msg="stopping the pod sandbox \"6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84\": rpc error: code = Unknown desc = failed to stop container \"1f457ee8e043753b030ee61fb4698ee7985998fac3107279b9ee0f832c20666c\": failed to kill container \"1f457ee8e043753b030ee61fb4698ee7985998fac3107279b9ee0f832c20666c\": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied\n: unknown"
: exit status 1]
[reset] Deleting contents of directories: [/etc/kubernetes/manifests /var/lib/kubelet /etc/kubernetes/pki]
[reset] Deleting files: [/etc/kubernetes/admin.conf /etc/kubernetes/kubelet.conf /etc/kubernetes/bootstrap-kubelet.conf /etc/kubernetes/controller-manager.conf /etc/kubernetes/scheduler.conf]

The reset process does not clean CNI configuration. To do so, you must remove /etc/cni/net.d

The reset process does not reset or clean up iptables rules or IPVS tables.
If you wish to reset iptables, you must do so manually by using the "iptables" command.

If your cluster was setup to utilize IPVS, run ipvsadm --clear (or similar)
to reset your system's IPVS tables.

The reset process does not clean your kubeconfig files and you must remove them manually.
Please, check the contents of the $HOME/.kube/config file.
sre@k8s-controller-01:~$ 

sre@k8s-controller-01:~$ ls -l /var/lib/kubelet
total 0

sre@k8s-controller-01:~$ ls -l /etc/kubernetes/pki
total 0
sre@k8s-controller-01:~$ ls -l /etc/kubernetes/manifests/
total 0

sre@k8s-controller-01:~$ sudo ls -l /etc/cni/net.d
total 4
-rw-r--r-- 1 root root 292 Nov  7 19:55 10-flannel.conflist
