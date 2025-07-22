
sre@k8s-controller-01:~$ ps -ef | grep kubelet
sre         3237    2104  0 18:02 pts/0    00:00:00 grep --color=auto kubelet
sre@k8s-controller-01:~$ ps -ef | grep kube-

sre@k8s-controller-01:~$ systemctl status kubelet
● kubelet.service - kubelet: The Kubernetes Node Agent
     Loaded: loaded (/usr/lib/systemd/system/kubelet.service; enabled; preset: enabled)
    Drop-In: /usr/lib/systemd/system/kubelet.service.d
             └─10-kubeadm.conf
     Active: activating (auto-restart) (Result: exit-code) since Thu 2024-10-24 21:00:16 UTC; 6s ago
       Docs: https://kubernetes.io/docs/
    Process: 12207 ExecStart=/usr/bin/kubelet $KUBELET_KUBECONFIG_ARGS $KUBELET_CONFIG_ARGS $KUBELET_KUBEADM_ARGS $KUBELE>
   Main PID: 12207 (code=exited, status=1/FAILURE)
        CPU: 241ms


