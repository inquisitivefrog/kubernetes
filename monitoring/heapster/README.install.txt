
https://elatov.github.io/2018/06/installing-heapster-for-kubernetes/

tim@Tims-MBP heapster % git clone https://github.com/kubernetes/heapster.git
Cloning into 'heapster'...
remote: Enumerating objects: 30714, done.
remote: Total 30714 (delta 0), reused 0 (delta 0), pack-reused 30714 (from 1)
Receiving objects: 100% (30714/30714), 39.30 MiB | 5.05 MiB/s, done.
Resolving deltas: 100% (15704/15704), done.
Updating files: 100% (3599/3599), done.
tim@Tims-MBP heapster % find heapster | wc -l
    4421
tim@Tims-MBP heapster % vi heapster/deploy/kube-config/influxdb/grafana.yaml
# heapster/deploy/kube-config/influxdb/grafana.yaml
type: NodePort
  ports:
  - port: 80
    targetPort: 3000
    nodePort: 30081

# heapster/deploy/kube-config/influxdb/grafana.yaml
- name: grafana-storage
        hostPath:
          path: /data/shared/heapster/grafana/data
tim@Tims-MBP heapster % yq heapster/deploy/kube-config/influxdb/grafana.yaml
tim@Tims-MBP heapster % vi heapster/deploy/kube-config/influxdb/influxdb.yaml 
# heapster/deploy/kube-config/influxdb/influxdb.yaml
- name: influxdb-storage
        hostPath:
          path: /data/shared/heapster/influxdb/data
tim@Tims-MBP heapster % yq heapster/deploy/kube-config/influxdb/influxdb.yaml

tim@Tims-MBP heapster % kubectl --namespace=kube-system create -f heapster/deploy/kube-config/influxdb/ 
service/monitoring-grafana created
serviceaccount/heapster created
service/heapster created
service/monitoring-influxdb created
unable to recognize "heapster/deploy/kube-config/influxdb/grafana.yaml": no matches for kind "Deployment" in version "extensions/v1beta1"
unable to recognize "heapster/deploy/kube-config/influxdb/heapster.yaml": no matches for kind "Deployment" in version "extensions/v1beta1"
unable to recognize "heapster/deploy/kube-config/influxdb/influxdb.yaml": no matches for kind "Deployment" in version "extensions/v1beta1"
tim@Tims-MBP heapster % kubectl --namespace=kube-system get services
NAME                  TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE
heapster              ClusterIP   10.105.131.15   <none>        80/TCP                   31s
kube-dns              ClusterIP   10.96.0.10      <none>        53/UDP,53/TCP,9153/TCP   4d22h
monitoring-grafana    NodePort    10.105.41.63    <none>        80:30081/TCP             31s
monitoring-influxdb   ClusterIP   10.97.143.33    <none>        8086/TCP                 31s
tim@Tims-MBP heapster % kubectl --namespace=kube-system get pods                                       
NAME                                     READY   STATUS         RESTARTS       AGE
coredns-7db6d8ff4d-7kb9x                 1/1     Running        2 (3h8m ago)   4d22h
coredns-7db6d8ff4d-gkp5z                 1/1     Running        2 (3h8m ago)   4d22h
etcd-docker-desktop                      1/1     Running        2 (3h8m ago)   4d22h
kube-apiserver-docker-desktop            1/1     Running        2 (3h8m ago)   4d22h
kube-controller-manager-docker-desktop   1/1     Running        2 (3h8m ago)   4d22h
kube-proxy-v6mck                         1/1     Running        2 (3h8m ago)   4d22h
kube-scheduler-docker-desktop            1/1     Running        2 (3h8m ago)   4d22h
monitoring-heapster-controller-kkhpw     0/1     ErrImagePull   0              3s
storage-provisioner                      1/1     Running        4 (3h7m ago)   4d22h
vpnkit-controller                        1/1     Running        2 (3h8m ago)   4d22h
tim@Tims-MBP heapster % grep monitoring-heapster heapster/deploy/kube-config/influxdb/grafana.yaml 
tim@Tims-MBP heapster % grep monitoring-heapster heapster/deploy/kube-config/influxdb/influxdb.yaml 
tim@Tims-MBP heapster % 

