
tim@Tims-MBP kubernetes % vi dnsutils.yml
tim@Tims-MBP kubernetes % cat dnsutils.yml  
apiVersion: v1
kind: Pod
metadata:
  name: dnsutils
  namespace: default
spec:
  containers:
  - name: dnsutils
    image: registry.k8s.io/e2e-test-images/agnhost:2.39
    imagePullPolicy: IfNotPresent
  restartPolicy: Always

tim@Tims-MBP kubernetes % kubectl apply -f dnsutils.yml
pod/dnsutils created

tim@Tims-MBP kubernetes % kubectl get pods dnsutils
NAME       READY   STATUS    RESTARTS   AGE
dnsutils   1/1     Running   0          2m27s
tim@Tims-MBP kubernetes % kubectl exec -it dnsutils -- nslookup kubernetes.default
Server:		10.96.0.10
Address:	10.96.0.10#53

Name:	kubernetes.default.svc.cluster.local
Address: 10.96.0.1

tim@Tims-MBP kubernetes % kubectl exec -it dnsutils -- cat /etc/resolv.conf       
nameserver 10.96.0.10
search default.svc.cluster.local svc.cluster.local cluster.local
options ndots:5

tim@Tims-MBP kubernetes % kubectl get pods --namespace=kube-system -l k8s-app=kube-dns
NAME                       READY   STATUS    RESTARTS       AGE
coredns-7db6d8ff4d-7kb9x   1/1     Running   2 (131m ago)   4d21h
coredns-7db6d8ff4d-gkp5z   1/1     Running   2 (131m ago)   4d21h
tim@Tims-MBP kubernetes % kubectl get deployment --namespace=kube-system
NAME      READY   UP-TO-DATE   AVAILABLE   AGE
coredns   2/2     2            2           4d21h
tim@Tims-MBP kubernetes % kubectl get services --namespace=kube-system
NAME       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   4d21h

tim@Tims-MBP kubernetes % kubectl get endpoints kube-dns --namespace=kube-system
NAME       ENDPOINTS                                            AGE
kube-dns   10.1.0.20:53,10.1.0.21:53,10.1.0.20:53 + 3 more...   4d21h
tim@Tims-MBP kubernetes % kubectl -n kube-system edit configmap coredns
configmap/coredns edited
tim@Tims-MBP kubernetes % cat configmap_coredns.yml 
# Please edit the object below. Lines beginning with a '#' will be ignored,
# and an empty file will abort the edit. If an error occurs while saving this file will be
# reopened with the relevant failures.
#
apiVersion: v1
data:
  Corefile: |
    .:53 {
        log
        errors
        health {
           lameduck 5s
        }
        ready
        kubernetes cluster.local in-addr.arpa ip6.arpa {
           pods insecure
           fallthrough in-addr.arpa ip6.arpa
           ttl 30
        }
        prometheus :9153
        forward . /etc/resolv.conf {
           max_concurrent 1000
        }
        cache 30
        loop
        reload
        loadbalance
    }
kind: ConfigMap
metadata:
  creationTimestamp: 2024-10-03T22:34:17Z
  managedFields:
  - apiVersion: v1
    fieldsType: FieldsV1
    fieldsV1:
      f:data:
        .: {}
        f:Corefile: {}
    manager: kubeadm
    operation: Update
    time: 2024-10-03T22:34:17Z
  name: coredns
  namespace: kube-system
  resourceVersion: "259"
  uid: 02a7c528-4488-4e2c-b321-ef9e15db303d


tim@Tims-MBP kubernetes % kubectl describe clusterrole system:coredns --namespace=kube-system
Name:         system:coredns
Labels:       <none>
Annotations:  <none>
PolicyRule:
  Resources                        Non-Resource URLs  Resource Names  Verbs
  ---------                        -----------------  --------------  -----
  endpoints                        []                 []              [list watch]
  namespaces                       []                 []              [list watch]
  pods                             []                 []              [list watch]
  services                         []                 []              [list watch]
  endpointslices.discovery.k8s.io  []                 []              [list watch]


