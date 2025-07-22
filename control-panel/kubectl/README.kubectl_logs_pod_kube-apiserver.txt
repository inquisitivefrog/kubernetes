
sre@k8s-controller-01:~$ kubectl --namespace=kube-system logs kube-apiserver-k8s-controller-01 --container=kube-apiserver
I1025 16:06:02.224736       1 options.go:220] external host was not specified, using 192.168.1.105
I1025 16:06:02.237575       1 server.go:148] Version: v1.28.15
I1025 16:06:02.237647       1 server.go:150] "Golang settings" GOGC="" GOMAXPROCS="" GOTRACEBACK=""
I1025 16:06:03.201043       1 shared_informer.go:311] Waiting for caches to sync for node_authorizer
I1025 16:06:03.237813       1 plugins.go:158] Loaded 12 mutating admission controller(s) successfully in the following order: NamespaceLifecycle,LimitRanger,ServiceAccount,NodeRestriction,TaintNodesByCondition,Priority,DefaultTolerationSeconds,DefaultStorageClass,StorageObjectInUseProtection,RuntimeClass,DefaultIngressClass,MutatingAdmissionWebhook.
I1025 16:06:03.238497       1 plugins.go:161] Loaded 13 validating admission controller(s) successfully in the following order: LimitRanger,ServiceAccount,PodSecurity,Priority,PersistentVolumeClaimResize,RuntimeClass,CertificateApproval,CertificateSigning,ClusterTrustBundleAttest,CertificateSubjectRestriction,ValidatingAdmissionPolicy,ValidatingAdmissionWebhook,ResourceQuota.
I1025 16:06:03.239867       1 instance.go:298] Using reconciler: lease
I1025 16:06:03.489309       1 handler.go:275] Adding GroupVersion apiextensions.k8s.io v1 to ResourceManager
W1025 16:06:03.489475       1 genericapiserver.go:744] Skipping API apiextensions.k8s.io/v1beta1 because it has no resources.
I1025 16:06:03.940177       1 handler.go:275] Adding GroupVersion  v1 to ResourceManager
I1025 16:06:03.940830       1 instance.go:709] API group "internal.apiserver.k8s.io" is not enabled, skipping.
I1025 16:06:04.539508       1 instance.go:709] API group "resource.k8s.io" is not enabled, skipping.
I1025 16:06:04.595889       1 handler.go:275] Adding GroupVersion authentication.k8s.io v1 to ResourceManager
W1025 16:06:04.606059       1 genericapiserver.go:744] Skipping API authentication.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.606125       1 genericapiserver.go:744] Skipping API authentication.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.607024       1 handler.go:275] Adding GroupVersion authorization.k8s.io v1 to ResourceManager
W1025 16:06:04.607108       1 genericapiserver.go:744] Skipping API authorization.k8s.io/v1beta1 because it has no resources.
I1025 16:06:04.608131       1 handler.go:275] Adding GroupVersion autoscaling v2 to ResourceManager
I1025 16:06:04.608946       1 handler.go:275] Adding GroupVersion autoscaling v1 to ResourceManager
W1025 16:06:04.609026       1 genericapiserver.go:744] Skipping API autoscaling/v2beta1 because it has no resources.
W1025 16:06:04.609073       1 genericapiserver.go:744] Skipping API autoscaling/v2beta2 because it has no resources.
I1025 16:06:04.610631       1 handler.go:275] Adding GroupVersion batch v1 to ResourceManager
W1025 16:06:04.610724       1 genericapiserver.go:744] Skipping API batch/v1beta1 because it has no resources.
I1025 16:06:04.612555       1 handler.go:275] Adding GroupVersion certificates.k8s.io v1 to ResourceManager
W1025 16:06:04.612682       1 genericapiserver.go:744] Skipping API certificates.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.612773       1 genericapiserver.go:744] Skipping API certificates.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.613581       1 handler.go:275] Adding GroupVersion coordination.k8s.io v1 to ResourceManager
W1025 16:06:04.613671       1 genericapiserver.go:744] Skipping API coordination.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.613760       1 genericapiserver.go:744] Skipping API discovery.k8s.io/v1beta1 because it has no resources.
I1025 16:06:04.614323       1 handler.go:275] Adding GroupVersion discovery.k8s.io v1 to ResourceManager
I1025 16:06:04.615996       1 handler.go:275] Adding GroupVersion networking.k8s.io v1 to ResourceManager
W1025 16:06:04.616151       1 genericapiserver.go:744] Skipping API networking.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.616207       1 genericapiserver.go:744] Skipping API networking.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.616717       1 handler.go:275] Adding GroupVersion node.k8s.io v1 to ResourceManager
W1025 16:06:04.616780       1 genericapiserver.go:744] Skipping API node.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.616827       1 genericapiserver.go:744] Skipping API node.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.617578       1 handler.go:275] Adding GroupVersion policy v1 to ResourceManager
W1025 16:06:04.617637       1 genericapiserver.go:744] Skipping API policy/v1beta1 because it has no resources.
I1025 16:06:04.619330       1 handler.go:275] Adding GroupVersion rbac.authorization.k8s.io v1 to ResourceManager
W1025 16:06:04.619400       1 genericapiserver.go:744] Skipping API rbac.authorization.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.619449       1 genericapiserver.go:744] Skipping API rbac.authorization.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.619913       1 handler.go:275] Adding GroupVersion scheduling.k8s.io v1 to ResourceManager
W1025 16:06:04.619967       1 genericapiserver.go:744] Skipping API scheduling.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.620010       1 genericapiserver.go:744] Skipping API scheduling.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.630213       1 handler.go:275] Adding GroupVersion storage.k8s.io v1 to ResourceManager
W1025 16:06:04.630417       1 genericapiserver.go:744] Skipping API storage.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.630483       1 genericapiserver.go:744] Skipping API storage.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.632629       1 handler.go:275] Adding GroupVersion flowcontrol.apiserver.k8s.io v1beta3 to ResourceManager
I1025 16:06:04.635149       1 handler.go:275] Adding GroupVersion flowcontrol.apiserver.k8s.io v1beta2 to ResourceManager
W1025 16:06:04.635183       1 genericapiserver.go:744] Skipping API flowcontrol.apiserver.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.635194       1 genericapiserver.go:744] Skipping API flowcontrol.apiserver.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.646340       1 handler.go:275] Adding GroupVersion apps v1 to ResourceManager
W1025 16:06:04.646538       1 genericapiserver.go:744] Skipping API apps/v1beta2 because it has no resources.
W1025 16:06:04.646591       1 genericapiserver.go:744] Skipping API apps/v1beta1 because it has no resources.
I1025 16:06:04.648396       1 handler.go:275] Adding GroupVersion admissionregistration.k8s.io v1 to ResourceManager
W1025 16:06:04.648466       1 genericapiserver.go:744] Skipping API admissionregistration.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.648513       1 genericapiserver.go:744] Skipping API admissionregistration.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.649634       1 handler.go:275] Adding GroupVersion events.k8s.io v1 to ResourceManager
W1025 16:06:04.649690       1 genericapiserver.go:744] Skipping API events.k8s.io/v1beta1 because it has no resources.
I1025 16:06:04.699657       1 handler.go:275] Adding GroupVersion apiregistration.k8s.io v1 to ResourceManager
W1025 16:06:04.699763       1 genericapiserver.go:744] Skipping API apiregistration.k8s.io/v1beta1 because it has no resources.
I1025 16:06:05.727943       1 dynamic_cafile_content.go:157] "Starting controller" name="request-header::/etc/kubernetes/pki/front-proxy-ca.crt"
I1025 16:06:05.729162       1 secure_serving.go:213] Serving securely on [::]:6443
I1025 16:06:05.729525       1 dynamic_cafile_content.go:157] "Starting controller" name="client-ca-bundle::/etc/kubernetes/pki/ca.crt"
I1025 16:06:05.731651       1 dynamic_serving_content.go:132] "Starting controller" name="aggregator-proxy-cert::/etc/kubernetes/pki/front-proxy-client.crt::/etc/kubernetes/pki/front-proxy-client.key"
I1025 16:06:05.731813       1 available_controller.go:423] Starting AvailableConditionController
I1025 16:06:05.731930       1 cache.go:32] Waiting for caches to sync for AvailableConditionController controller
I1025 16:06:05.732069       1 customresource_discovery_controller.go:289] Starting DiscoveryController
I1025 16:06:05.732221       1 gc_controller.go:78] Starting apiserver lease garbage collector
I1025 16:06:05.732574       1 apf_controller.go:374] Starting API Priority and Fairness config controller
I1025 16:06:05.732595       1 controller.go:80] Starting OpenAPI V3 AggregationController
I1025 16:06:05.732612       1 aggregator.go:164] waiting for initial CRD sync...
I1025 16:06:05.734146       1 controller.go:116] Starting legacy_token_tracking_controller
I1025 16:06:05.734272       1 shared_informer.go:311] Waiting for caches to sync for configmaps
I1025 16:06:05.734341       1 handler_discovery.go:412] Starting ResourceDiscoveryManager
I1025 16:06:05.734542       1 controller.go:78] Starting OpenAPI AggregationController
I1025 16:06:05.735344       1 cluster_authentication_trust_controller.go:440] Starting cluster_authentication_trust_controller controller
I1025 16:06:05.735935       1 shared_informer.go:311] Waiting for caches to sync for cluster_authentication_trust_controller
I1025 16:06:05.736269       1 gc_controller.go:78] Starting apiserver lease garbage collector
I1025 16:06:05.736883       1 controller.go:134] Starting OpenAPI controller
I1025 16:06:05.737178       1 controller.go:85] Starting OpenAPI V3 controller
I1025 16:06:05.737265       1 naming_controller.go:291] Starting NamingConditionController
I1025 16:06:05.737335       1 establishing_controller.go:76] Starting EstablishingController
I1025 16:06:05.737418       1 nonstructuralschema_controller.go:192] Starting NonStructuralSchemaConditionController
I1025 16:06:05.737619       1 apiapproval_controller.go:186] Starting KubernetesAPIApprovalPolicyConformantConditionController
I1025 16:06:05.737771       1 crd_finalizer.go:266] Starting CRDFinalizer
I1025 16:06:05.738407       1 system_namespaces_controller.go:67] Starting system namespaces controller
I1025 16:06:05.738647       1 apiservice_controller.go:97] Starting APIServiceRegistrationController
I1025 16:06:05.738776       1 cache.go:32] Waiting for caches to sync for APIServiceRegistrationController controller
I1025 16:06:05.747355       1 crdregistration_controller.go:111] Starting crd-autoregister controller
I1025 16:06:05.747380       1 shared_informer.go:311] Waiting for caches to sync for crd-autoregister
I1025 16:06:05.734694       1 dynamic_serving_content.go:132] "Starting controller" name="serving-cert::/etc/kubernetes/pki/apiserver.crt::/etc/kubernetes/pki/apiserver.key"
I1025 16:06:05.747750       1 dynamic_cafile_content.go:157] "Starting controller" name="client-ca-bundle::/etc/kubernetes/pki/ca.crt"
I1025 16:06:05.747912       1 dynamic_cafile_content.go:157] "Starting controller" name="request-header::/etc/kubernetes/pki/front-proxy-ca.crt"
I1025 16:06:05.734707       1 tlsconfig.go:240] "Starting DynamicServingCertificateController"
I1025 16:06:05.898818       1 controller.go:624] quota admission added evaluator for: leases.coordination.k8s.io
I1025 16:06:05.908457       1 shared_informer.go:318] Caches are synced for node_authorizer
I1025 16:06:05.932713       1 apf_controller.go:379] Running API Priority and Fairness config worker
I1025 16:06:05.933015       1 apf_controller.go:382] Running API Priority and Fairness periodic rebalancing process
I1025 16:06:05.934075       1 cache.go:39] Caches are synced for AvailableConditionController controller
I1025 16:06:05.934983       1 shared_informer.go:318] Caches are synced for configmaps
I1025 16:06:05.938958       1 cache.go:39] Caches are synced for APIServiceRegistrationController controller
I1025 16:06:05.945551       1 shared_informer.go:318] Caches are synced for cluster_authentication_trust_controller
I1025 16:06:05.951818       1 shared_informer.go:318] Caches are synced for crd-autoregister
I1025 16:06:05.952359       1 aggregator.go:166] initial CRD sync complete...
I1025 16:06:05.952516       1 autoregister_controller.go:141] Starting autoregister controller
I1025 16:06:05.952599       1 cache.go:32] Waiting for caches to sync for autoregister controller
I1025 16:06:05.952668       1 cache.go:39] Caches are synced for autoregister controller
E1025 16:06:06.013803       1 controller.go:97] Error removing old endpoints from kubernetes service: no API server IP addresses were listed in storage, refusing to erase all endpoints for the kubernetes Service
I1025 16:06:06.741535       1 storage_scheduling.go:111] all system priority classes are created successfully or already exist.
sre@k8s-controller-01:~$ 

