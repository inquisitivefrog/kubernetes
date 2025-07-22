
sre@k8s-controller-01:~$ vi deployment.yml 
sre@k8s-controller-01:~$ cat deployment.yml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kuard
  namespace: default
spec:
  replicas:  1
  selector:
    matchLabels:
      run: kuard
  template:
    metadata:
      labels:
        run: kuard
    spec:
      containers:
      - name: kuard
        image: gcr.io/kuar-demo/kuard-amd64:blue

sre@k8s-controller-01:~$ kubectl create -f deployment.yml 
deployment.apps/kuard created
sre@k8s-controller-01:~$ kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
alpaca-prod              1/1     Running   0          8d
bandicoot-prod           1/1     Running   0          8d
kuard-7fd9845fcb-m65ct   1/1     Running   0          12s

sre@k8s-controller-01:~$ kubectl rollout history deployment kuard
deployment.apps/kuard 
REVISION  CHANGE-CAUSE
1         <none>

sre@k8s-controller-01:~$ vi deployment.yml 
sre@k8s-controller-01:~$ cat deployment.yml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kuard
  namespace: default
spec:
  replicas:  1
  selector:
    matchLabels:
      run: kuard
  template:
    metadata:
      annotations:
        kubectl.kubernetes.io/last-applied-configuration: 
        kubernetes.io/change-cause: "Update to green kuard"
      labels:
        run: kuard
    spec:
      containers:
      - name: kuard
        image: gcr.io/kuar-demo/kuard-amd64:green
sre@k8s-controller-01:~$ kubectl rollout history deployment kuard
deployment.apps/kuard 
REVISION  CHANGE-CAUSE
1         <none>
2         Update to green kuard

sre@k8s-controller-01:~$ vi deployment.yml 
sre@k8s-controller-01:~$ cat deployment.yml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kuard
  namespace: default
spec:
  replicas:  1
  selector:
    matchLabels:
      run: kuard
  template:
    metadata:
      annotations:
        kubectl.kubernetes.io/last-applied-configuration: 
        kubernetes.io/change-cause: "Update to purple kuard"
      labels:
        run: kuard
    spec:
      containers:
      - name: kuard
        image: gcr.io/kuar-demo/kuard-amd64:purple
sre@k8s-controller-01:~$ kubectl apply -f deployment.yml 
deployment.apps/kuard configured
sre@k8s-controller-01:~$ kubectl rollout history deployment kuard
deployment.apps/kuard 
REVISION  CHANGE-CAUSE
1         <none>
2         Update to green kuard
3         Update to purple kuard


sre@k8s-controller-01:~$ kubectl get deployment kuard -o yaml | grep last-applied-configuration
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"apps/v1","kind":"Deployment","metadata":{"annotations":{},"name":"kuard","namespace":"default"},"spec":{"replicas":1,"selector":{"matchLabels":{"run":"kuard"}},"template":{"metadata":{"annotations":{"kubectl.kubernetes.io/last-applied-configuration":null,"kubernetes.io/change-cause":"Update to purple kuard"},"labels":{"run":"kuard"}},"spec":{"containers":[{"image":"gcr.io/kuar-demo/kuard-amd64:purple","name":"kuard"}]}}}}

sre@k8s-controller-01:~$ kubectl describe pod kuard-756fdf8ccc-kzzns | grep pulled
  Normal  Pulled     2m23s  kubelet            Successfully pulled image "gcr.io/kuar-demo/kuard-amd64:purple" in 4.639s (4.639s including waiting)
