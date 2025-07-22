
sre@k8s-controller-01:~$ kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://192.168.1.105:6443
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: kubernetes-admin
  name: kubernetes-admin@kubernetes
current-context: kubernetes-admin@kubernetes
kind: Config
preferences: {}
users:
- name: kubernetes-admin
  user:
    client-certificate-data: DATA+OMITTED
    client-key-data: DATA+OMITTED
sre@k8s-controller-01:~$ kubectl get services
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   20h
sre@k8s-controller-01:~$ kubectl get nodes -o wide
NAME                STATUS     ROLES           AGE   VERSION    INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
k8s-controller-01   NotReady   control-plane   20h   v1.28.14   192.168.1.105   <none>        Ubuntu 24.04.1 LTS   6.8.0-47-generic   containerd://1.7.12
sre@k8s-controller-01:~$ kubectl get pods --all-namespaces=true -o wide
NAMESPACE     NAME                                        READY   STATUS    RESTARTS       AGE   IP              NODE                NOMINATED NODE   READINESS GATES
kube-system   coredns-5dd5756b68-2zrhr                    0/1     Pending   0              20h   <none>          <none>              <none>           <none>
kube-system   coredns-5dd5756b68-wcs5x                    0/1     Pending   0              20h   <none>          <none>              <none>           <none>
kube-system   etcd-k8s-controller-01                      1/1     Running   1 (114m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-apiserver-k8s-controller-01            1/1     Running   1 (114m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-controller-manager-k8s-controller-01   1/1     Running   1 (114m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-proxy-p4jmn                            1/1     Running   1 (114m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-scheduler-k8s-controller-01            1/1     Running   1 (114m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
sre@k8s-controller-01:~$ 

