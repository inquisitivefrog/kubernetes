see https://stackoverflow.com/questions/62408028/kubelet-failed-to-createpodsandbox-for-coredns-failed-to-set-bridge-addr-c

sre@k8s-controller-01:~$ systemctl status kubelet 
● kubelet.service - kubelet: The Kubernetes Node Agent
     Loaded: loaded (/usr/lib/systemd/system/kubelet.service; enabled; preset: enabled)
    Drop-In: /usr/lib/systemd/system/kubelet.service.d
             └─10-kubeadm.conf
     Active: active (running) since Wed 2024-10-23 17:14:52 UTC; 4min 19s ago
       Docs: https://kubernetes.io/docs/
   Main PID: 1159 (kubelet)
      Tasks: 12 (limit: 2276)
     Memory: 46.9M (peak: 47.4M)
        CPU: 16.659s
     CGroup: /system.slice/kubelet.service
             └─1159 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config=/var/lib/kubelet/config.yaml --container-runtime-endpoint=unix:///var/run/containerd/containerd.sock --pod-infra-container-imag>

Oct 23 17:19:02 k8s-controller-01 kubelet[1159]: E1023 17:19:02.113485    1159 remote_runtime.go:193] "RunPodSandbox from runtime service failed" err="rpc error: code = Unknown desc = failed to setup network for sandbox \"fb50576c03904b52b4703c84e24d9d993bd9723fa62d83883edc71a>
Oct 23 17:19:02 k8s-controller-01 kubelet[1159]: E1023 17:19:02.113538    1159 kuberuntime_sandbox.go:72] "Failed to create sandbox for pod" err="rpc error: code = Unknown desc = failed to setup network for sandbox \"fb50576c03904b52b4703c84e24d9d993bd9723fa62d83883edc71a21a8d>
Oct 23 17:19:02 k8s-controller-01 kubelet[1159]: E1023 17:19:02.113558    1159 kuberuntime_manager.go:1181] "CreatePodSandbox for pod failed" err="rpc error: code = Unknown desc = failed to setup network for sandbox \"fb50576c03904b52b4703c84e24d9d993bd9723fa62d83883edc71a21a8>
Oct 23 17:19:02 k8s-controller-01 kubelet[1159]: E1023 17:19:02.113606    1159 pod_workers.go:1300] "Error syncing pod, skipping" err="failed to \"CreatePodSandbox\" for \"coredns-5dd5756b68-z9vcd_kube-system(abd1d2ce-9493-46d4-a0c4-19e4acaef24a)\" with CreatePodSandboxError: >
Oct 23 17:19:05 k8s-controller-01 kubelet[1159]: I1023 17:19:05.040828    1159 scope.go:117] "RemoveContainer" containerID="fe6fc5d25cdfcf0b09402e387c03a9c99bb443be79d6f43d8f2e47488ab517f6"
Oct 23 17:19:05 k8s-controller-01 kubelet[1159]: E1023 17:19:05.041284    1159 pod_workers.go:1300] "Error syncing pod, skipping" err="failed to \"StartContainer\" for \"kube-flannel\" with CrashLoopBackOff: \"back-off 2m40s restarting failed container=kube-flannel pod=kube-fl>
Oct 23 17:19:10 k8s-controller-01 kubelet[1159]: E1023 17:19:10.118659    1159 remote_runtime.go:193] "RunPodSandbox from runtime service failed" err="rpc error: code = Unknown desc = failed to setup network for sandbox \"6ae97bf234d487f1cd005c46a798c2d351b64b789b80d0d439d4a5e>
Oct 23 17:19:10 k8s-controller-01 kubelet[1159]: E1023 17:19:10.118713    1159 kuberuntime_sandbox.go:72] "Failed to create sandbox for pod" err="rpc error: code = Unknown desc = failed to setup network for sandbox \"6ae97bf234d487f1cd005c46a798c2d351b64b789b80d0d439d4a5e95c18>
Oct 23 17:19:10 k8s-controller-01 kubelet[1159]: E1023 17:19:10.118730    1159 kuberuntime_manager.go:1181] "CreatePodSandbox for pod failed" err="rpc error: code = Unknown desc = failed to setup network for sandbox \"6ae97bf234d487f1cd005c46a798c2d351b64b789b80d0d439d4a5e95c1>
Oct 23 17:19:10 k8s-controller-01 kubelet[1159]: E1023 17:19:10.118777    1159 pod_workers.go:1300] "Error syncing pod, skipping" err="failed to \"CreatePodSandbox\" for \"coredns-5dd5756b68-vnt9b_kube-system(c4bb1b84-cd97-4c2b-8756-f325e34ca4e7)\" with CreatePodSandboxError: >
lines 1-23

sre@k8s-controller-01:~$ kubectl get pods --all-namespaces=true
NAMESPACE      NAME                                        READY   STATUS             RESTARTS        AGE
kube-flannel   kube-flannel-ds-j2qmt                       0/1     CrashLoopBackOff   12 (3m7s ago)   18h
kube-system    coredns-5dd5756b68-vnt9b                    0/1     Unknown            0               18h
kube-system    coredns-5dd5756b68-z9vcd                    0/1     Unknown            0               18h
kube-system    etcd-k8s-controller-01                      1/1     Running            3 (9m15s ago)   18h
kube-system    kube-apiserver-k8s-controller-01            1/1     Running            3 (9m15s ago)   18h
kube-system    kube-controller-manager-k8s-controller-01   1/1     Running            3 (9m15s ago)   18h
kube-system    kube-proxy-4wjrk                            1/1     Running            2 (9m15s ago)   18h
kube-system    kube-scheduler-k8s-controller-01            1/1     Running            3 (9m15s ago)   18h
kube-system    weave-net-lfgst                             2/2     Running            6 (8m42s ago)   17h

