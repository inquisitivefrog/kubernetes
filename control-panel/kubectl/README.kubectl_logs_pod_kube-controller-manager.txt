
sre@k8s-controller-01:~$ kubectl get pods --all-namespaces=true -o wide
NAMESPACE     NAME                                        READY   STATUS    RESTARTS       AGE   IP              NODE                NOMINATED NODE   READINESS GATES
kube-system   coredns-5dd5756b68-2zrhr                    0/1     Pending   0              20h   <none>          <none>              <none>           <none>
kube-system   coredns-5dd5756b68-wcs5x                    0/1     Pending   0              20h   <none>          <none>              <none>           <none>
kube-system   etcd-k8s-controller-01                      1/1     Running   1 (126m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-apiserver-k8s-controller-01            1/1     Running   1 (126m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-controller-manager-k8s-controller-01   1/1     Running   1 (126m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-proxy-p4jmn                            1/1     Running   1 (126m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-scheduler-k8s-controller-01            1/1     Running   1 (126m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
sre@k8s-controller-01:~$ kubectl --namespace=kube-system logs kube-controller-manager-k8s-controller-01 --container=kube-controller-manager
I1025 16:06:03.138991       1 serving.go:348] Generated self-signed cert in-memory
I1025 16:06:04.026436       1 controllermanager.go:189] "Starting" version="v1.28.15"
I1025 16:06:04.026493       1 controllermanager.go:191] "Golang settings" GOGC="" GOMAXPROCS="" GOTRACEBACK=""
I1025 16:06:04.038415       1 secure_serving.go:213] Serving securely on 127.0.0.1:10257
I1025 16:06:04.042711       1 tlsconfig.go:240] "Starting DynamicServingCertificateController"
I1025 16:06:04.042885       1 dynamic_cafile_content.go:157] "Starting controller" name="request-header::/etc/kubernetes/pki/front-proxy-ca.crt"
I1025 16:06:04.043346       1 dynamic_cafile_content.go:157] "Starting controller" name="client-ca-bundle::/etc/kubernetes/pki/ca.crt"
I1025 16:06:04.049915       1 leaderelection.go:250] attempting to acquire leader lease kube-system/kube-controller-manager...
E1025 16:06:05.795853       1 leaderelection.go:332] error retrieving resource lock kube-system/kube-controller-manager: leases.coordination.k8s.io "kube-controller-manager" is forbidden: User "system:kube-controller-manager" cannot get resource "leases" in API group "coordination.k8s.io" in the namespace "kube-system"
I1025 16:06:25.810048       1 leaderelection.go:260] successfully acquired lease kube-system/kube-controller-manager
I1025 16:06:25.812390       1 event.go:307] "Event occurred" object="kube-system/kube-controller-manager" fieldPath="" kind="Lease" apiVersion="coordination.k8s.io/v1" type="Normal" reason="LeaderElection" message="k8s-controller-01_4df8127c-ac19-462b-bf57-be6656e61d6a became leader"
I1025 16:06:25.837945       1 shared_informer.go:311] Waiting for caches to sync for tokens
I1025 16:06:25.847082       1 controllermanager.go:642] "Started controller" controller="persistentvolume-attach-detach-controller"
I1025 16:06:25.851871       1 attach_detach_controller.go:337] "Starting attach detach controller"
I1025 16:06:25.851922       1 shared_informer.go:311] Waiting for caches to sync for attach detach
I1025 16:06:25.853943       1 controllermanager.go:642] "Started controller" controller="statefulset-controller"
I1025 16:06:25.856667       1 stateful_set.go:163] "Starting stateful set controller"
I1025 16:06:25.856720       1 shared_informer.go:311] Waiting for caches to sync for stateful set
I1025 16:06:25.860267       1 controllermanager.go:642] "Started controller" controller="cronjob-controller"
I1025 16:06:25.861616       1 cronjob_controllerv2.go:139] "Starting cronjob controller v2"
I1025 16:06:25.861643       1 shared_informer.go:311] Waiting for caches to sync for cronjob
I1025 16:06:25.866610       1 node_lifecycle_controller.go:431] "Controller will reconcile labels"
I1025 16:06:25.866968       1 controllermanager.go:642] "Started controller" controller="node-lifecycle-controller"
I1025 16:06:25.867394       1 core.go:228] "Warning: configure-cloud-routes is set, but no cloud provider specified. Will not configure cloud provider routes."
I1025 16:06:25.867518       1 controllermanager.go:620] "Warning: skipping controller" controller="node-route-controller"
I1025 16:06:25.867168       1 node_lifecycle_controller.go:465] "Sending events to api server"
I1025 16:06:25.867683       1 node_lifecycle_controller.go:476] "Starting node controller"
I1025 16:06:25.867887       1 shared_informer.go:311] Waiting for caches to sync for taint
I1025 16:06:25.871661       1 controllermanager.go:642] "Started controller" controller="endpoints-controller"
I1025 16:06:25.871842       1 endpoints_controller.go:177] "Starting endpoint controller"
I1025 16:06:25.871921       1 shared_informer.go:311] Waiting for caches to sync for endpoint
I1025 16:06:25.876218       1 controllermanager.go:642] "Started controller" controller="replicationcontroller-controller"
I1025 16:06:25.876472       1 replica_set.go:214] "Starting controller" name="replicationcontroller"
I1025 16:06:25.876483       1 shared_informer.go:311] Waiting for caches to sync for ReplicationController
I1025 16:06:25.889007       1 garbagecollector.go:155] "Starting controller" controller="garbagecollector"
I1025 16:06:25.889724       1 shared_informer.go:311] Waiting for caches to sync for garbage collector
I1025 16:06:25.889785       1 graph_builder.go:294] "Running" component="GraphBuilder"
I1025 16:06:25.889923       1 controllermanager.go:642] "Started controller" controller="garbage-collector-controller"
I1025 16:06:25.894156       1 controllermanager.go:642] "Started controller" controller="ttl-after-finished-controller"
I1025 16:06:25.896244       1 ttlafterfinished_controller.go:109] "Starting TTL after finished controller"
I1025 16:06:25.896947       1 shared_informer.go:311] Waiting for caches to sync for TTL after finished
I1025 16:06:25.904937       1 controllermanager.go:642] "Started controller" controller="pod-garbage-collector-controller"
I1025 16:06:25.909902       1 gc_controller.go:101] "Starting GC controller"
I1025 16:06:25.910095       1 shared_informer.go:311] Waiting for caches to sync for GC
I1025 16:06:25.934173       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="replicasets.apps"
I1025 16:06:25.934539       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="horizontalpodautoscalers.autoscaling"
I1025 16:06:25.934661       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="csistoragecapacities.storage.k8s.io"
I1025 16:06:25.935260       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="controllerrevisions.apps"
I1025 16:06:25.935320       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="statefulsets.apps"
I1025 16:06:25.935602       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="limitranges"
I1025 16:06:25.937017       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="rolebindings.rbac.authorization.k8s.io"
I1025 16:06:25.937077       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="leases.coordination.k8s.io"
I1025 16:06:25.937103       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="endpointslices.discovery.k8s.io"
I1025 16:06:25.937608       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="podtemplates"
I1025 16:06:25.937679       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="jobs.batch"
I1025 16:06:25.937907       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="poddisruptionbudgets.policy"
I1025 16:06:25.937970       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="endpoints"
I1025 16:06:25.937992       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="deployments.apps"
W1025 16:06:25.938001       1 shared_informer.go:593] resyncPeriod 23h1m48.454890448s is smaller than resyncCheckPeriod 23h4m48.051464933s and the informer has already started. Changing it to 23h4m48.051464933s
I1025 16:06:25.938084       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="networkpolicies.networking.k8s.io"
I1025 16:06:25.938461       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="ingresses.networking.k8s.io"
I1025 16:06:25.938421       1 shared_informer.go:318] Caches are synced for tokens
I1025 16:06:25.938494       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="roles.rbac.authorization.k8s.io"
I1025 16:06:25.938540       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="serviceaccounts"
I1025 16:06:25.938553       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="daemonsets.apps"
I1025 16:06:25.938565       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="cronjobs.batch"
I1025 16:06:25.938597       1 controllermanager.go:642] "Started controller" controller="resourcequota-controller"
I1025 16:06:25.938656       1 resource_quota_controller.go:294] "Starting resource quota controller"
I1025 16:06:25.938663       1 shared_informer.go:311] Waiting for caches to sync for resource quota
I1025 16:06:25.938673       1 resource_quota_monitor.go:305] "QuotaMonitor running"
I1025 16:06:25.941789       1 controllermanager.go:642] "Started controller" controller="token-cleaner-controller"
I1025 16:06:25.944030       1 tokencleaner.go:112] "Starting token cleaner controller"
I1025 16:06:25.944658       1 shared_informer.go:311] Waiting for caches to sync for token_cleaner
I1025 16:06:25.945639       1 shared_informer.go:318] Caches are synced for token_cleaner
I1025 16:06:37.258446       1 range_allocator.go:111] "No Secondary Service CIDR provided. Skipping filtering out secondary service addresses"
I1025 16:06:37.258500       1 controllermanager.go:642] "Started controller" controller="node-ipam-controller"
I1025 16:06:37.258668       1 node_ipam_controller.go:162] "Starting ipam controller"
I1025 16:06:37.258679       1 shared_informer.go:311] Waiting for caches to sync for node
I1025 16:06:37.263004       1 controllermanager.go:642] "Started controller" controller="endpointslice-controller"
I1025 16:06:37.264070       1 endpointslice_controller.go:273] "Starting endpoint slice controller"
I1025 16:06:37.264167       1 shared_informer.go:311] Waiting for caches to sync for endpoint_slice
I1025 16:06:37.277248       1 controllermanager.go:642] "Started controller" controller="namespace-controller"
I1025 16:06:37.278980       1 namespace_controller.go:197] "Starting namespace controller"
I1025 16:06:37.279514       1 shared_informer.go:311] Waiting for caches to sync for namespace
I1025 16:06:37.280086       1 controllermanager.go:642] "Started controller" controller="certificatesigningrequest-approving-controller"
I1025 16:06:37.281875       1 certificate_controller.go:115] "Starting certificate controller" name="csrapproving"
I1025 16:06:37.283604       1 shared_informer.go:311] Waiting for caches to sync for certificate-csrapproving
I1025 16:06:37.286193       1 controllermanager.go:642] "Started controller" controller="bootstrap-signer-controller"
I1025 16:06:37.286517       1 shared_informer.go:311] Waiting for caches to sync for bootstrap_signer
I1025 16:06:37.289318       1 controllermanager.go:642] "Started controller" controller="persistentvolume-expander-controller"
I1025 16:06:37.290567       1 expand_controller.go:328] "Starting expand controller"
I1025 16:06:37.290586       1 shared_informer.go:311] Waiting for caches to sync for expand
I1025 16:06:37.313616       1 controllermanager.go:642] "Started controller" controller="persistentvolumeclaim-protection-controller"
I1025 16:06:37.314116       1 pvc_protection_controller.go:102] "Starting PVC protection controller"
I1025 16:06:37.314162       1 shared_informer.go:311] Waiting for caches to sync for PVC protection
I1025 16:06:37.320590       1 controllermanager.go:642] "Started controller" controller="serviceaccount-controller"
I1025 16:06:37.320837       1 serviceaccounts_controller.go:111] "Starting service account controller"
I1025 16:06:37.322520       1 shared_informer.go:311] Waiting for caches to sync for service account
I1025 16:06:37.328978       1 controllermanager.go:642] "Started controller" controller="horizontal-pod-autoscaler-controller"
I1025 16:06:37.333146       1 controllermanager.go:642] "Started controller" controller="certificatesigningrequest-cleaner-controller"
I1025 16:06:37.333402       1 horizontal.go:200] "Starting HPA controller"
I1025 16:06:37.334742       1 shared_informer.go:311] Waiting for caches to sync for HPA
I1025 16:06:37.333539       1 cleaner.go:83] "Starting CSR cleaner controller"
E1025 16:06:37.338313       1 core.go:92] "Failed to start service controller" err="WARNING: no cloud provider provided, services of type LoadBalancer will fail"
I1025 16:06:37.340138       1 controllermanager.go:620] "Warning: skipping controller" controller="service-lb-controller"
I1025 16:06:37.345185       1 controllermanager.go:642] "Started controller" controller="job-controller"
I1025 16:06:37.347834       1 job_controller.go:226] "Starting job controller"
I1025 16:06:37.348506       1 shared_informer.go:311] Waiting for caches to sync for job
I1025 16:06:37.352941       1 controllermanager.go:642] "Started controller" controller="persistentvolume-binder-controller"
I1025 16:06:37.354851       1 pv_controller_base.go:319] "Starting persistent volume controller"
I1025 16:06:37.354998       1 shared_informer.go:311] Waiting for caches to sync for persistent volume
I1025 16:06:37.356443       1 controllermanager.go:642] "Started controller" controller="root-ca-certificate-publisher-controller"
I1025 16:06:37.356913       1 publisher.go:102] "Starting root CA cert publisher controller"
I1025 16:06:37.356928       1 shared_informer.go:311] Waiting for caches to sync for crt configmap
I1025 16:06:37.359138       1 controllermanager.go:642] "Started controller" controller="persistentvolume-protection-controller"
I1025 16:06:37.361465       1 pv_protection_controller.go:78] "Starting PV protection controller"
I1025 16:06:37.361948       1 shared_informer.go:311] Waiting for caches to sync for PV protection
I1025 16:06:37.363742       1 controllermanager.go:642] "Started controller" controller="ephemeral-volume-controller"
I1025 16:06:37.365018       1 controller.go:169] "Starting ephemeral volume controller"
I1025 16:06:37.365095       1 shared_informer.go:311] Waiting for caches to sync for ephemeral
I1025 16:06:37.366484       1 controllermanager.go:642] "Started controller" controller="endpointslice-mirroring-controller"
I1025 16:06:37.366757       1 endpointslicemirroring_controller.go:223] "Starting EndpointSliceMirroring controller"
I1025 16:06:37.367745       1 shared_informer.go:311] Waiting for caches to sync for endpoint_slice_mirroring
I1025 16:06:37.369264       1 controllermanager.go:642] "Started controller" controller="deployment-controller"
I1025 16:06:37.369447       1 deployment_controller.go:168] "Starting controller" controller="deployment"
I1025 16:06:37.369456       1 shared_informer.go:311] Waiting for caches to sync for deployment
I1025 16:06:37.373925       1 controllermanager.go:642] "Started controller" controller="ttl-controller"
I1025 16:06:37.374353       1 ttl_controller.go:124] "Starting TTL controller"
I1025 16:06:37.375271       1 shared_informer.go:311] Waiting for caches to sync for TTL
I1025 16:06:37.378745       1 controllermanager.go:642] "Started controller" controller="clusterrole-aggregation-controller"
I1025 16:06:37.379280       1 clusterroleaggregation_controller.go:189] "Starting ClusterRoleAggregator controller"
I1025 16:06:37.380443       1 shared_informer.go:311] Waiting for caches to sync for ClusterRoleAggregator
E1025 16:06:37.382471       1 core.go:213] "Failed to start cloud node lifecycle controller" err="no cloud provider provided"
I1025 16:06:37.382492       1 controllermanager.go:620] "Warning: skipping controller" controller="cloud-node-lifecycle-controller"
I1025 16:06:37.385069       1 controllermanager.go:642] "Started controller" controller="daemonset-controller"
I1025 16:06:37.385416       1 daemon_controller.go:291] "Starting daemon sets controller"
I1025 16:06:37.386438       1 shared_informer.go:311] Waiting for caches to sync for daemon sets
I1025 16:06:37.388049       1 controllermanager.go:642] "Started controller" controller="replicaset-controller"
I1025 16:06:37.389760       1 replica_set.go:214] "Starting controller" name="replicaset"
I1025 16:06:37.389783       1 shared_informer.go:311] Waiting for caches to sync for ReplicaSet
I1025 16:06:37.393403       1 controllermanager.go:642] "Started controller" controller="disruption-controller"
I1025 16:06:37.393710       1 disruption.go:433] "Sending events to api server."
I1025 16:06:37.393953       1 disruption.go:444] "Starting disruption controller"
I1025 16:06:37.394644       1 shared_informer.go:311] Waiting for caches to sync for disruption
I1025 16:06:37.399113       1 controllermanager.go:642] "Started controller" controller="certificatesigningrequest-signing-controller"
I1025 16:06:37.399670       1 certificate_controller.go:115] "Starting certificate controller" name="csrsigning-kubelet-serving"
I1025 16:06:37.402306       1 shared_informer.go:311] Waiting for caches to sync for certificate-csrsigning-kubelet-serving
I1025 16:06:37.399688       1 dynamic_serving_content.go:132] "Starting controller" name="csr-controller::/etc/kubernetes/pki/ca.crt::/etc/kubernetes/pki/ca.key"
I1025 16:06:37.399732       1 certificate_controller.go:115] "Starting certificate controller" name="csrsigning-kubelet-client"
I1025 16:06:37.402601       1 shared_informer.go:311] Waiting for caches to sync for certificate-csrsigning-kubelet-client
I1025 16:06:37.399745       1 dynamic_serving_content.go:132] "Starting controller" name="csr-controller::/etc/kubernetes/pki/ca.crt::/etc/kubernetes/pki/ca.key"
I1025 16:06:37.399775       1 certificate_controller.go:115] "Starting certificate controller" name="csrsigning-kube-apiserver-client"
I1025 16:06:37.402998       1 shared_informer.go:311] Waiting for caches to sync for certificate-csrsigning-kube-apiserver-client
I1025 16:06:37.399792       1 dynamic_serving_content.go:132] "Starting controller" name="csr-controller::/etc/kubernetes/pki/ca.crt::/etc/kubernetes/pki/ca.key"
I1025 16:06:37.400182       1 certificate_controller.go:115] "Starting certificate controller" name="csrsigning-legacy-unknown"
I1025 16:06:37.403482       1 shared_informer.go:311] Waiting for caches to sync for certificate-csrsigning-legacy-unknown
I1025 16:06:37.400193       1 dynamic_serving_content.go:132] "Starting controller" name="csr-controller::/etc/kubernetes/pki/ca.crt::/etc/kubernetes/pki/ca.key"
I1025 16:06:37.415571       1 shared_informer.go:311] Waiting for caches to sync for resource quota
I1025 16:06:37.468946       1 shared_informer.go:318] Caches are synced for endpoint_slice_mirroring
I1025 16:06:37.477955       1 actual_state_of_world.go:547] "Failed to update statusUpdateNeeded field in actual state of world" err="Failed to set statusUpdateNeeded to needed true, because nodeName=\"k8s-controller-01\" does not exist"
I1025 16:06:37.478248       1 shared_informer.go:318] Caches are synced for TTL
I1025 16:06:37.484592       1 shared_informer.go:318] Caches are synced for certificate-csrapproving
I1025 16:06:37.488373       1 shared_informer.go:318] Caches are synced for bootstrap_signer
I1025 16:06:37.491342       1 shared_informer.go:318] Caches are synced for TTL after finished
I1025 16:06:37.491555       1 shared_informer.go:318] Caches are synced for namespace
I1025 16:06:37.490838       1 shared_informer.go:318] Caches are synced for expand
I1025 16:06:37.496886       1 shared_informer.go:311] Waiting for caches to sync for garbage collector
I1025 16:06:37.503124       1 shared_informer.go:318] Caches are synced for certificate-csrsigning-kube-apiserver-client
I1025 16:06:37.503497       1 shared_informer.go:318] Caches are synced for GC
I1025 16:06:37.503859       1 shared_informer.go:318] Caches are synced for certificate-csrsigning-legacy-unknown
I1025 16:06:37.503940       1 shared_informer.go:318] Caches are synced for certificate-csrsigning-kubelet-serving
I1025 16:06:37.504017       1 shared_informer.go:318] Caches are synced for certificate-csrsigning-kubelet-client
I1025 16:06:37.514839       1 shared_informer.go:318] Caches are synced for PVC protection
I1025 16:06:37.524893       1 shared_informer.go:318] Caches are synced for service account
I1025 16:06:37.534903       1 shared_informer.go:318] Caches are synced for HPA
I1025 16:06:37.545836       1 shared_informer.go:318] Caches are synced for stateful set
I1025 16:06:37.549711       1 shared_informer.go:318] Caches are synced for job
I1025 16:06:37.550897       1 shared_informer.go:318] Caches are synced for cronjob
I1025 16:06:37.555815       1 shared_informer.go:318] Caches are synced for persistent volume
I1025 16:06:37.558589       1 shared_informer.go:318] Caches are synced for taint
I1025 16:06:37.558966       1 shared_informer.go:318] Caches are synced for crt configmap
I1025 16:06:37.559120       1 shared_informer.go:318] Caches are synced for node
I1025 16:06:37.559170       1 range_allocator.go:174] "Sending events to api server"
I1025 16:06:37.559203       1 range_allocator.go:178] "Starting range CIDR allocator"
I1025 16:06:37.559207       1 shared_informer.go:311] Waiting for caches to sync for cidrallocator
I1025 16:06:37.559211       1 shared_informer.go:318] Caches are synced for cidrallocator
I1025 16:06:37.559888       1 node_lifecycle_controller.go:1225] "Initializing eviction metric for zone" zone=""
I1025 16:06:37.560108       1 node_lifecycle_controller.go:877] "Missing timestamp for Node. Assuming now as a timestamp" node="k8s-controller-01"
I1025 16:06:37.561200       1 node_lifecycle_controller.go:1029] "Controller detected that all Nodes are not-Ready. Entering master disruption mode"
I1025 16:06:37.561318       1 taint_manager.go:205] "Starting NoExecuteTaintManager"
I1025 16:06:37.561377       1 shared_informer.go:318] Caches are synced for endpoint
I1025 16:06:37.561418       1 taint_manager.go:210] "Sending events to api server"
I1025 16:06:37.562490       1 shared_informer.go:318] Caches are synced for PV protection
I1025 16:06:37.563248       1 event.go:307] "Event occurred" object="k8s-controller-01" fieldPath="" kind="Node" apiVersion="v1" type="Normal" reason="RegisteredNode" message="Node k8s-controller-01 event: Registered Node k8s-controller-01 in Controller"
I1025 16:06:37.567227       1 shared_informer.go:318] Caches are synced for ReplicationController
I1025 16:06:37.567766       1 shared_informer.go:318] Caches are synced for endpoint_slice
I1025 16:06:37.567804       1 shared_informer.go:318] Caches are synced for ephemeral
I1025 16:06:37.578573       1 shared_informer.go:318] Caches are synced for deployment
I1025 16:06:37.581681       1 shared_informer.go:318] Caches are synced for ClusterRoleAggregator
I1025 16:06:37.587726       1 shared_informer.go:318] Caches are synced for daemon sets
I1025 16:06:37.615381       1 shared_informer.go:318] Caches are synced for disruption
I1025 16:06:37.615567       1 event.go:307] "Event occurred" object="kube-system/kube-proxy-p4jmn" fieldPath="" kind="Pod" apiVersion="v1" type="Warning" reason="NodeNotReady" message="Node is not ready"
I1025 16:06:37.617245       1 shared_informer.go:318] Caches are synced for ReplicaSet
I1025 16:06:37.622616       1 replica_set.go:676] "Finished syncing" kind="ReplicaSet" key="kube-system/coredns-5dd5756b68" duration="5.206149ms"
I1025 16:06:37.628047       1 shared_informer.go:318] Caches are synced for resource quota
I1025 16:06:37.628411       1 event.go:307] "Event occurred" object="kube-system/etcd-k8s-controller-01" fieldPath="" kind="Pod" apiVersion="v1" type="Warning" reason="NodeNotReady" message="Node is not ready"
I1025 16:06:37.633141       1 event.go:307] "Event occurred" object="kube-system/kube-apiserver-k8s-controller-01" fieldPath="" kind="Pod" apiVersion="v1" type="Warning" reason="NodeNotReady" message="Node is not ready"
I1025 16:06:37.631797       1 shared_informer.go:318] Caches are synced for resource quota
I1025 16:06:37.633750       1 event.go:307] "Event occurred" object="kube-system/kube-controller-manager-k8s-controller-01" fieldPath="" kind="Pod" apiVersion="v1" type="Warning" reason="NodeNotReady" message="Node is not ready"
I1025 16:06:37.646992       1 shared_informer.go:318] Caches are synced for attach detach
I1025 16:06:37.667078       1 event.go:307] "Event occurred" object="kube-system/kube-scheduler-k8s-controller-01" fieldPath="" kind="Pod" apiVersion="v1" type="Warning" reason="NodeNotReady" message="Node is not ready"
I1025 16:06:38.080171       1 shared_informer.go:318] Caches are synced for garbage collector
I1025 16:06:38.080232       1 garbagecollector.go:166] "All resource monitors have synced. Proceeding to collect garbage"
I1025 16:06:38.099046       1 shared_informer.go:318] Caches are synced for garbage collector
sre@k8s-controller-01:~$ 

