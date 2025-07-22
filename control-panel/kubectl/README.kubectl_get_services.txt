
sre@k8s-controller-01:~$ kubectl get services --all-namespaces=true 
NAMESPACE              NAME                                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                  AGE
default                kubernetes                             ClusterIP   10.96.0.1        <none>        443/TCP                  6d23h
kube-system            kube-dns                               ClusterIP   10.96.0.10       <none>        53/UDP,53/TCP,9153/TCP   6d23h
kubernetes-dashboard   kubernetes-dashboard-api               ClusterIP   10.96.174.229    <none>        8000/TCP                 49m
kubernetes-dashboard   kubernetes-dashboard-auth              ClusterIP   10.103.113.203   <none>        8000/TCP                 49m
kubernetes-dashboard   kubernetes-dashboard-kong-proxy        ClusterIP   10.104.172.236   <none>        443/TCP                  49m
kubernetes-dashboard   kubernetes-dashboard-metrics-scraper   ClusterIP   10.104.99.115    <none>        8000/TCP                 49m
kubernetes-dashboard   kubernetes-dashboard-web               ClusterIP   10.96.24.232     <none>        8000/TCP                 49m

sre@k8s-controller-01:~$ kubectl get services --all-namespaces=true -o wide
NAMESPACE              NAME                                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                  AGE     SELECTOR
default                kubernetes                             ClusterIP   10.96.0.1        <none>        443/TCP                  6d23h   <none>
kube-system            kube-dns                               ClusterIP   10.96.0.10       <none>        53/UDP,53/TCP,9153/TCP   6d23h   k8s-app=kube-dns
kubernetes-dashboard   kubernetes-dashboard-api               ClusterIP   10.96.174.229    <none>        8000/TCP                 94m     app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kubernetes-dashboard-api,app.kubernetes.io/part-of=kubernetes-dashboard
kubernetes-dashboard   kubernetes-dashboard-auth              ClusterIP   10.103.113.203   <none>        8000/TCP                 94m     app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kubernetes-dashboard-auth,app.kubernetes.io/part-of=kubernetes-dashboard
kubernetes-dashboard   kubernetes-dashboard-kong-proxy        ClusterIP   10.104.172.236   <none>        443/TCP                  94m     app.kubernetes.io/component=app,app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kong
kubernetes-dashboard   kubernetes-dashboard-metrics-scraper   ClusterIP   10.104.99.115    <none>        8000/TCP                 94m     app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kubernetes-dashboard-metrics-scraper,app.kubernetes.io/part-of=kubernetes-dashboard
kubernetes-dashboard   kubernetes-dashboard-web               ClusterIP   10.96.24.232     <none>        8000/TCP                 94m     app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kubernetes-dashboard-web,app.kubernetes.io/part-of=kubernetes-dashboard


