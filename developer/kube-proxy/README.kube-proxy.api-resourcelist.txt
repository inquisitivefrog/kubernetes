
WINDOW A
--------
sre@k8s-controller-01:~$ kubectl proxy
Starting to serve on 127.0.0.1:8001

WINDOW B
--------
sre@k8s-controller-01:~$ curl -X GET -s http://127.0.0.1:8001/api/v1/ | jq '.kind'
"APIResourceList"

sre@k8s-controller-01:~$ curl -X GET -s http://127.0.0.1:8001/api/v1/ | jq '.resources.[].name'
"bindings"
"componentstatuses"
"configmaps"
"endpoints"
"events"
"limitranges"
"namespaces"
"namespaces/finalize"
"namespaces/status"
"nodes"
"nodes/proxy"
"nodes/status"
"persistentvolumeclaims"
"persistentvolumeclaims/status"
"persistentvolumes"
"persistentvolumes/status"
"pods"
"pods/attach"
"pods/binding"
"pods/ephemeralcontainers"
"pods/eviction"
"pods/exec"
"pods/log"
"pods/portforward"
"pods/proxy"
"pods/status"
"podtemplates"
"replicationcontrollers"
"replicationcontrollers/scale"
"replicationcontrollers/status"
"resourcequotas"
"resourcequotas/status"
"secrets"
"serviceaccounts"
"serviceaccounts/token"
"services"
"services/proxy"
"services/status"
sre@k8s-controller-01:~$ 

