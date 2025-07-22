
WINDOW A
--------
sre@k8s-controller-01:~$ kubectl proxy
Starting to serve on 127.0.0.1:8001

WINDOW B
--------
sre@k8s-controller-01:~$ curl -X GET -s http://127.0.0.1:8001/api/v1/configmaps/ | jq .kind
"ConfigMapList"

sre@k8s-controller-01:~$ curl -X GET -s http://127.0.0.1:8001/api/v1/configmaps/ | jq '.items.[].metadata.name'
"kube-root-ca.crt"
"nginx-config"
"nginx-html"
"postgres-secrets"
"kube-root-ca.crt"
"kube-flannel-cfg"
"kube-root-ca.crt"
"kube-root-ca.crt"
"cluster-info"
"kube-root-ca.crt"
"coredns"
"extension-apiserver-authentication"
"kube-apiserver-legacy-service-account-token-tracking"
"kube-proxy"
"kube-root-ca.crt"
"kubeadm-config"
"kubelet-config"
"weave-net"
"kong-dbless-config"
"kube-root-ca.crt"
"kubernetes-dashboard-web-settings"
"contour"
"kube-root-ca.crt"
"kube-root-ca.crt"
"postgres-secrets"
"kube-root-ca.crt"
"postgres-secrets"


