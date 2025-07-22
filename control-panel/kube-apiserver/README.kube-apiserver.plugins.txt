
sre@k8s-controller-01:~$ kubectl get pods --all-namespaces=true -o wide
NAMESPACE     NAME                                        READY   STATUS    RESTARTS       AGE   IP              NODE                NOMINATED NODE   READINESS GATES
kube-system   coredns-5dd5756b68-2zrhr                    0/1     Pending   0              20h   <none>          <none>              <none>           <none>
kube-system   coredns-5dd5756b68-wcs5x                    0/1     Pending   0              20h   <none>          <none>              <none>           <none>
kube-system   etcd-k8s-controller-01                      1/1     Running   1 (120m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-apiserver-k8s-controller-01            1/1     Running   1 (120m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-controller-manager-k8s-controller-01   1/1     Running   1 (120m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-proxy-p4jmn                            1/1     Running   1 (120m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-scheduler-k8s-controller-01            1/1     Running   1 (120m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>

sre@k8s-controller-01:~$ kubectl --namespace=kube-system logs kube-apiserver-k8s-controller-01 --container=kube-apiserver
I1025 16:06:02.224736       1 options.go:220] external host was not specified, using 192.168.1.105
I1025 16:06:02.237575       1 server.go:148] Version: v1.28.15
I1025 16:06:02.237647       1 server.go:150] "Golang settings" GOGC="" GOMAXPROCS="" GOTRACEBACK=""
I1025 16:06:03.201043       1 shared_informer.go:311] Waiting for caches to sync for node_authorizer
I1025 16:06:03.237813       1 plugins.go:158] Loaded 12 mutating admission controller(s) successfully in the following order: NamespaceLifecycle,LimitRanger,ServiceAccount,NodeRestriction,TaintNodesByCondition,Priority,DefaultTolerationSeconds,DefaultStorageClass,StorageObjectInUseProtection,RuntimeClass,DefaultIngressClass,MutatingAdmissionWebhook.
I1025 16:06:03.238497       1 plugins.go:161] Loaded 13 validating admission controller(s) successfully in the following order: LimitRanger,ServiceAccount,PodSecurity,Priority,PersistentVolumeClaimResize,RuntimeClass,CertificateApproval,CertificateSigning,ClusterTrustBundleAttest,CertificateSubjectRestriction,ValidatingAdmissionPolicy,ValidatingAdmissionWebhook,ResourceQuota.

Plug-Ins
--------
01. LimitRanger
02. ServiceAccount
03. PodSecurity
04. Priority
05. PersistentVolumeClaimResize
06. RuntimeClass
07. CertificateApproval
08. CertificateSigning
09. ClusterTrustBundleAttest
10. CertificateSubjectRestriction
11. ValidatingAdmissionPolicy
12. ValidatingAdmissionWebhook
13. ResourceQuota