tim@Tims-MBP kubernetes % kubectl logs --namespace=kube-system -l k8s-app=kube-dns
[INFO] plugin/ready: Still waiting on: "kubernetes"
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/ready: Still waiting on: "kubernetes"
[WARNING] plugin/kubernetes: starting server with unsynced Kubernetes API
.:53
[INFO] plugin/reload: Running configuration SHA512 = 591cf328cccc12bc490481273e738df59329c62c0b729d94e8b61db9961c2fa5f046dd37f1cf888b953814040d180f52594972691cd6ff41be96639138a43908
CoreDNS-1.11.1
linux/amd64, go1.20.7, ae2bbc2
[INFO] plugin/ready: Still waiting on: "kubernetes"
[INFO] plugin/ready: Still waiting on: "kubernetes"
[INFO] plugin/ready: Still waiting on: "kubernetes"
[INFO] plugin/ready: Still waiting on: "kubernetes"
[INFO] plugin/kubernetes: pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231: failed to list *v1.Service: Get "https://10.96.0.1:443/api/v1/services?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout
[INFO] plugin/kubernetes: pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231: failed to list *v1.EndpointSlice: Get "https://10.96.0.1:443/apis/discovery.k8s.io/v1/endpointslices?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout
[INFO] plugin/kubernetes: Trace[989619704]: "Reflector ListAndWatch" name:pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231 (08-Oct-2024 18:09:15.015) (total time: 30007ms):
Trace[989619704]: ---"Objects listed" error:Get "https://10.96.0.1:443/apis/discovery.k8s.io/v1/endpointslices?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout 30004ms (18:09:45.024)
Trace[989619704]: [30.007665517s] [30.007665517s] END
[INFO] plugin/kubernetes: Trace[2032007032]: "Reflector ListAndWatch" name:pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231 (08-Oct-2024 18:09:15.015) (total time: 30007ms):
Trace[2032007032]: ---"Objects listed" error:Get "https://10.96.0.1:443/api/v1/services?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout 30003ms (18:09:45.024)
Trace[2032007032]: [30.007125971s] [30.007125971s] END
[ERROR] plugin/kubernetes: pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231: Failed to watch *v1.Service: failed to list *v1.Service: Get "https://10.96.0.1:443/api/v1/services?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout
[ERROR] plugin/kubernetes: pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231: Failed to watch *v1.EndpointSlice: failed to list *v1.EndpointSlice: Get "https://10.96.0.1:443/apis/discovery.k8s.io/v1/endpointslices?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout
[INFO] plugin/kubernetes: pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231: failed to list *v1.Namespace: Get "https://10.96.0.1:443/api/v1/namespaces?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout
[INFO] plugin/kubernetes: Trace[1669848488]: "Reflector ListAndWatch" name:pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231 (08-Oct-2024 18:09:15.014) (total time: 30009ms):
Trace[1669848488]: ---"Objects listed" error:Get "https://10.96.0.1:443/api/v1/namespaces?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout 30004ms (18:09:45.024)
Trace[1669848488]: [30.009114929s] [30.009114929s] END
[ERROR] plugin/kubernetes: pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231: Failed to watch *v1.Namespace: failed to list *v1.Namespace: Get "https://10.96.0.1:443/api/v1/namespaces?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/ready: Still waiting on: "kubernetes"
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/kubernetes: waiting for Kubernetes API before starting server
[INFO] plugin/ready: Still waiting on: "kubernetes"
[WARNING] plugin/kubernetes: starting server with unsynced Kubernetes API
.:53
[INFO] plugin/reload: Running configuration SHA512 = 591cf328cccc12bc490481273e738df59329c62c0b729d94e8b61db9961c2fa5f046dd37f1cf888b953814040d180f52594972691cd6ff41be96639138a43908
CoreDNS-1.11.1
linux/amd64, go1.20.7, ae2bbc2
[INFO] plugin/ready: Still waiting on: "kubernetes"
[INFO] plugin/ready: Still waiting on: "kubernetes"
[INFO] plugin/ready: Still waiting on: "kubernetes"
[INFO] plugin/ready: Still waiting on: "kubernetes"
[INFO] plugin/kubernetes: pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231: failed to list *v1.Namespace: Get "https://10.96.0.1:443/api/v1/namespaces?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout
[INFO] plugin/kubernetes: Trace[1908080549]: "Reflector ListAndWatch" name:pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231 (08-Oct-2024 18:09:15.013) (total time: 30008ms):
Trace[1908080549]: ---"Objects listed" error:Get "https://10.96.0.1:443/api/v1/namespaces?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout 30008ms (18:09:45.026)
Trace[1908080549]: [30.008606397s] [30.008606397s] END
[ERROR] plugin/kubernetes: pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231: Failed to watch *v1.Namespace: failed to list *v1.Namespace: Get "https://10.96.0.1:443/api/v1/namespaces?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout
[INFO] plugin/kubernetes: pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231: failed to list *v1.EndpointSlice: Get "https://10.96.0.1:443/apis/discovery.k8s.io/v1/endpointslices?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout
[INFO] plugin/kubernetes: Trace[1771506558]: "Reflector ListAndWatch" name:pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231 (08-Oct-2024 18:09:15.014) (total time: 30011ms):
Trace[1771506558]: ---"Objects listed" error:Get "https://10.96.0.1:443/apis/discovery.k8s.io/v1/endpointslices?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout 30011ms (18:09:45.031)
Trace[1771506558]: [30.011781883s] [30.011781883s] END
[ERROR] plugin/kubernetes: pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231: Failed to watch *v1.EndpointSlice: failed to list *v1.EndpointSlice: Get "https://10.96.0.1:443/apis/discovery.k8s.io/v1/endpointslices?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout
[INFO] plugin/kubernetes: pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231: failed to list *v1.Service: Get "https://10.96.0.1:443/api/v1/services?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout
[INFO] plugin/kubernetes: Trace[1245984443]: "Reflector ListAndWatch" name:pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231 (08-Oct-2024 18:09:15.015) (total time: 30010ms):
Trace[1245984443]: ---"Objects listed" error:Get "https://10.96.0.1:443/api/v1/services?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout 30010ms (18:09:45.030)
Trace[1245984443]: [30.010822317s] [30.010822317s] END
[ERROR] plugin/kubernetes: pkg/mod/k8s.io/client-go@v0.27.4/tools/cache/reflector.go:231: Failed to watch *v1.Service: failed to list *v1.Service: Get "https://10.96.0.1:443/api/v1/services?limit=500&resourceVersion=0": dial tcp 10.96.0.1:443: i/o timeout

