
sre@k8s-controller-01:~$ kubectl get pods --all-namespaces=true -o wide
NAMESPACE     NAME                                        READY   STATUS    RESTARTS       AGE   IP              NODE                NOMINATED NODE   READINESS GATES
kube-system   coredns-5dd5756b68-2zrhr                    0/1     Pending   0              20h   <none>          <none>              <none>           <none>
kube-system   coredns-5dd5756b68-wcs5x                    0/1     Pending   0              20h   <none>          <none>              <none>           <none>
kube-system   etcd-k8s-controller-01                      1/1     Running   1 (131m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-apiserver-k8s-controller-01            1/1     Running   1 (131m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-controller-manager-k8s-controller-01   1/1     Running   1 (131m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-proxy-p4jmn                            1/1     Running   1 (131m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system   kube-scheduler-k8s-controller-01            1/1     Running   1 (131m ago)   20h   192.168.1.105   k8s-controller-01   <none>           <none>

sre@k8s-controller-01:~$ kubectl --namespace=kube-system logs kube-scheduler-k8s-controller-01 --container=kube-scheduler
I1025 16:06:03.130932       1 serving.go:348] Generated self-signed cert in-memory
W1025 16:06:05.851355       1 requestheader_controller.go:193] Unable to get configmap/extension-apiserver-authentication in kube-system.  Usually fixed by 'kubectl create rolebinding -n kube-system ROLEBINDING_NAME --role=extension-apiserver-authentication-reader --serviceaccount=YOUR_NS:YOUR_SA'
W1025 16:06:05.851591       1 authentication.go:368] Error looking up in-cluster authentication configuration: configmaps "extension-apiserver-authentication" is forbidden: User "system:kube-scheduler" cannot get resource "configmaps" in API group "" in the namespace "kube-system"
W1025 16:06:05.851661       1 authentication.go:369] Continuing without authentication configuration. This may treat all requests as anonymous.
W1025 16:06:05.851708       1 authentication.go:370] To require authentication configuration lookup to succeed, set --authentication-tolerate-lookup-failure=false
I1025 16:06:05.893712       1 server.go:154] "Starting Kubernetes Scheduler" version="v1.28.15"
I1025 16:06:05.893774       1 server.go:156] "Golang settings" GOGC="" GOMAXPROCS="" GOTRACEBACK=""
I1025 16:06:05.895322       1 secure_serving.go:213] Serving securely on 127.0.0.1:10259
I1025 16:06:05.895454       1 configmap_cafile_content.go:202] "Starting controller" name="client-ca::kube-system::extension-apiserver-authentication::client-ca-file"
I1025 16:06:05.895507       1 shared_informer.go:311] Waiting for caches to sync for client-ca::kube-system::extension-apiserver-authentication::client-ca-file
I1025 16:06:05.895526       1 tlsconfig.go:240] "Starting DynamicServingCertificateController"
I1025 16:06:06.000230       1 shared_informer.go:318] Caches are synced for client-ca::kube-system::extension-apiserver-authentication::client-ca-file
I1025 16:06:06.004601       1 leaderelection.go:250] attempting to acquire leader lease kube-system/kube-scheduler...
I1025 16:06:21.772270       1 leaderelection.go:260] successfully acquired lease kube-system/kube-scheduler
sre@k8s-controller-01:~$ 

