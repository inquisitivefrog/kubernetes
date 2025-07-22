
sre@k8s-controller-01:~/contour$ curl https://raw.githubusercontent.com/projectcontour/contour/release-1.30/examples/render/contour.yaml -o contour.yaml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  541k  100  541k    0     0  3316k      0 --:--:-- --:--:-- --:--:-- 3340k
sre@k8s-controller-01:~/contour$ ls
contour.yaml  README.contour.txt
sre@k8s-controller-01:~/contour$ ls -l contour.yaml 
-rw-rw-r-- 1 sre sre 554116 Nov 25 18:54 contour.yaml


sre@k8s-controller-01:~/contour$ kubectl apply -f https://j.hept.io/contour-deployment-rbac
namespace/projectcontour created
serviceaccount/contour created
serviceaccount/envoy created
configmap/contour created
customresourcedefinition.apiextensions.k8s.io/contourconfigurations.projectcontour.io created
customresourcedefinition.apiextensions.k8s.io/contourdeployments.projectcontour.io created
customresourcedefinition.apiextensions.k8s.io/extensionservices.projectcontour.io created
customresourcedefinition.apiextensions.k8s.io/httpproxies.projectcontour.io created
customresourcedefinition.apiextensions.k8s.io/tlscertificatedelegations.projectcontour.io created
serviceaccount/contour-certgen created
rolebinding.rbac.authorization.k8s.io/contour created
role.rbac.authorization.k8s.io/contour-certgen created
job.batch/contour-certgen-v1-30-1 created
clusterrolebinding.rbac.authorization.k8s.io/contour created
rolebinding.rbac.authorization.k8s.io/contour-rolebinding created
clusterrole.rbac.authorization.k8s.io/contour created
role.rbac.authorization.k8s.io/contour created
service/contour created
service/envoy created
deployment.apps/contour created
daemonset.apps/envoy created

sre@k8s-controller-01:~/contour$ kubectl get namespaces projectcontour -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get clusterrole contour -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get clusterrolebinding contour -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get configmap contour -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get customresourcedefinition contourconfigurations.projectcontour.io -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get customresourcedefinition contourdeployments.projectcontour.io -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get customresourcedefinition extensionservices.projectcontour.io -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get customresourcedefinition httpproxies.projectcontour.io -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get customresourcedefinition tlscertificatedelegations.projectcontour.io -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get daemonsets.apps envoy -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get deployment.apps contour -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get jobs.batch contour-certgen-v1-30-1 -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get role contour -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get role contour-certgen -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get rolebinding contour -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get rolebinding contour-rolebinding -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get serviceaccount envoy -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get serviceaccount contour-certgen -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get serviceaccount contour -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get service envoy -o yaml
sre@k8s-controller-01:~/contour$ kubectl --namespace=projectcontour get service contour -o yaml
