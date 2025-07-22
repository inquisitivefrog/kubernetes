
sre@k8s-controller-01:~$ kubectl get pods --all-namespaces=true -o wide
NAMESPACE     NAME                                        READY   STATUS    RESTARTS       AGE   IP              NODE                NOMINATED NODE   READINESS GATES
kube-system   coredns-5dd5756b68-2zrhr                    0/1     Pending   0              20h   <none>          <none>              <none>           <none>
kube-system   coredns-5dd5756b68-wcs5x                    0/1     Pending   0              20h   <none>          <none>              <none>           <none>
kube-system   etcd-k8s-controller-01                      1/1     Running   1 (129m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-apiserver-k8s-controller-01            1/1     Running   1 (129m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-controller-manager-k8s-controller-01   1/1     Running   1 (129m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-proxy-p4jmn                            1/1     Running   1 (129m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-scheduler-k8s-controller-01            1/1     Running   1 (129m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>

sre@k8s-controller-01:~$ kubectl --namespace=kube-system describe pod kube-scheduler-k8s-controller-01 
Name:                 kube-scheduler-k8s-controller-01
Namespace:            kube-system
Priority:             2000001000
Priority Class Name:  system-node-critical
Node:                 k8s-controller-01/192.168.1.105
Start Time:           Fri, 25 Oct 2024 16:05:58 +0000
Labels:               component=kube-scheduler
                      tier=control-plane
Annotations:          kubernetes.io/config.hash: b7a77facbd4cda1f4e5b81fbe8b8c173
                      kubernetes.io/config.mirror: b7a77facbd4cda1f4e5b81fbe8b8c173
                      kubernetes.io/config.seen: 2024-10-24T21:23:36.404728844Z
                      kubernetes.io/config.source: file
Status:               Running
SeccompProfile:       RuntimeDefault
IP:                   192.168.1.105
IPs:
  IP:           192.168.1.105
Controlled By:  Node/k8s-controller-01
Containers:
  kube-scheduler:
    Container ID:  containerd://264b87fc7577336d4fbc954c77a7a9fbac42cc4c493976a901fe97d14275d104
    Image:         registry.k8s.io/kube-scheduler:v1.28.15
    Image ID:      registry.k8s.io/kube-scheduler@sha256:82f4a42317450858d3d70fde5b3c0f22153ea155fd053f09865999a4661f2dca
    Port:          <none>
    Host Port:     <none>
    Command:
      kube-scheduler
      --authentication-kubeconfig=/etc/kubernetes/scheduler.conf
      --authorization-kubeconfig=/etc/kubernetes/scheduler.conf
      --bind-address=127.0.0.1
      --kubeconfig=/etc/kubernetes/scheduler.conf
      --leader-elect=true
    State:          Running
      Started:      Fri, 25 Oct 2024 16:06:00 +0000
    Last State:     Terminated
      Reason:       Unknown
      Exit Code:    255
      Started:      Thu, 24 Oct 2024 21:23:39 +0000
      Finished:     Fri, 25 Oct 2024 16:05:57 +0000
    Ready:          True
    Restart Count:  1
    Requests:
      cpu:        100m
    Liveness:     http-get https://127.0.0.1:10259/healthz delay=10s timeout=15s period=10s #success=1 #failure=8
    Startup:      http-get https://127.0.0.1:10259/healthz delay=10s timeout=15s period=10s #success=1 #failure=24
    Environment:  <none>
    Mounts:
      /etc/kubernetes/scheduler.conf from kubeconfig (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  kubeconfig:
    Type:          HostPath (bare host directory volume)
    Path:          /etc/kubernetes/scheduler.conf
    HostPathType:  FileOrCreate
QoS Class:         Burstable
Node-Selectors:    <none>
Tolerations:       :NoExecute op=Exists
Events:            <none>
sre@k8s-controller-01:~$ 

