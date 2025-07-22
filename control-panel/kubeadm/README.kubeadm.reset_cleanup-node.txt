
sre@k8s-controller-01:~$ sudo kubeadm reset phase cleanup-node --v=5
I1107 20:39:39.758120   16068 resetconfiguration.go:46] detected and using CRI socket: unix:///var/run/containerd/containerd.sock
I1107 20:39:39.758196   16068 reset.go:123] [reset] Could not obtain a client set from the kubeconfig file: /etc/kubernetes/admin.conf
I1107 20:39:39.758203   16068 reset.go:141] [reset] Using specified CRI socket: unix:///var/run/containerd/containerd.sock
I1107 20:39:39.758228   16068 cleanupnode.go:66] [reset] Getting init system
[reset] Stopping the kubelet service
[reset] Unmounting mounted directories in "/var/lib/kubelet"
I1107 20:39:39.767332   16068 cleanupnode.go:97] [reset] Removing Kubernetes-managed containers
I1107 20:39:39.802645   16068 runtime.go:107] Attempting to remove container c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42
I1107 20:39:39.844354   16068 runtime.go:107] Attempting to remove container c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42
I1107 20:39:39.891757   16068 runtime.go:107] Attempting to remove container c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42
I1107 20:39:39.933942   16068 runtime.go:107] Attempting to remove container c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42
I1107 20:39:39.981905   16068 runtime.go:107] Attempting to remove container c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42
I1107 20:39:40.032343   16068 runtime.go:107] Attempting to remove container e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a
I1107 20:39:40.082275   16068 runtime.go:107] Attempting to remove container e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a
I1107 20:39:40.126052   16068 runtime.go:107] Attempting to remove container e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a
I1107 20:39:40.167320   16068 runtime.go:107] Attempting to remove container e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a
I1107 20:39:40.214189   16068 runtime.go:107] Attempting to remove container e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a
I1107 20:39:40.260241   16068 runtime.go:107] Attempting to remove container c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b
I1107 20:39:40.302378   16068 runtime.go:107] Attempting to remove container c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b
I1107 20:39:40.352163   16068 runtime.go:107] Attempting to remove container c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b
I1107 20:39:40.400284   16068 runtime.go:107] Attempting to remove container c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b
I1107 20:39:40.442704   16068 runtime.go:107] Attempting to remove container c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b
I1107 20:39:40.494528   16068 runtime.go:107] Attempting to remove container 6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84
I1107 20:39:40.549588   16068 runtime.go:107] Attempting to remove container 6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84
I1107 20:39:40.597326   16068 runtime.go:107] Attempting to remove container 6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84
I1107 20:39:40.653975   16068 runtime.go:107] Attempting to remove container 6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84
I1107 20:39:40.703590   16068 runtime.go:107] Attempting to remove container 6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84
I1107 20:39:40.751197   16068 runtime.go:107] Attempting to remove container be74bc7be32f7317ea9e5ed98bf66908338d022f978414e761e0d4aaac45df30
I1107 20:39:40.949981   16068 runtime.go:107] Attempting to remove container 100532932d3ddfb186160ee45f95671bfe23dec1bf9799e587a1136d3f38ea8f
I1107 20:39:41.137074   16068 runtime.go:107] Attempting to remove container f3e0cfefd37f21d2ab7ae5839c5c8f0a0f964e8b520416c2f81846cc346ab654
W1107 20:39:41.313159   16068 cleanupnode.go:99] [reset] Failed to remove containers: [failed to stop running pod c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42: output: E1107 20:39:40.030067   16122 remote_runtime.go:222] "StopPodSandbox from runtime service failed" err=<
	rpc error: code = Unknown desc = failed to stop container "4eb9aada7a51bc4e034c8a01346fa1cf0507f508e47219656571cc7e4f464df9": failed to kill container "4eb9aada7a51bc4e034c8a01346fa1cf0507f508e47219656571cc7e4f464df9": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied
	: unknown
 > podSandboxID="c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42"
time="2024-11-07T20:39:40Z" level=fatal msg="stopping the pod sandbox \"c57676832448769381086a962a9a1ef7695e481db925b90d1233f806a4f6de42\": rpc error: code = Unknown desc = failed to stop container \"4eb9aada7a51bc4e034c8a01346fa1cf0507f508e47219656571cc7e4f464df9\": failed to kill container \"4eb9aada7a51bc4e034c8a01346fa1cf0507f508e47219656571cc7e4f464df9\": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied\n: unknown"
: exit status 1, failed to stop running pod e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a: output: E1107 20:39:40.257528   16175 remote_runtime.go:222] "StopPodSandbox from runtime service failed" err=<
	rpc error: code = Unknown desc = failed to stop container "dc97a878df0ae879016aa82cce1ed9e0730005899d066156e4316ca3eddedf0e": failed to kill container "dc97a878df0ae879016aa82cce1ed9e0730005899d066156e4316ca3eddedf0e": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied
	: unknown
 > podSandboxID="e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a"