tim@Tims-MBP heapster % kubectl --namespace=kube-system describe pod monitoring-heapster-controller-kkhpw  
E1008 14:19:23.051604   11774 describe.go:616] Unable to construct reference to '&core.Pod{TypeMeta:v1.TypeMeta{Kind:"", APIVersion:""}, ObjectMeta:v1.ObjectMeta{Name:"monitoring-heapster-controller-kkhpw", GenerateName:"monitoring-heapster-controller-", Namespace:"kube-system", SelfLink:"", UID:"e8d878ab-9f91-4716-85d1-117160bdd190", ResourceVersion:"225817", Generation:0, CreationTimestamp:v1.Time{Time:time.Time{wall:0x0, ext:63864019051, loc:(*time.Location)(0x3597a80)}}, DeletionTimestamp:(*v1.Time)(nil), DeletionGracePeriodSeconds:(*int64)(nil), Labels:map[string]string{"name":"heapster"}, Annotations:map[string]string(nil), OwnerReferences:[]v1.OwnerReference{v1.OwnerReference{APIVersion:"v1", Kind:"ReplicationController", Name:"monitoring-heapster-controller", UID:"e6e665b2-660c-4360-bd27-c1a3c2a138d7", Controller:(*bool)(0xc0009c0046), BlockOwnerDeletion:(*bool)(0xc0009c0047)}}, Initializers:(*v1.Initializers)(nil), Finalizers:[]string(nil), ClusterName:""}, Spec:core.PodSpec{Volumes:[]core.Volume{core.Volume{Name:"kube-api-access-5jb9z", VolumeSource:core.VolumeSource{HostPath:(*core.HostPathVolumeSource)(nil), EmptyDir:(*core.EmptyDirVolumeSource)(nil), GCEPersistentDisk:(*core.GCEPersistentDiskVolumeSource)(nil), AWSElasticBlockStore:(*core.AWSElasticBlockStoreVolumeSource)(nil), GitRepo:(*core.GitRepoVolumeSource)(nil), Secret:(*core.SecretVolumeSource)(nil), NFS:(*core.NFSVolumeSource)(nil), ISCSI:(*core.ISCSIVolumeSource)(nil), Glusterfs:(*core.GlusterfsVolumeSource)(nil), PersistentVolumeClaim:(*core.PersistentVolumeClaimVolumeSource)(nil), RBD:(*core.RBDVolumeSource)(nil), Quobyte:(*core.QuobyteVolumeSource)(nil), FlexVolume:(*core.FlexVolumeSource)(nil), Cinder:(*core.CinderVolumeSource)(nil), CephFS:(*core.CephFSVolumeSource)(nil), Flocker:(*core.FlockerVolumeSource)(nil), DownwardAPI:(*core.DownwardAPIVolumeSource)(nil), FC:(*core.FCVolumeSource)(nil), AzureFile:(*core.AzureFileVolumeSource)(nil), ConfigMap:(*core.ConfigMapVolumeSource)(nil), VsphereVolume:(*core.VsphereVirtualDiskVolumeSource)(nil), AzureDisk:(*core.AzureDiskVolumeSource)(nil), PhotonPersistentDisk:(*core.PhotonPersistentDiskVolumeSource)(nil), Projected:(*core.ProjectedVolumeSource)(0xc0007c0360), PortworxVolume:(*core.PortworxVolumeSource)(nil), ScaleIO:(*core.ScaleIOVolumeSource)(nil), StorageOS:(*core.StorageOSVolumeSource)(nil)}}}, InitContainers:[]core.Container(nil), Containers:[]core.Container{core.Container{Name:"heapster", Image:"kubernetes/heapster:v0.13.0", Command:[]string{"/heapster", "--source=kubernetes:http://kubernetes-ro?inClusterConfig=false&useServiceAccount=true&auth=", "--sink=influxdb:http://monitoring-influxdb:80"}, Args:[]string(nil), WorkingDir:"", Ports:[]core.ContainerPort(nil), EnvFrom:[]core.EnvFromSource(nil), Env:[]core.EnvVar(nil), Resources:core.ResourceRequirements{Limits:core.ResourceList(nil), Requests:core.ResourceList(nil)}, VolumeMounts:[]core.VolumeMount{core.VolumeMount{Name:"kube-api-access-5jb9z", ReadOnly:true, MountPath:"/var/run/secrets/kubernetes.io/serviceaccount", SubPath:"", MountPropagation:(*core.MountPropagationMode)(nil)}}, VolumeDevices:[]core.VolumeDevice(nil), LivenessProbe:(*core.Probe)(nil), ReadinessProbe:(*core.Probe)(nil), Lifecycle:(*core.Lifecycle)(nil), TerminationMessagePath:"/dev/termination-log", TerminationMessagePolicy:"File", ImagePullPolicy:"IfNotPresent", SecurityContext:(*core.SecurityContext)(nil), Stdin:false, StdinOnce:false, TTY:false}}, RestartPolicy:"Always", TerminationGracePeriodSeconds:(*int64)(0xc000aa80e8), ActiveDeadlineSeconds:(*int64)(nil), DNSPolicy:"ClusterFirst", NodeSelector:map[string]string(nil), ServiceAccountName:"heapster", AutomountServiceAccountToken:(*bool)(nil), NodeName:"docker-desktop", SecurityContext:(*core.PodSecurityContext)(0xc000398150), ImagePullSecrets:[]core.LocalObjectReference(nil), Hostname:"", Subdomain:"", Affinity:(*core.Affinity)(nil), SchedulerName:"default-scheduler", Tolerations:[]core.Toleration{core.Toleration{Key:"node.kubernetes.io/not-ready", Operator:"Exists", Value:"", Effect:"NoExecute", TolerationSeconds:(*int64)(0xc000aa8190)}, core.Toleration{Key:"node.kubernetes.io/unreachable", Operator:"Exists", Value:"", Effect:"NoExecute", TolerationSeconds:(*int64)(0xc000aa81b0)}}, HostAliases:[]core.HostAlias(nil), PriorityClassName:"", Priority:(*int32)(0xc000aa81c0), DNSConfig:(*core.PodDNSConfig)(nil), ReadinessGates:[]core.PodReadinessGate(nil), RuntimeClassName:(*string)(nil)}, Status:core.PodStatus{Phase:"Pending", Conditions:[]core.PodCondition{core.PodCondition{Type:"PodReadyToStartContainers", Status:"True", LastProbeTime:v1.Time{Time:time.Time{wall:0x0, ext:0, loc:(*time.Location)(nil)}}, LastTransitionTime:v1.Time{Time:time.Time{wall:0x0, ext:63864019053, loc:(*time.Location)(0x3597a80)}}, Reason:"", Message:""}, core.PodCondition{Type:"Initialized", Status:"True", LastProbeTime:v1.Time{Time:time.Time{wall:0x0, ext:0, loc:(*time.Location)(nil)}}, LastTransitionTime:v1.Time{Time:time.Time{wall:0x0, ext:63864019051, loc:(*time.Location)(0x3597a80)}}, Reason:"", Message:""}, core.PodCondition{Type:"Ready", Status:"False", LastProbeTime:v1.Time{Time:time.Time{wall:0x0, ext:0, loc:(*time.Location)(nil)}}, LastTransitionTime:v1.Time{Time:time.Time{wall:0x0, ext:63864019051, loc:(*time.Location)(0x3597a80)}}, Reason:"ContainersNotReady", Message:"containers with unready status: [heapster]"}, core.PodCondition{Type:"ContainersReady", Status:"False", LastProbeTime:v1.Time{Time:time.Time{wall:0x0, ext:0, loc:(*time.Location)(nil)}}, LastTransitionTime:v1.Time{Time:time.Time{wall:0x0, ext:63864019051, loc:(*time.Location)(0x3597a80)}}, Reason:"ContainersNotReady", Message:"containers with unready status: [heapster]"}, core.PodCondition{Type:"PodScheduled", Status:"True", LastProbeTime:v1.Time{Time:time.Time{wall:0x0, ext:0, loc:(*time.Location)(nil)}}, LastTransitionTime:v1.Time{Time:time.Time{wall:0x0, ext:63864019051, loc:(*time.Location)(0x3597a80)}}, Reason:"", Message:""}}, Message:"", Reason:"", NominatedNodeName:"", HostIP:"192.168.65.3", PodIP:"10.1.0.34", StartTime:(*v1.Time)(0xc0007c02e0), QOSClass:"BestEffort", InitContainerStatuses:[]core.ContainerStatus(nil), ContainerStatuses:[]core.ContainerStatus{core.ContainerStatus{Name:"heapster", State:core.ContainerState{Waiting:(*core.ContainerStateWaiting)(0xc0007c0320), Running:(*core.ContainerStateRunning)(nil), Terminated:(*core.ContainerStateTerminated)(nil)}, LastTerminationState:core.ContainerState{Waiting:(*core.ContainerStateWaiting)(nil), Running:(*core.ContainerStateRunning)(nil), Terminated:(*core.ContainerStateTerminated)(nil)}, Ready:false, RestartCount:0, Image:"kubernetes/heapster:v0.13.0", ImageID:"", ContainerID:""}}}}': selfLink was empty, can't make reference
Name:               monitoring-heapster-controller-kkhpw
Namespace:          kube-system
Priority:           0
PriorityClassName:  <none>
Node:               docker-desktop/192.168.65.3
Start Time:         Tue, 08 Oct 2024 14:17:31 -0700
Labels:             name=heapster
Annotations:        <none>
Status:             Pending
IP:                 10.1.0.34
Controlled By:      ReplicationController/monitoring-heapster-controller
Containers:
  heapster:
    Container ID:  
    Image:         kubernetes/heapster:v0.13.0
    Image ID:      
    Port:          <none>
    Host Port:     <none>
    Command:
      /heapster
      --source=kubernetes:http://kubernetes-ro?inClusterConfig=false&useServiceAccount=true&auth=
      --sink=influxdb:http://monitoring-influxdb:80
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-5jb9z (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-5jb9z:
  <unknown>
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute for 300s
                 node.kubernetes.io/unreachable:NoExecute for 300s

tim@Tims-MBP heapster % kubectl --namespace=kube-system describe service monitoring-grafana
Name:                     monitoring-grafana
Namespace:                kube-system
Labels:                   kubernetes.io/cluster-service=true
                          kubernetes.io/name=monitoring-grafana
Annotations:              <none>
Selector:                 k8s-app=grafana
Type:                     NodePort
IP:                       10.105.41.63
Port:                     <unset>  80/TCP
TargetPort:               3000/TCP
NodePort:                 <unset>  30081/TCP
Endpoints:                <none>
Session Affinity:         None
External Traffic Policy:  Cluster
tim@Tims-MBP heapster % kubectl --namespace=kube-system describe service monitoring-influxdb
Name:              monitoring-influxdb
Namespace:         kube-system
Labels:            kubernetes.io/cluster-service=true
                   kubernetes.io/name=monitoring-influxdb
                   task=monitoring
Annotations:       <none>
Selector:          k8s-app=influxdb
Type:              ClusterIP
IP:                10.97.143.33
Port:              <unset>  8086/TCP
TargetPort:        8086/TCP
Endpoints:         <none>
Session Affinity:  None


