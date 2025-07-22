
Pod CIDR Assignment
-------------------
sre@controller:~$ sudo apt-get install -y kubeadm kubectl kubelet
sre@controller:~$ sudo kubeadm init --control-plane-endpoint=192.168.1.120 --node-name controller --pod-network-cidr=10.244.0.0/16
sre@controller:~$ kubectl get nodes -o template --template={{.spec.podCIDR}}
<no value>
sre@controller:~$ kubectl get nodes -o jsonpath='{.items[*].spec.podCIDR}'
10.244.0.0/24 10.244.1.0/24 10.244.2.0/24

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
    namespace: kube-system
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

sre@k8s-controller-01:~$ kubectl get services -o wide
NAME       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE   SELECTOR
kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   19h   k8s-app=kube-dns
sre@k8s-controller-01:~$ kubectl get nodes -o wide
NAME                STATUS   ROLES           AGE   VERSION    INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
k8s-controller-01   Ready    control-plane   19h   v1.28.14   192.168.1.105   <none>        Ubuntu 24.04.1 LTS   6.8.0-47-generic   containerd://1.7.12

sre@k8s-controller-01:~$ kubectl get pods --all-namespaces=true -o wide
NAMESPACE      NAME                                        READY   STATUS    RESTARTS      AGE     IP              NODE                NOMINATED NODE   READINESS GATES
kube-flannel   kube-flannel-ds-b6t6r                       1/1     Running   0             6m45s   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system    coredns-5dd5756b68-vnt9b                    1/1     Running   1 (52m ago)   19h     10.244.0.5      k8s-controller-01   <none>           <none>
kube-system    coredns-5dd5756b68-z9vcd                    1/1     Running   1 (52m ago)   19h     10.244.0.4      k8s-controller-01   <none>           <none>
kube-system    etcd-k8s-controller-01                      1/1     Running   3 (42m ago)   19h     192.168.1.105   k8s-controller-01   <none>           <none>
kube-system    kube-apiserver-k8s-controller-01            1/1     Running   3 (42m ago)   19h     192.168.1.105   k8s-controller-01   <none>           <none>
kube-system    kube-controller-manager-k8s-controller-01   1/1     Running   3 (42m ago)   19h     192.168.1.105   k8s-controller-01   <none>           <none>
kube-system    kube-proxy-4wjrk                            1/1     Running   2 (42m ago)   19h     192.168.1.105   k8s-controller-01   <none>           <none>
kube-system    kube-scheduler-k8s-controller-01            1/1     Running   3 (42m ago)   19h     192.168.1.105   k8s-controller-01   <none>           <none>
kube-system    weave-net-lfgst                             2/2     Running   6 (41m ago)   18h     192.168.1.105   k8s-controller-01   <none>          

sre@k8s-controller-01:~$ kubectl apply -f kube-flannel.yml 
namespace/kube-flannel unchanged
serviceaccount/flannel unchanged
clusterrole.rbac.authorization.k8s.io/flannel configured
clusterrolebinding.rbac.authorization.k8s.io/flannel configured
configmap/kube-flannel-cfg unchanged
daemonset.apps/kube-flannel-ds configured

sre@k8s-controller-01:~$ kubectl get pods --all-namespaces=true
NAMESPACE      NAME                                        READY   STATUS    RESTARTS      AGE
kube-flannel   kube-flannel-ds-b6t6r                       1/1     Running   0             16s
kube-system    coredns-5dd5756b68-vnt9b                    0/1     Unknown   0             19h
kube-system    coredns-5dd5756b68-z9vcd                    1/1     Running   1 (45m ago)   19h
kube-system    etcd-k8s-controller-01                      1/1     Running   3 (35m ago)   19h
kube-system    kube-apiserver-k8s-controller-01            1/1     Running   3 (35m ago)   19h
kube-system    kube-controller-manager-k8s-controller-01   1/1     Running   3 (35m ago)   19h
kube-system    kube-proxy-4wjrk                            1/1     Running   2 (35m ago)   19h
kube-system    kube-scheduler-k8s-controller-01            1/1     Running   3 (35m ago)   19h
kube-system    weave-net-lfgst                             2/2     Running   6 (35m ago)   18h

sre@k8s-controller-01:~$ kubectl --namespace=kube-flannel logs kube-flannel-ds-b6t6r  --container=install-cni
sre@k8s-controller-01:~$ kubectl --namespace=kube-flannel logs kube-flannel-ds-b6t6r  --container=install-cni-plugin