time="2024-11-07T20:39:40Z" level=fatal msg="stopping the pod sandbox \"e8f2a953f32d168ad66ec63069714623ef13b29f3c52424ffba2f7dd8e90ad6a\": rpc error: code = Unknown desc = failed to stop container \"dc97a878df0ae879016aa82cce1ed9e0730005899d066156e4316ca3eddedf0e\": failed to kill container \"dc97a878df0ae879016aa82cce1ed9e0730005899d066156e4316ca3eddedf0e\": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied\n: unknown"
: exit status 1, failed to stop running pod c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b: output: E1107 20:39:40.492363   16228 remote_runtime.go:222] "StopPodSandbox from runtime service failed" err=<
	rpc error: code = Unknown desc = failed to stop container "e90edfee884afa8af764e356a3239da9425ef9465a189a9fa206490446b2c77d": failed to kill container "e90edfee884afa8af764e356a3239da9425ef9465a189a9fa206490446b2c77d": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied
	: unknown
 > podSandboxID="c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b"
time="2024-11-07T20:39:40Z" level=fatal msg="stopping the pod sandbox \"c8eea72c6528ad5b5d33560bd63e40fadf132d38a70a671cb6734516d1260f9b\": rpc error: code = Unknown desc = failed to stop container \"e90edfee884afa8af764e356a3239da9425ef9465a189a9fa206490446b2c77d\": failed to kill container \"e90edfee884afa8af764e356a3239da9425ef9465a189a9fa206490446b2c77d\": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied\n: unknown"
: exit status 1, failed to stop running pod 6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84: output: E1107 20:39:40.748709   16297 remote_runtime.go:222] "StopPodSandbox from runtime service failed" err=<
	rpc error: code = Unknown desc = failed to stop container "1f457ee8e043753b030ee61fb4698ee7985998fac3107279b9ee0f832c20666c": failed to kill container "1f457ee8e043753b030ee61fb4698ee7985998fac3107279b9ee0f832c20666c": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied
	: unknown
 > podSandboxID="6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84"
time="2024-11-07T20:39:40Z" level=fatal msg="stopping the pod sandbox \"6de30902bdf9f42fbb278747561832a1f9b1c82ea22babd4e8690365c5a66a84\": rpc error: code = Unknown desc = failed to stop container \"1f457ee8e043753b030ee61fb4698ee7985998fac3107279b9ee0f832c20666c\": failed to kill container \"1f457ee8e043753b030ee61fb4698ee7985998fac3107279b9ee0f832c20666c\": unknown error after kill: runc did not terminate successfully: exit status 1: unable to signal init: permission denied\n: unknown"
: exit status 1]
[reset] Deleting contents of directories: [/etc/kubernetes/manifests /var/lib/kubelet /etc/kubernetes/pki]
[reset] Deleting files: [/etc/kubernetes/admin.conf /etc/kubernetes/kubelet.conf /etc/kubernetes/bootstrap-kubelet.conf /etc/kubernetes/controller-manager.conf /etc/kubernetes/scheduler.conf]
sre@k8s-controller-01:~$ 

sre@k8s-controller-01:~$ journalctl -xue --unit kubelet
Oct 23 17:04:14 k8s-node-01 systemd[1]: Started kubelet.service - kubelet: The Kubernetes Node Agent.
░░ Subject: A start job for unit kubelet.service has finished successfully
░░ Defined-By: systemd
░░ Support: http://www.ubuntu.com/support
░░ 
░░ A start job for unit kubelet.service has finished successfully.
░░ 
░░ The job identifier is 187.
Oct 23 17:04:14 k8s-node-01 (kubelet)[744]: kubelet.service: Referenced but unset environment variable evaluates to an empty string: KUBELET_KUBEADM_ARGS
Oct 23 17:04:17 k8s-node-01 kubelet[744]: E1023 17:04:17.884808     744 run.go:74] "command failed" err="failed to load kubelet config file, path: /var/lib/kubelet/config.ya>
Oct 23 17:04:17 k8s-node-01 systemd[1]: kubelet.service: Main process exited, code=exited, status=1/FAILURE
░░ Subject: Unit process exited
░░ Defined-By: systemd
░░ Support: http://www.ubuntu.com/support
░░ 
░░ An ExecStart= process belonging to unit kubelet.service has exited.
░░ 
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

