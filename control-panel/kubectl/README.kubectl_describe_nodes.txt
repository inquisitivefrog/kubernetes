
sre@k8s-controller-01:~$ kubectl describe nodes k8s-node-01
Name:               k8s-node-01
Roles:              <none>
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=k8s-node-01
                    kubernetes.io/os=linux
Annotations:        flannel.alpha.coreos.com/backend-data: {"VNI":1,"VtepMAC":"b2:c9:e2:d4:50:3b"}
                    flannel.alpha.coreos.com/backend-type: vxlan
                    flannel.alpha.coreos.com/kube-subnet-manager: true
                    flannel.alpha.coreos.com/public-ip: 192.168.1.107
                    node.alpha.kubernetes.io/ttl: 0
                    volumes.kubernetes.io/controller-managed-attach-detach: true
CreationTimestamp:  Mon, 11 Nov 2024 17:54:04 +0000
Taints:             <none>
Unschedulable:      false
Lease:
  HolderIdentity:  k8s-node-01
  AcquireTime:     <unset>
  RenewTime:       Thu, 14 Nov 2024 20:22:03 +0000
Conditions:
  Type                 Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----                 ------  -----------------                 ------------------                ------                       -------
  NetworkUnavailable   False   Thu, 14 Nov 2024 18:00:05 +0000   Thu, 14 Nov 2024 18:00:05 +0000   WeaveIsUp                    Weave pod has set this
  MemoryPressure       False   Thu, 14 Nov 2024 20:17:01 +0000   Thu, 14 Nov 2024 17:59:56 +0000   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure         False   Thu, 14 Nov 2024 20:17:01 +0000   Thu, 14 Nov 2024 17:59:56 +0000   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure          False   Thu, 14 Nov 2024 20:17:01 +0000   Thu, 14 Nov 2024 17:59:56 +0000   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready                True    Thu, 14 Nov 2024 20:17:01 +0000   Thu, 14 Nov 2024 17:59:56 +0000   KubeletReady                 kubelet is posting ready status. AppArmor enabled
Addresses:
  InternalIP:  192.168.1.107
  Hostname:    k8s-node-01
Capacity:
  cpu:                2
  ephemeral-storage:  11758760Ki
  hugepages-2Mi:      0
  memory:             2015104Ki
  pods:               110
Allocatable:
  cpu:                2
  ephemeral-storage:  10836873199
  hugepages-2Mi:      0
  memory:             1912704Ki
  pods:               110
System Info:
  Machine ID:                 817698d76b7f497e8956e2e5836d079e
  System UUID:                776e8b2a-b548-6e4b-910f-41ee05d8f3b3
  Boot ID:                    caf0d33e-6e1f-4cf9-be15-3f4ea5878fbc
  Kernel Version:             6.8.0-47-generic
  OS Image:                   Ubuntu 24.04.1 LTS
  Operating System:           linux
  Architecture:               amd64
  Container Runtime Version:  containerd://1.7.12
  Kubelet Version:            v1.28.14
  Kube-Proxy Version:         v1.28.14
PodCIDR:                      10.244.1.0/24
PodCIDRs:                     10.244.1.0/24
Non-terminated Pods:          (8 in total)
  Namespace                   Name                                                     CPU Requests  CPU Limits  Memory Requests  Memory Limits  Age
  ---------                   ----                                                     ------------  ----------  ---------------  -------------  ---
  kube-flannel                kube-flannel-ds-mqqdb                                    100m (5%)     0 (0%)      50Mi (2%)        0 (0%)         3d2h
  kube-system                 kube-proxy-9dj7f                                         0 (0%)        0 (0%)      0 (0%)           0 (0%)         3d2h
  kube-system                 weave-net-cwdmr                                          100m (5%)     0 (0%)      0 (0%)           0 (0%)         3d2h
  kubernetes-dashboard        kubernetes-dashboard-api-8c6bf4788-c9px4                 100m (5%)     250m (12%)  200Mi (10%)      400Mi (21%)    57m
  kubernetes-dashboard        kubernetes-dashboard-auth-cd58bb9b9-v9nts                100m (5%)     250m (12%)  200Mi (10%)      400Mi (21%)    57m
  kubernetes-dashboard        kubernetes-dashboard-kong-76dff7b666-jhkws               0 (0%)        0 (0%)      0 (0%)           0 (0%)         57m
  kubernetes-dashboard        kubernetes-dashboard-metrics-scraper-5f645f778c-zfl49    100m (5%)     250m (12%)  200Mi (10%)      400Mi (21%)    57m
  kubernetes-dashboard        kubernetes-dashboard-web-5bf7668478-4p42g                100m (5%)     250m (12%)  200Mi (10%)      400Mi (21%)    57m
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource           Requests     Limits
  --------           --------     ------
  cpu                600m (30%)   1 (50%)
  memory             850Mi (45%)  1600Mi (85%)
  ephemeral-storage  0 (0%)       0 (0%)
  hugepages-2Mi      0 (0%)       0 (0%)
Events:              <none>
sre@k8s-controller-01:~$ 