sre@k8s-controller-01:~$ kubectl --namespace=kube-flannel logs kube-flannel-ds-b6t6r  --container=kube-flannel
I1023 17:50:34.765594       1 main.go:211] CLI flags config: {etcdEndpoints:http://127.0.0.1:4001,http://127.0.0.1:2379 etcdPrefix:/coreos.com/network etcdKeyfile: etcdCertfile: etcdCAFile: etcdUsername: etcdPassword: version:false kubeSubnetMgr:true kubeApiUrl: kubeAnnotationPrefix:flannel.alpha.coreos.com kubeConfigFile: iface:[] ifaceRegex:[] ipMasq:true ifaceCanReach: subnetFile:/run/flannel/subnet.env publicIP: publicIPv6: subnetLeaseRenewMargin:60 healthzIP:0.0.0.0 healthzPort:0 iptablesResyncSeconds:5 iptablesForwardRules:true netConfPath:/etc/kube-flannel/net-conf.json setNodeNetworkUnavailable:true}
W1023 17:50:34.765935       1 client_config.go:618] Neither --kubeconfig nor --master was specified.  Using the inClusterConfig.  This might not work.
I1023 17:50:34.784371       1 kube.go:139] Waiting 10m0s for node controller to sync
I1023 17:50:34.784441       1 kube.go:469] Starting kube subnet manager
I1023 17:50:34.788432       1 kube.go:490] Creating the node lease for IPv4. This is the n.Spec.PodCIDRs: [10.244.0.0/24]
I1023 17:50:35.785792       1 kube.go:146] Node controller sync successful
I1023 17:50:35.786048       1 main.go:231] Created subnet manager: Kubernetes Subnet Manager - k8s-controller-01
I1023 17:50:35.786385       1 main.go:234] Installing signal handlers
I1023 17:50:35.787311       1 main.go:466] Found network config - Backend type: vxlan
I1023 17:50:35.792096       1 kube.go:669] List of node(k8s-controller-01) annotations: map[string]string{"flannel.alpha.coreos.com/backend-data":"{\"VNI\":1,\"VtepMAC\":\"46:cf:e7:58:95:66\"}", "flannel.alpha.coreos.com/backend-type":"vxlan", "flannel.alpha.coreos.com/kube-subnet-manager":"true", "flannel.alpha.coreos.com/public-ip":"192.168.1.105", "kubeadm.alpha.kubernetes.io/cri-socket":"unix:///var/run/containerd/containerd.sock", "node.alpha.kubernetes.io/ttl":"0", "volumes.kubernetes.io/controller-managed-attach-detach":"true"}
I1023 17:50:35.792179       1 match.go:211] Determining IP address of default interface
I1023 17:50:35.794068       1 match.go:264] Using interface with name enp0s3 and address 192.168.1.105
I1023 17:50:35.796805       1 match.go:286] Defaulting external address to interface address (192.168.1.105)
I1023 17:50:35.797265       1 vxlan.go:141] VXLAN config: VNI=1 Port=0 GBP=false Learning=false DirectRouting=false
I1023 17:50:35.800651       1 kube.go:636] List of node(k8s-controller-01) annotations: map[string]string{"flannel.alpha.coreos.com/backend-data":"{\"VNI\":1,\"VtepMAC\":\"46:cf:e7:58:95:66\"}", "flannel.alpha.coreos.com/backend-type":"vxlan", "flannel.alpha.coreos.com/kube-subnet-manager":"true", "flannel.alpha.coreos.com/public-ip":"192.168.1.105", "kubeadm.alpha.kubernetes.io/cri-socket":"unix:///var/run/containerd/containerd.sock", "node.alpha.kubernetes.io/ttl":"0", "volumes.kubernetes.io/controller-managed-attach-detach":"true"}
I1023 17:50:35.800735       1 vxlan.go:155] Interface flannel.1 mac address set to: 46:cf:e7:58:95:66
I1023 17:50:35.807752       1 iptables.go:51] Starting flannel in iptables mode...
W1023 17:50:35.807863       1 main.go:519] no subnet found for key: FLANNEL_NETWORK in file: /run/flannel/subnet.env
W1023 17:50:35.807877       1 main.go:519] no subnet found for key: FLANNEL_SUBNET in file: /run/flannel/subnet.env
W1023 17:50:35.807884       1 main.go:554] no subnet found for key: FLANNEL_IPV6_NETWORK in file: /run/flannel/subnet.env
W1023 17:50:35.807889       1 main.go:554] no subnet found for key: FLANNEL_IPV6_SUBNET in file: /run/flannel/subnet.env
I1023 17:50:35.807895       1 iptables.go:115] Current network or subnet (10.244.0.0/16, 10.244.0.0/24) is not equal to previous one (0.0.0.0/0, 0.0.0.0/0), trying to recycle old iptables rules
I1023 17:50:35.845426       1 iptables.go:125] Setting up masking rules
I1023 17:50:35.850755       1 iptables.go:226] Changing default FORWARD chain policy to ACCEPT
I1023 17:50:35.855466       1 main.go:410] Wrote subnet file to /run/flannel/subnet.env
I1023 17:50:35.855544       1 main.go:414] Running backend.
I1023 17:50:35.871683       1 vxlan_network.go:65] watching for new subnet leases
I1023 17:50:35.881890       1 main.go:435] Waiting for all goroutines to exit
I1023 17:50:35.901612       1 iptables.go:372] bootstrap done
I1023 17:50:35.918294       1 iptables.go:372] bootstrap done
sre@k8s-controller-01:~$ 