tim@Tims-MBP kubernetes % kubectl describe pod dnsutils 
E1008 13:30:47.434013    8209 describe.go:616] Unable to construct reference to '&core.Pod{TypeMeta:v1.TypeMeta{Kind:"", APIVersion:""}, ObjectMeta:v1.ObjectMeta{Name:"dnsutils", GenerateName:"", Namespace:"default", SelfLink:"", UID:"8c87ac1d-f6e6-473a-b710-096c38dff4ac", ResourceVersion:"220704", Generation:0, CreationTimestamp:v1.Time{Time:time.Time{wall:0x0, ext:63864015388, loc:(*time.Location)(0x3597a80)}}, DeletionTimestamp:(*v1.Time)(nil), DeletionGracePeriodSeconds:(*int64)(nil), Labels:map[string]string(nil), Annotations:map[string]string{"kubectl.kubernetes.io/last-applied-configuration":"{\"apiVersion\":\"v1\",\"kind\":\"Pod\",\"metadata\":{\"annotations\":{},\"name\":\"dnsutils\",\"namespace\":\"default\"},\"spec\":{\"containers\":[{\"image\":\"registry.k8s.io/e2e-test-images/agnhost:2.39\",\"imagePullPolicy\":\"IfNotPresent\",\"name\":\"dnsutils\"}],\"restartPolicy\":\"Always\"}}\n"}, OwnerReferences:[]v1.OwnerReference(nil), Initializers:(*v1.Initializers)(nil), Finalizers:[]string(nil), ClusterName:""}, Spec:core.PodSpec{Volumes:[]core.Volume{core.Volume{Name:"kube-api-access-ml4xg", VolumeSource:core.VolumeSource{HostPath:(*core.HostPathVolumeSource)(nil), EmptyDir:(*core.EmptyDirVolumeSource)(nil), GCEPersistentDisk:(*core.GCEPersistentDiskVolumeSource)(nil), AWSElasticBlockStore:(*core.AWSElasticBlockStoreVolumeSource)(nil), GitRepo:(*core.GitRepoVolumeSource)(nil), Secret:(*core.SecretVolumeSource)(nil), NFS:(*core.NFSVolumeSource)(nil), ISCSI:(*core.ISCSIVolumeSource)(nil), Glusterfs:(*core.GlusterfsVolumeSource)(nil), PersistentVolumeClaim:(*core.PersistentVolumeClaimVolumeSource)(nil), RBD:(*core.RBDVolumeSource)(nil), Quobyte:(*core.QuobyteVolumeSource)(nil), FlexVolume:(*core.FlexVolumeSource)(nil), Cinder:(*core.CinderVolumeSource)(nil), CephFS:(*core.CephFSVolumeSource)(nil), Flocker:(*core.FlockerVolumeSource)(nil), DownwardAPI:(*core.DownwardAPIVolumeSource)(nil), FC:(*core.FCVolumeSource)(nil), AzureFile:(*core.AzureFileVolumeSource)(nil), ConfigMap:(*core.ConfigMapVolumeSource)(nil), VsphereVolume:(*core.VsphereVirtualDiskVolumeSource)(nil), AzureDisk:(*core.AzureDiskVolumeSource)(nil), PhotonPersistentDisk:(*core.PhotonPersistentDiskVolumeSource)(nil), Projected:(*core.ProjectedVolumeSource)(0xc0008e7aa0), PortworxVolume:(*core.PortworxVolumeSource)(nil), ScaleIO:(*core.ScaleIOVolumeSource)(nil), StorageOS:(*core.StorageOSVolumeSource)(nil)}}}, InitContainers:[]core.Container(nil), Containers:[]core.Container{core.Container{Name:"dnsutils", Image:"registry.k8s.io/e2e-test-images/agnhost:2.39", Command:[]string(nil), Args:[]string(nil), WorkingDir:"", Ports:[]core.ContainerPort(nil), EnvFrom:[]core.EnvFromSource(nil), Env:[]core.EnvVar(nil), Resources:core.ResourceRequirements{Limits:core.ResourceList(nil), Requests:core.ResourceList(nil)}, VolumeMounts:[]core.VolumeMount{core.VolumeMount{Name:"kube-api-access-ml4xg", ReadOnly:true, MountPath:"/var/run/secrets/kubernetes.io/serviceaccount", SubPath:"", MountPropagation:(*core.MountPropagationMode)(nil)}}, VolumeDevices:[]core.VolumeDevice(nil), LivenessProbe:(*core.Probe)(nil), ReadinessProbe:(*core.Probe)(nil), Lifecycle:(*core.Lifecycle)(nil), TerminationMessagePath:"/dev/termination-log", TerminationMessagePolicy:"File", ImagePullPolicy:"IfNotPresent", SecurityContext:(*core.SecurityContext)(nil), Stdin:false, StdinOnce:false, TTY:false}}, RestartPolicy:"Always", TerminationGracePeriodSeconds:(*int64)(0xc000a00e28), ActiveDeadlineSeconds:(*int64)(nil), DNSPolicy:"ClusterFirst", NodeSelector:map[string]string(nil), ServiceAccountName:"default", AutomountServiceAccountToken:(*bool)(nil), NodeName:"docker-desktop", SecurityContext:(*core.PodSecurityContext)(0xc000552150), ImagePullSecrets:[]core.LocalObjectReference(nil), Hostname:"", Subdomain:"", Affinity:(*core.Affinity)(nil), SchedulerName:"default-scheduler", Tolerations:[]core.Toleration{core.Toleration{Key:"node.kubernetes.io/not-ready", Operator:"Exists", Value:"", Effect:"NoExecute", TolerationSeconds:(*int64)(0xc000a00ec0)}, core.Toleration{Key:"node.kubernetes.io/unreachable", Operator:"Exists", Value:"", Effect:"NoExecute", TolerationSeconds:(*int64)(0xc000a00ee0)}}, HostAliases:[]core.HostAlias(nil), PriorityClassName:"", Priority:(*int32)(0xc000a00ef0), DNSConfig:(*core.PodDNSConfig)(nil), ReadinessGates:[]core.PodReadinessGate(nil), RuntimeClassName:(*string)(nil)}, Status:core.PodStatus{Phase:"Running", Conditions:[]core.PodCondition{core.PodCondition{Type:"PodReadyToStartContainers", Status:"True", LastProbeTime:v1.Time{Time:time.Time{wall:0x0, ext:0, loc:(*time.Location)(nil)}}, LastTransitionTime:v1.Time{Time:time.Time{wall:0x0, ext:63864015401, loc:(*time.Location)(0x3597a80)}}, Reason:"", Message:""}, core.PodCondition{Type:"Initialized", Status:"True", LastProbeTime:v1.Time{Time:time.Time{wall:0x0, ext:0, loc:(*time.Location)(nil)}}, LastTransitionTime:v1.Time{Time:time.Time{wall:0x0, ext:63864015388, loc:(*time.Location)(0x3597a80)}}, Reason:"", Message:""}, core.PodCondition{Type:"Ready", Status:"True", LastProbeTime:v1.Time{Time:time.Time{wall:0x0, ext:0, loc:(*time.Location)(nil)}}, LastTransitionTime:v1.Time{Time:time.Time{wall:0x0, ext:63864015401, loc:(*time.Location)(0x3597a80)}}, Reason:"", Message:""}, core.PodCondition{Type:"ContainersReady", Status:"True", LastProbeTime:v1.Time{Time:time.Time{wall:0x0, ext:0, loc:(*time.Location)(nil)}}, LastTransitionTime:v1.Time{Time:time.Time{wall:0x0, ext:63864015401, loc:(*time.Location)(0x3597a80)}}, Reason:"", Message:""}, core.PodCondition{Type:"PodScheduled", Status:"True", LastProbeTime:v1.Time{Time:time.Time{wall:0x0, ext:0, loc:(*time.Location)(nil)}}, LastTransitionTime:v1.Time{Time:time.Time{wall:0x0, ext:63864015388, loc:(*time.Location)(0x3597a80)}}, Reason:"", Message:""}}, Message:"", Reason:"", NominatedNodeName:"", HostIP:"192.168.65.3", PodIP:"10.1.0.32", StartTime:(*v1.Time)(0xc0008e7a20), QOSClass:"BestEffort", InitContainerStatuses:[]core.ContainerStatus(nil), ContainerStatuses:[]core.ContainerStatus{core.ContainerStatus{Name:"dnsutils", State:core.ContainerState{Waiting:(*core.ContainerStateWaiting)(nil), Running:(*core.ContainerStateRunning)(0xc0008e7a60), Terminated:(*core.ContainerStateTerminated)(nil)}, LastTerminationState:core.ContainerState{Waiting:(*core.ContainerStateWaiting)(nil), Running:(*core.ContainerStateRunning)(nil), Terminated:(*core.ContainerStateTerminated)(nil)}, Ready:true, RestartCount:0, Image:"registry.k8s.io/e2e-test-images/agnhost:2.39", ImageID:"docker-pullable://registry.k8s.io/e2e-test-images/agnhost@sha256:7e8bdd271312fd25fc5ff5a8f04727be84044eb3d7d8d03611972a6752e2e11e", ContainerID:"docker://46b94bae71f9519b1e613f2a13a2bb8f33637486ffdb25589b78455635f99adb"}}}}': selfLink was empty, can't make reference
Name:               dnsutils
Namespace:          default
Priority:           0
PriorityClassName:  <none>
Node:               docker-desktop/192.168.65.3
Start Time:         Tue, 08 Oct 2024 13:16:28 -0700
Labels:             <none>
Annotations:        kubectl.kubernetes.io/last-applied-configuration:
                      {"apiVersion":"v1","kind":"Pod","metadata":{"annotations":{},"name":"dnsutils","namespace":"default"},"spec":{"containers":[{"image":"regi...
Status:             Running
IP:                 10.1.0.32
Containers:
  dnsutils:
    Container ID:   docker://46b94bae71f9519b1e613f2a13a2bb8f33637486ffdb25589b78455635f99adb
    Image:          registry.k8s.io/e2e-test-images/agnhost:2.39
    Image ID:       docker-pullable://registry.k8s.io/e2e-test-images/agnhost@sha256:7e8bdd271312fd25fc5ff5a8f04727be84044eb3d7d8d03611972a6752e2e11e
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Tue, 08 Oct 2024 13:16:40 -0700
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-ml4xg (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-ml4xg:
  <unknown>
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute for 300s
                 node.kubernetes.io/unreachable:NoExecute for 300s
tim@Tims-MBP kubernetes % 

