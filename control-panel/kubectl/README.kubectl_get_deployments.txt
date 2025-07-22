
sre@k8s-controller-01:~$ kubectl get deployments --all-namespaces=true
NAMESPACE              NAME                                   READY   UP-TO-DATE   AVAILABLE   AGE
kube-system            coredns                                2/2     2            2           6d23h
kubernetes-dashboard   kubernetes-dashboard-api               1/1     1            1           74m
kubernetes-dashboard   kubernetes-dashboard-auth              1/1     1            1           74m
kubernetes-dashboard   kubernetes-dashboard-kong              1/1     1            1           74m
kubernetes-dashboard   kubernetes-dashboard-metrics-scraper   1/1     1            1           74m
kubernetes-dashboard   kubernetes-dashboard-web               1/1     1            1           74m

sre@k8s-controller-01:~$ kubectl get deployments --all-namespaces=true -o wide
NAMESPACE              NAME                                   READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS                             IMAGES                                                   SELECTOR
kube-system            coredns                                2/2     2            2           6d23h   coredns                                registry.k8s.io/coredns/coredns:v1.10.1                  k8s-app=kube-dns
kubernetes-dashboard   kubernetes-dashboard-api               1/1     1            1           75m     kubernetes-dashboard-api               docker.io/kubernetesui/dashboard-api:1.10.1              app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kubernetes-dashboard-api,app.kubernetes.io/part-of=kubernetes-dashboard
kubernetes-dashboard   kubernetes-dashboard-auth              1/1     1            1           75m     kubernetes-dashboard-auth              docker.io/kubernetesui/dashboard-auth:1.2.2              app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kubernetes-dashboard-auth,app.kubernetes.io/part-of=kubernetes-dashboard
kubernetes-dashboard   kubernetes-dashboard-kong              1/1     1            1           75m     proxy                                  kong:3.6                                                 app.kubernetes.io/component=app,app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kong
kubernetes-dashboard   kubernetes-dashboard-metrics-scraper   1/1     1            1           75m     kubernetes-dashboard-metrics-scraper   docker.io/kubernetesui/dashboard-metrics-scraper:1.2.1   app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kubernetes-dashboard-metrics-scraper,app.kubernetes.io/part-of=kubernetes-dashboard
kubernetes-dashboard   kubernetes-dashboard-web               1/1     1            1           75m     kubernetes-dashboard-web               docker.io/kubernetesui/dashboard-web:1.6.0               app.kubernetes.io/instance=kubernetes-dashboard,app.kubernetes.io/name=kubernetes-dashboard-web,app.kubernetes.io/part-of=kubernetes-dashboard