sre@k8s-controller-01:~$ kubectl describe nodes k8s-controller-01
Name:               k8s-controller-01
Roles:              control-plane
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=k8s-controller-01
                    kubernetes.io/os=linux
                    node-role.kubernetes.io/control-plane=
                    node.kubernetes.io/exclude-from-external-load-balancers=
Annotations:        flannel.alpha.coreos.com/backend-data: {"VNI":1,"VtepMAC":"72:5b:e3:40:e3:2f"}
                    flannel.alpha.coreos.com/backend-type: vxlan
                    flannel.alpha.coreos.com/kube-subnet-manager: true
                    flannel.alpha.coreos.com/public-ip: 192.168.1.105
                    kubeadm.alpha.kubernetes.io/cri-socket: unix:///var/run/containerd/containerd.sock
                    node.alpha.kubernetes.io/ttl: 0
                    volumes.kubernetes.io/controller-managed-attach-detach: true
CreationTimestamp:  Thu, 07 Nov 2024 21:11:47 +0000
Taints:             node-role.kubernetes.io/control-plane:NoSchedule
                    node.kubernetes.io/unschedulable:NoSchedule
Unschedulable:      true
Lease:
  HolderIdentity:  k8s-controller-01
  AcquireTime:     <unset>
  RenewTime:       Thu, 14 Nov 2024 20:23:18 +0000
Conditions:
  Type                 Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----                 ------  -----------------                 ------------------                ------                       -------
  NetworkUnavailable   False   Thu, 14 Nov 2024 17:59:30 +0000   Thu, 14 Nov 2024 17:59:30 +0000   WeaveIsUp                    Weave pod has set this
  MemoryPressure       False   Thu, 14 Nov 2024 20:23:04 +0000   Thu, 07 Nov 2024 21:11:44 +0000   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure         False   Thu, 14 Nov 2024 20:23:04 +0000   Thu, 07 Nov 2024 21:11:44 +0000   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure          False   Thu, 14 Nov 2024 20:23:04 +0000   Thu, 07 Nov 2024 21:11:44 +0000   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready                True    Thu, 14 Nov 2024 20:23:04 +0000   Thu, 07 Nov 2024 21:11:51 +0000   KubeletReady                 kubelet is posting ready status. AppArmor enabled
Addresses:
  InternalIP:  192.168.1.105
  Hostname:    k8s-controller-01
Capacity:
  cpu:                2
  ephemeral-storage:  11758760Ki
  hugepages-2Mi:      0
  memory:             2015104Ki
  pods:               110
Allocatable:
  cpu:                2
  ephemeral-storage:  10836873199
  hugepages-2Mi:      0
  memory:             1912704Ki
  pods:               110
System Info:
  Machine ID:                 817698d76b7f497e8956e2e5836d079e
  System UUID:                ce208c27-5849-0f46-9cbc-90c7028d3efd
  Boot ID:                    877b6ad7-6c6d-4d21-95b7-61cd8a322fe8
  Kernel Version:             6.8.0-47-generic
  OS Image:                   Ubuntu 24.04.1 LTS
  Operating System:           linux
  Architecture:               amd64
  Container Runtime Version:  containerd://1.7.12
  Kubelet Version:            v1.28.14
  Kube-Proxy Version:         v1.28.14
PodCIDR:                      10.244.0.0/24
PodCIDRs:                     10.244.0.0/24
Non-terminated Pods:          (9 in total)
  Namespace                   Name                                         CPU Requests  CPU Limits  Memory Requests  Memory Limits  Age
  ---------                   ----                                         ------------  ----------  ---------------  -------------  ---
  kube-flannel                kube-flannel-ds-jlqqp                        100m (5%)     0 (0%)      50Mi (2%)        0 (0%)         6d23h
  kube-system                 coredns-5dd5756b68-j5scx                     100m (5%)     0 (0%)      70Mi (3%)        170Mi (9%)     6d23h
  kube-system                 coredns-5dd5756b68-wjzc2                     100m (5%)     0 (0%)      70Mi (3%)        170Mi (9%)     6d23h
  kube-system                 etcd-k8s-controller-01                       100m (5%)     0 (0%)      100Mi (5%)       0 (0%)         6d23h
  kube-system                 kube-apiserver-k8s-controller-01             250m (12%)    0 (0%)      0 (0%)           0 (0%)         6d23h
  kube-system                 kube-controller-manager-k8s-controller-01    200m (10%)    0 (0%)      0 (0%)           0 (0%)         6d23h
  kube-system                 kube-proxy-vk8w5                             0 (0%)        0 (0%)      0 (0%)           0 (0%)         6d23h
  kube-system                 kube-scheduler-k8s-controller-01             100m (5%)     0 (0%)      0 (0%)           0 (0%)         6d23h
  kube-system                 weave-net-pqb6f                              100m (5%)     0 (0%)      0 (0%)           0 (0%)         6d23h
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource           Requests     Limits
  --------           --------     ------
  cpu                1050m (52%)  0 (0%)
  memory             290Mi (15%)  340Mi (18%)
  ephemeral-storage  0 (0%)       0 (0%)
  hugepages-2Mi      0 (0%)       0 (0%)
Events:              <none>