sre@k8s-controller-01:~$ kubectl --namespace=kube-flannel describe pod kube-flannel-ds-b6t6r 
Name:                 kube-flannel-ds-b6t6r
Namespace:            kube-flannel
Priority:             2000001000
Priority Class Name:  system-node-critical
Service Account:      flannel
Node:                 k8s-controller-01/192.168.1.105
Start Time:           Wed, 23 Oct 2024 17:50:24 +0000
Labels:               app=flannel
                      controller-revision-hash=9dbfbdc74
                      k8s-app=flannel
                      pod-template-generation=2
                      tier=node
Annotations:          <none>
Status:               Running
IP:                   192.168.1.105
IPs:
  IP:           192.168.1.105
Controlled By:  DaemonSet/kube-flannel-ds
Init Containers:
  install-cni-plugin:
    Container ID:  containerd://458ea8bd1e12cf2d386db2b545c88be148acbe2b52b794d04afc305849d49313
    Image:         docker.io/flannel/flannel-cni-plugin:v1.5.1-flannel2
    Image ID:      docker.io/flannel/flannel-cni-plugin@sha256:5d4fb9f90389a33b397fba4c8f371454c21aa146696aec46481214892e66c1b8
    Port:          <none>
    Host Port:     <none>
    Command:
      cp
    Args:
      -f
      /flannel
      /opt/cni/bin/flannel
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Wed, 23 Oct 2024 17:50:24 +0000
      Finished:     Wed, 23 Oct 2024 17:50:24 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /opt/cni/bin from cni-plugin (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-84trc (ro)
  install-cni:
    Container ID:  containerd://6fe64f1bb81f226ad1cafcdac7b5fd51154f0b769c7c21e8797a04f2142895ca
    Image:         docker.io/flannel/flannel:v0.26.0
    Image ID:      docker.io/flannel/flannel@sha256:eed00c71b4e1b303e245472f5501574d171a53860607948884d91e1781730f07
    Port:          <none>
    Host Port:     <none>
    Command:
      cp
    Args:
      -f
      /etc/kube-flannel/cni-conf.json
      /etc/cni/net.d/10-flannel.conflist
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Wed, 23 Oct 2024 17:50:33 +0000
      Finished:     Wed, 23 Oct 2024 17:50:33 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /etc/cni/net.d from cni (rw)
      /etc/kube-flannel/ from flannel-cfg (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-84trc (ro)
Containers:
  kube-flannel:
    Container ID:  containerd://ef7334f6d4e8cef5cdd676a86e439edc922790b1893609a7d01c51bf72f2d4fe
    Image:         docker.io/flannel/flannel:v0.26.0
    Image ID:      docker.io/flannel/flannel@sha256:eed00c71b4e1b303e245472f5501574d171a53860607948884d91e1781730f07
    Port:          <none>
    Host Port:     <none>
    Command:
      /opt/bin/flanneld
    Args:
      --ip-masq
      --kube-subnet-mgr
    State:          Running
      Started:      Wed, 23 Oct 2024 17:50:34 +0000
    Ready:          True
    Restart Count:  0
    Requests:
      cpu:     100m
      memory:  50Mi
    Environment:
      POD_NAME:           kube-flannel-ds-b6t6r (v1:metadata.name)
      POD_NAMESPACE:      kube-flannel (v1:metadata.namespace)
      EVENT_QUEUE_DEPTH:  5000
    Mounts:
      /etc/kube-flannel/ from flannel-cfg (rw)
      /run/flannel from run (rw)
      /run/xtables.lock from xtables-lock (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-84trc (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  run:
    Type:          HostPath (bare host directory volume)
    Path:          /run/flannel
    HostPathType:  
  cni-plugin:
    Type:          HostPath (bare host directory volume)
    Path:          /opt/cni/bin
    HostPathType:  
  cni:
    Type:          HostPath (bare host directory volume)
    Path:          /etc/cni/net.d
    HostPathType:  
  flannel-cfg:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      kube-flannel-cfg
    Optional:  false
  xtables-lock:
    Type:          HostPath (bare host directory volume)
    Path:          /run/xtables.lock
    HostPathType:  FileOrCreate
  kube-api-access-84trc:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              <none>
Tolerations:                 :NoSchedule op=Exists
                             node.kubernetes.io/disk-pressure:NoSchedule op=Exists
                             node.kubernetes.io/memory-pressure:NoSchedule op=Exists
                             node.kubernetes.io/network-unavailable:NoSchedule op=Exists
                             node.kubernetes.io/not-ready:NoExecute op=Exists
                             node.kubernetes.io/pid-pressure:NoSchedule op=Exists
                             node.kubernetes.io/unreachable:NoExecute op=Exists
                             node.kubernetes.io/unschedulable:NoSchedule op=Exists
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  114s  default-scheduler  Successfully assigned kube-flannel/kube-flannel-ds-b6t6r to k8s-controller-01
  Normal  Pulled     114s  kubelet            Container image "docker.io/flannel/flannel-cni-plugin:v1.5.1-flannel2" already present on machine
  Normal  Created    114s  kubelet            Created container install-cni-plugin
  Normal  Started    114s  kubelet            Started container install-cni-plugin
  Normal  Pulling    113s  kubelet            Pulling image "docker.io/flannel/flannel:v0.26.0"
  Normal  Pulled     105s  kubelet            Successfully pulled image "docker.io/flannel/flannel:v0.26.0" in 7.976s (7.976s including waiting)
  Normal  Created    105s  kubelet            Created container install-cni
  Normal  Started    105s  kubelet            Started container install-cni
  Normal  Pulled     104s  kubelet            Container image "docker.io/flannel/flannel:v0.26.0" already present on machine
  Normal  Created    104s  kubelet            Created container kube-flannel
  Normal  Started    104s  kubelet            Started container kube-flannel

sre@k8s-controller-01:~$ kubectl --namespace=kube-flannel describe pod kube-flannel-ds-b6t6r | grep Path
    Type:          HostPath (bare host directory volume)
    Path:          /run/flannel
    HostPathType:  
    Type:          HostPath (bare host directory volume)
    Path:          /opt/cni/bin
    HostPathType:  
    Type:          HostPath (bare host directory volume)
    Path:          /etc/cni/net.d
    HostPathType:  
    Type:          HostPath (bare host directory volume)
    Path:          /run/xtables.lock
    HostPathType:  FileOrCreate
sre@k8s-controller-01:~$ find /run/flannel
/run/flannel
/run/flannel/subnet.env
sre@k8s-controller-01:~$ cat /run/flannel/subnet.env
FLANNEL_NETWORK=10.244.0.0/16
FLANNEL_SUBNET=10.244.0.1/24
FLANNEL_MTU=1450
FLANNEL_IPMASQ=true

sre@k8s-controller-01:~$ find /opt/cni/bin/flannel
/opt/cni/bin/flannel
sre@k8s-controller-01:~$ ls -l /opt/cni/bin/flannel
-rwxr-xr-x 1 root root 2834432 Oct 23 17:50 /opt/cni/bin/flannel

sre@k8s-controller-01:~$ sudo find /etc/cni/net.d
/etc/cni/net.d
/etc/cni/net.d/10-weave.conflist
/etc/cni/net.d/.kubernetes-cni-keep
/etc/cni/net.d/10-flannel.conflist
sre@k8s-controller-01:~$ sudo cat /etc/cni/net.d/.kubernetes-cni-keep
sre@k8s-controller-01:~$ sudo cat /etc/cni/net.d/10-flannel.conflist
{
  "name": "cbr0",
  "cniVersion": "0.3.1",
  "plugins": [
    {
      "type": "flannel",
      "delegate": {
        "hairpinMode": true,
        "isDefaultGateway": true
      }
    },
    {
      "type": "portmap",
      "capabilities": {
        "portMappings": true
      }
    }
  ]
}

