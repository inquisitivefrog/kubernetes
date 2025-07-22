
sre@k8s-controller-01:~$ kubectl get svc -A
NAMESPACE              NAME                                      TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
argocd                 argocd-applicationset-controller          ClusterIP      10.109.179.255   <none>        7000/TCP,8080/TCP            103m
argocd                 argocd-dex-server                         ClusterIP      10.108.9.103     <none>        5556/TCP,5557/TCP,5558/TCP   103m
argocd                 argocd-metrics                            ClusterIP      10.99.79.180     <none>        8082/TCP                     103m
argocd                 argocd-notifications-controller-metrics   ClusterIP      10.111.195.128   <none>        9001/TCP                     103m
argocd                 argocd-redis-ha                           ClusterIP      None             <none>        6379/TCP,26379/TCP           103m
argocd                 argocd-redis-ha-announce-0                ClusterIP      10.108.124.103   <none>        6379/TCP,26379/TCP           103m
argocd                 argocd-redis-ha-announce-1                ClusterIP      10.96.117.38     <none>        6379/TCP,26379/TCP           103m
argocd                 argocd-redis-ha-announce-2                ClusterIP      10.96.7.189      <none>        6379/TCP,26379/TCP           103m
argocd                 argocd-redis-ha-haproxy                   ClusterIP      10.105.217.38    <none>        6379/TCP,9101/TCP            103m
argocd                 argocd-repo-server                        ClusterIP      10.110.9.160     <none>        8081/TCP,8084/TCP            103m
argocd                 argocd-server                             ClusterIP      10.97.48.201     <none>        80/TCP,443/TCP               103m
argocd                 argocd-server-metrics                     ClusterIP      10.110.197.159   <none>        8083/TCP                     103m
default                kubernetes                                ClusterIP      10.96.0.1        <none>        443/TCP                      35d
kube-system            kube-dns                                  ClusterIP      10.96.0.10       <none>        53/UDP,53/TCP,9153/TCP       35d
kube-system            metrics-server                            ClusterIP      10.99.153.158    <none>        443/TCP                      27d
kubernetes-dashboard   kubernetes-dashboard-api                  ClusterIP      10.96.174.229    <none>        8000/TCP                     28d
kubernetes-dashboard   kubernetes-dashboard-auth                 ClusterIP      10.103.113.203   <none>        8000/TCP                     28d
kubernetes-dashboard   kubernetes-dashboard-kong-proxy           ClusterIP      10.104.172.236   <none>        443/TCP                      28d
kubernetes-dashboard   kubernetes-dashboard-metrics-scraper      ClusterIP      10.104.99.115    <none>        8000/TCP                     28d
kubernetes-dashboard   kubernetes-dashboard-web                  ClusterIP      10.96.24.232     <none>        8000/TCP                     28d
projectcontour         contour                                   ClusterIP      10.101.152.194   <none>        8001/TCP                     17d
projectcontour         envoy                                     LoadBalancer   10.98.92.188     <pending>     80:32033/TCP,443:30369/TCP   17d
sre@k8s-controller-01:~$ 

sre@k8s-controller-01:~$ kubectl --all-namespaces=true get services -o wide
NAMESPACE              NAME                                      TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE    SELECTOR
argocd                 argocd-applicationset-controller          ClusterIP      10.109.179.255   <none>        7000/TCP,8080/TCP            104m   app.kubernetes.io/name=argocd-applicationset-controller
argocd                 argocd-dex-server                         ClusterIP      10.108.9.103     <none>        5556/TCP,5557/TCP,5558/TCP   104m   app.kubernetes.io/name=argocd-dex-server
argocd                 argocd-metrics                            ClusterIP      10.99.79.180     <none>        8082/TCP                     104m   app.kubernetes.io/name=argocd-application-controller
argocd                 argocd-notifications-controller-metrics   ClusterIP      10.111.195.128   <none>        9001/TCP                     104m   app.kubernetes.io/name=argocd-notifications-controller
argocd                 argocd-redis-ha                           ClusterIP      None             <none>        6379/TCP,26379/TCP           104m   app.kubernetes.io/name=argocd-redis-ha
argocd                 argocd-redis-ha-announce-0                ClusterIP      10.108.124.103   <none>        6379/TCP,26379/TCP           104m   app.kubernetes.io/name=argocd-redis-ha,statefulset.kubernetes.io/pod-name=argocd-redis-ha-server-0
argocd                 argocd-redis-ha-announce-1                ClusterIP      10.96.117.38     <none>        6379/TCP,26379/TCP           104m   app.kubernetes.io/name=argocd-redis-ha,statefulset.kubernetes.io/pod-name=argocd-redis-ha-server-1
argocd                 argocd-redis-ha-announce-2                ClusterIP      10.96.7.189      <none>        6379/TCP,26379/TCP           104m   app.kubernetes.io/name=argocd-redis-ha,statefulset.kubernetes.io/pod-name=argocd-redis-ha-server-2
argocd                 argocd-redis-ha-haproxy                   ClusterIP      10.105.217.38    <none>        6379/TCP,9101/TCP            104m   app.kubernetes.io/name=argocd-redis-ha-haproxy
argocd                 argocd-repo-server                        ClusterIP      10.110.9.160     <none>        8081/TCP,8084/TCP            104m   app.kubernetes.io/name=argocd-repo-server
argocd                 argocd-server                             ClusterIP      10.97.48.201     <none>        80/TCP,443/TCP               104m   app.kubernetes.io/name=argocd-server
argocd                 argocd-server-metrics                     ClusterIP      10.110.197.159   <none>        8083/TCP                     104m   app.kubernetes.io/name=argocd-server
default                kubernetes                                ClusterIP      10.96.0.1        <none>        443/TCP                      35d    <none>
kube-system            kube-dns                                  ClusterIP      10.96.0.10       <none>        53/UDP,53/TCP,9153/TCP       35d    k8s-app=kube-dns
kube-system            metrics-server                            ClusterIP      10.99.153.158    <none>        443/TCP                      27d    k8s-app=metrics-server
kubernetes-dashboard   kubernetes-dashboard-api                  ClusterIP      10.96.174.229    <none>        8000/TCP                     28d    app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kubernetes-dashboard-api,app.kubernetes.io/part-of=kubernetes-dashboard
kubernetes-dashboard   kubernetes-dashboard-auth                 ClusterIP      10.103.113.203   <none>        8000/TCP                     28d    app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kubernetes-dashboard-auth,app.kubernetes.io/part-of=kubernetes-dashboard
kubernetes-dashboard   kubernetes-dashboard-kong-proxy           ClusterIP      10.104.172.236   <none>        443/TCP                      28d    app.kubernetes.io/component=app,app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kong
kubernetes-dashboard   kubernetes-dashboard-metrics-scraper      ClusterIP      10.104.99.115    <none>        8000/TCP                     28d    app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kubernetes-dashboard-metrics-scraper,app.kubernetes.io/part-of=kubernetes-dashboard
kubernetes-dashboard   kubernetes-dashboard-web                  ClusterIP      10.96.24.232     <none>        8000/TCP                     28d    app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kubernetes-dashboard-web,app.kubernetes.io/part-of=kubernetes-dashboard
projectcontour         contour                                   ClusterIP      10.101.152.194   <none>        8001/TCP                     17d    app=contour
projectcontour         envoy                                     LoadBalancer   10.98.92.188     <pending>     80:32033/TCP,443:30369/TCP   17d    app=envoy
sre@k8s-controller-01:~$ 

