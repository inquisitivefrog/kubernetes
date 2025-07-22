
sre@k8s-controller-01:~$ kubectl get endpoints --all-namespaces=true 
NAMESPACE              NAME                                   ENDPOINTS                                                  AGE
default                kubernetes                             192.168.1.105:6443                                         6d23h
kube-system            kube-dns                               10.244.0.14:53,10.244.0.15:53,10.244.0.14:53 + 3 more...   6d23h
kubernetes-dashboard   kubernetes-dashboard-api               10.244.1.40:8000                                           50m
kubernetes-dashboard   kubernetes-dashboard-auth              10.244.1.39:8000                                           50m
kubernetes-dashboard   kubernetes-dashboard-kong-proxy        10.244.1.42:8443                                           50m
kubernetes-dashboard   kubernetes-dashboard-metrics-scraper   10.244.1.41:8000                                           50m
kubernetes-dashboard   kubernetes-dashboard-web               10.244.1.38:8000                                           50m

