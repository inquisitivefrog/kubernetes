
sre@k8s-controller-01:~$ kubectl --namespace=kubernetes-dashboard get deployments
NAME                                   READY   UP-TO-DATE   AVAILABLE   AGE
kubernetes-dashboard-api               1/1     1            1           28d
kubernetes-dashboard-auth              1/1     1            1           28d
kubernetes-dashboard-kong              1/1     1            1           28d
kubernetes-dashboard-metrics-scraper   1/1     1            1           28d
kubernetes-dashboard-web               1/1     1            1           28d

sre@k8s-controller-01:~$ kubectl --namespace=kubernetes-dashboard get pods
NAME                                                    READY   STATUS    RESTARTS   AGE
kubernetes-dashboard-api-8c6bf4788-gbhbp                1/1     Running   0          119m
kubernetes-dashboard-auth-cd58bb9b9-6n8fv               1/1     Running   0          119m
kubernetes-dashboard-kong-76dff7b666-sf4fj              1/1     Running   0          119m
kubernetes-dashboard-metrics-scraper-5f645f778c-8ddkm   1/1     Running   0          119m
kubernetes-dashboard-web-5bf7668478-hmhhf               1/1     Running   0          119m

sre@k8s-controller-01:~$ kubectl rollout restart deployment kubernetes-dashboard-api  --namespace=kubernetes-dashboard
deployment.apps/kubernetes-dashboard-api restarted
sre@k8s-controller-01:~$ kubectl --namespace=kubernetes-dashboard get pods
NAME                                                    READY   STATUS        RESTARTS   AGE
kubernetes-dashboard-api-77f6cc999b-xkb2c               1/1     Running       0          16s
kubernetes-dashboard-api-8c6bf4788-gbhbp                1/1     Terminating   0          120m
kubernetes-dashboard-auth-cd58bb9b9-6n8fv               1/1     Running       0          120m
kubernetes-dashboard-kong-76dff7b666-sf4fj              1/1     Running       0          120m
kubernetes-dashboard-metrics-scraper-5f645f778c-8ddkm   1/1     Running       0          120m
kubernetes-dashboard-web-5bf7668478-hmhhf               1/1     Running       0          120m

sre@k8s-controller-01:~$ kubectl --namespace=kubernetes-dashboard logs kubernetes-dashboard-api-8c6bf4788-gbhbp
I1212 22:17:36.995549       1 main.go:40] "Starting Kubernetes Dashboard API" version="1.10.1"
I1212 22:17:37.003201       1 init.go:48] Using in-cluster config
I1212 22:17:37.154718       1 main.go:118] "Successful initial request to the apiserver" version="v1.28.15"
I1212 22:17:37.156278       1 client.go:265] Creating in-cluster Sidecar client
I1212 22:17:37.254895       1 main.go:95] "Listening and serving on" address="0.0.0.0:8000"
E1212 22:17:37.262288       1 manager.go:96] Metric client health check failed: the server is currently unable to handle the request (get services kubernetes-dashboard-metrics-scraper). Retrying in 30 seconds.
I1212 22:18:07.280681       1 manager.go:101] Successful request to sidecar

sre@k8s-controller-01:~$ kubectl --namespace=kubernetes-dashboard logs kubernetes-dashboard-api-8c6bf4788-gbhbp
I1212 22:17:36.995549       1 main.go:40] "Starting Kubernetes Dashboard API" version="1.10.1"
I1212 22:17:37.003201       1 init.go:48] Using in-cluster config
I1212 22:17:37.154718       1 main.go:118] "Successful initial request to the apiserver" version="v1.28.15"
I1212 22:17:37.156278       1 client.go:265] Creating in-cluster Sidecar client
I1212 22:17:37.254895       1 main.go:95] "Listening and serving on" address="0.0.0.0:8000"
E1212 22:17:37.262288       1 manager.go:96] Metric client health check failed: the server is currently unable to handle the request (get services kubernetes-dashboard-metrics-scraper). Retrying in 30 seconds.
I1212 22:18:07.280681       1 manager.go:101] Successful request to sidecar
E1213 00:13:55.915083       1 manager.go:96] Metric client health check failed: the server has asked for the client to provide credentials (get services kubernetes-dashboard-metrics-scraper). Retrying in 30 seconds.
E1213 00:14:25.920456       1 manager.go:96] Metric client health check failed: the server has asked for the client to provide credentials (get services kubernetes-dashboard-metrics-scraper). Retrying in 30 seconds.
E1213 00:14:55.925982       1 manager.go:96] Metric client health check failed: the server has asked for the client to provide credentials (get services kubernetes-dashboard-metrics-scraper). Retrying in 30 seconds.
E1213 00:15:25.938189       1 manager.go:96] Metric client health check failed: the server has asked for the client to provide credentials (get services kubernetes-dashboard-metrics-scraper). Retrying in 30 seconds.
E1213 00:15:55.947010       1 manager.go:96] Metric client health check failed: the server has asked for the client to provide credentials (get services kubernetes-dashboard-metrics-scraper). Retrying in 30 seconds.

sre@k8s-controller-01:~$ kubectl --namespace=kubernetes-dashboard get services kubernetes-dashboard-metrics-scraper
NAME                                   TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
kubernetes-dashboard-metrics-scraper   ClusterIP   10.104.99.115   <none>        8000/TCP   28d
sre@k8s-controller-01:~$ kubectl --namespace=kubernetes-dashboard get services kubernetes-dashboard-metrics-scraper -o yaml
apiVersion: v1
kind: Service
metadata:
  annotations:
    meta.helm.sh/release-name: kubernetes-dashboard
    meta.helm.sh/release-namespace: kubernetes-dashboard
  creationTimestamp: "2024-11-14T19:24:35Z"
  labels:
    app.kubernetes.io/component: metrics-scraper
    app.kubernetes.io/instance: kubernetes-dashboard
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: kubernetes-dashboard-metrics-scraper
    app.kubernetes.io/part-of: kubernetes-dashboard
    app.kubernetes.io/version: 1.2.1
    helm.sh/chart: kubernetes-dashboard-7.10.0
  name: kubernetes-dashboard-metrics-scraper
  namespace: kubernetes-dashboard
  resourceVersion: "64614"
  uid: 0ed1eb7c-e61a-4795-873b-cc3eb66d157c
spec:
  clusterIP: 10.104.99.115
  clusterIPs:
  - 10.104.99.115
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - port: 8000
    protocol: TCP
    targetPort: 8000
  selector:
    app.kubernetes.io/instance: kubernetes-dashboard
    app.kubernetes.io/name: kubernetes-dashboard-metrics-scraper
    app.kubernetes.io/part-of: kubernetes-dashboard
  sessionAffinity: None
  type: ClusterIP
status:
  loadBalancer: {}

sre@k8s-controller-01:~$ kubectl get --raw "/api/v1/namespaces/kubernetes-dashboard/services/kubernetes-dashboard-metrics-scraper/proxy/healthz"
URL: /healthz


