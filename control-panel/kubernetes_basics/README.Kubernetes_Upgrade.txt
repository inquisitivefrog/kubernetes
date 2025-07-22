
TBD
1. sudo kubeadm upgrade plan
2. sudo kubeadm upgrade apply v1.31.x

sre@k8s-controller-01:~$ kubectl get services -o wide
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE   SELECTOR
kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   21h   <none>
sre@k8s-controller-01:~$ kubectl get nodes -o wide
NAME                STATUS     ROLES           AGE   VERSION    INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
k8s-controller-01   NotReady   control-plane   21h   v1.28.14   192.168.1.105   <none>        Ubuntu 24.04.1 LTS   6.8.0-47-generic   containerd://1.7.12

sre@k8s-controller-01:~$ sudo kubeadm upgrade plan
[upgrade/config] Making sure the configuration is correct:
[upgrade/config] Reading configuration from the cluster...
[upgrade/config] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -o yaml'
[preflight] Running pre-flight checks.
[upgrade] Running cluster health checks
[upgrade/health] FATAL: [preflight] Some fatal errors occurred:
	[ERROR ControlPlaneNodesReady]: there are NotReady control-planes in the cluster: [k8s-controller-01]
[preflight] If you know what you are doing, you can make a check non-fatal with `--ignore-preflight-errors=...`
To see the stack trace of this error execute with --v=5 or higher

sre@k8s-controller-01:~$ kubectl -n kube-system get cm kubeadm-config -o yaml
apiVersion: v1
data:
  ClusterConfiguration: |
    apiServer:
      extraArgs:
        authorization-mode: Node,RBAC
      timeoutForControlPlane: 4m0s
    apiVersion: kubeadm.k8s.io/v1beta3
    certificatesDir: /etc/kubernetes/pki
    clusterName: kubernetes
    controlPlaneEndpoint: 192.168.1.105:6443
    controllerManager: {}
    dns: {}
    etcd:
      local:
        dataDir: /var/lib/etcd
    imageRepository: registry.k8s.io
    kind: ClusterConfiguration
    kubernetesVersion: v1.28.15
    networking:
      dnsDomain: cluster.local
      podSubnet: 10.244.0.0/16
      serviceSubnet: 10.96.0.0/12
    scheduler: {}
kind: ConfigMap
metadata:
  creationTimestamp: "2024-10-24T21:23:46Z"
  name: kubeadm-config
  namespace: kube-system
  resourceVersion: "235"
  uid: eeedced1-3ead-417e-8e29-ad93306da4a2

