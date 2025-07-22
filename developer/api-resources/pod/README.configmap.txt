
sre@k8s-controller-01:~/api$ vi configmap.yml 
sre@k8s-controller-01:~/api$ cat configmap.yml 
apiVersion: v1
data:
  demo.conf: |
    server { location { return 200 "hello world"}}
kind: ConfigMap
metadata:
  name: nginx-demo
  namespace: default

sre@k8s-controller-01:~/api$ kubectl apply -f configmap.yml 
configmap/nginx-demo created
sre@k8s-controller-01:~/api$ kubectl get configmap
NAME               DATA   AGE
kube-root-ca.crt   1      3d21h
nginx-demo         1      27s
sre@k8s-controller-01:~/api$ kubectl get configmap nginx-demo -o yaml
apiVersion: v1
data:
  demo.conf: |
    server { location { return 200 "hello world"}}
kind: ConfigMap
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","data":{"demo.conf":"server { location { return 200 \"hello world\"}}\n"},"kind":"ConfigMap","metadata":{"annotations":{},"name":"nginx-demo","namespace":"default"}}
  creationTimestamp: "2024-11-11T19:09:01Z"
  name: nginx-demo
  namespace: default
  resourceVersion: "32460"
  uid: 4bd8c0fe-f2e9-49d1-9019-657129e14829
sre@k8s-controller-01:~/api$ 

