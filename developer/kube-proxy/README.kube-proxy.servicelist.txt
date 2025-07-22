
WINDOW A
--------
sre@k8s-controller-01:~$ curl -X GET -s http://127.0.0.1:8001/api/v1/services/ | jq '.kind'
"ServiceList"

WINDOW B
--------
sre@k8s-controller-01:~$ curl -X GET -s http://127.0.0.1:8001/api/v1/services/ | jq '.items.[].metadata.name'
"kubernetes"
"kube-dns"
"metrics-server"
"kubernetes-dashboard-api"
"kubernetes-dashboard-auth"
"kubernetes-dashboard-kong-proxy"
"kubernetes-dashboard-metrics-scraper"
"kubernetes-dashboard-web"
"contour"
"envoy"

