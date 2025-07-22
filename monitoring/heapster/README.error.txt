tim@Tims-MBP heapster % kubectl --namespace=kube-system top pods
Error from server (NotFound): the server could not find the requested resource (get services http:heapster:)

tim@Tims-MBP heapster % kubectl --namespace=kube-system get pods
NAME                                     READY   STATUS    RESTARTS       AGE
coredns-7db6d8ff4d-7kb9x                 1/1     Running   2 (150m ago)   4d22h
coredns-7db6d8ff4d-gkp5z                 1/1     Running   2 (150m ago)   4d22h
etcd-docker-desktop                      1/1     Running   2 (150m ago)   4d22h
kube-apiserver-docker-desktop            1/1     Running   2 (150m ago)   4d22h
kube-controller-manager-docker-desktop   1/1     Running   2 (150m ago)   4d22h
kube-proxy-v6mck                         1/1     Running   2 (150m ago)   4d22h
kube-scheduler-docker-desktop            1/1     Running   2 (150m ago)   4d22h
storage-provisioner                      1/1     Running   4 (149m ago)   4d22h
vpnkit-controller                        1/1     Running   2 (150m ago)   4d22h
tim@Tims-MBP heapster % kubectl --namespace=kube-system get services
NAME       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   4d22h
tim@Tims-MBP heapster % kubectl --namespace=kube-system get deployment
NAME      READY   UP-TO-DATE   AVAILABLE   AGE
coredns   2/2     2            2           4d22h
tim@Tims-MBP heapster % kubectl --namespace=kube-system get nodes     
NAME             STATUS   ROLES           AGE     VERSION
docker-desktop   Ready    control-plane   4d22h   v1.30.2


