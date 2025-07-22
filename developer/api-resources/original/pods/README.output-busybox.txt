
tim@Tims-MBP pods % kubectl run busybox --image=busybox --restart=Never -- /bin/sh -c "sleep 3600;echo boo"
pod/busybox created
tim@Tims-MBP pods % kubectl get pods
NAME      READY   STATUS    RESTARTS   AGE
busybox   1/1     Running   0          5s
nginx     2/2     Running   0          33m

tim@Tims-MBP pods % kubectl describe pod busybox
Name:             busybox
Namespace:        default
Priority:         0
Service Account:  default
Node:             docker-desktop/192.168.65.3
Start Time:       Thu, 31 Oct 2024 15:21:11 -0700
Labels:           run=busybox
Annotations:      <none>
Status:           Running
IP:               10.1.0.8
IPs:
  IP:  10.1.0.8
Containers:
  busybox:
    Container ID:  docker://f7142a66b4a5f96c5523b36a3e476455d0e0ed20ff9f7509a67cf36cd21abc2f
    Image:         busybox
    Image ID:      docker-pullable://busybox@sha256:768e5c6f5cb6db0794eec98dc7a967f40631746c32232b78a3105fb946f3ab83
    Port:          <none>
    Host Port:     <none>
    Args:
      /bin/sh
      -c
      sleep 3600;echo boo
    State:          Running
      Started:      Thu, 31 Oct 2024 15:21:13 -0700
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-w4g6m (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-w4g6m:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  15s   default-scheduler  Successfully assigned default/busybox to docker-desktop
  Normal  Pulling    14s   kubelet            Pulling image "busybox"
  Normal  Pulled     13s   kubelet            Successfully pulled image "busybox" in 833ms (833ms including waiting). Image size: 2166802 bytes.
  Normal  Created    13s   kubelet            Created container busybox
  Normal  Started    13s   kubelet            Started container busybox

tim@Tims-MBP pods % kubectl get pods
NAME    READY   STATUS    RESTARTS   AGE
nginx   2/2     Running   0          39m

-----------------------------------------
tim@Tims-MBP pods % cat pod-busybox.yml 
apiVersion: v1
kind: Pod
metadata:
  name: busybox
spec:
  containers:
    - name: busybox
      image: busybox:latest
      command: ["/bin/sh", "-c", "sleep 3600"]

tim@Tims-MBP pods % kubectl apply -f pod-busybox.yml
pod/busybox created

tim@Tims-MBP pods % kubectl --container=busybox logs busybox
tim@Tims-MBP pods % 

tim@Tims-MBP pods % kubectl get pods
NAME      READY   STATUS    RESTARTS   AGE
busybox   1/1     Running   0          3m23s
nginx     2/2     Running   0          43m
tim@Tims-MBP pods % kubectl delete pod busybox
pod "busybox" deleted
tim@Tims-MBP pods % kubectl delete pod nginx
pod "nginx" deleted
tim@Tims-MBP pods % kubectl get pods          
No resources found in default namespace.

