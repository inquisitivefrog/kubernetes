1. create namespace
2. create resourcequota for namespace
3. create deployment
   Oh No! insufficient resources
4. create pod
   Oh No! still insufficient resources
5. query resourcequota for resources available
5. create pod with resource limits declared
6. query pod for resources requested
7. query resourcequota for resources consumed
   
sre@k8s-controller-01:~/api/resourcequota$ cat resourcequota.yml
apiVersion: v1
kind: Namespace        
metadata:
  name: test
---
apiVersion: v1         
kind: ResourceQuota
metadata:
  name: memorylimit
  namespace: test
spec:
  hard:
    requests.memory: 512Mi
    limits.memory: 1000Mi

sre@k8s-controller-01:~/api/resourcequota$ kubectl create -f resourcequota.yml
namespace/test created
resourcequota/memorylimit created

sre@k8s-controller-01:~/api/resourcequota$ kubectl get namespace test -o yaml
apiVersion: v1
kind: Namespace
metadata:
  creationTimestamp: "2024-12-06T20:57:35Z"
  labels:
    kubernetes.io/metadata.name: test
  name: test
  resourceVersion: "178628"
  uid: a86887e8-be93-4b3d-b40b-acebbc106901
spec:
  finalizers:
  - kubernetes
status:
  phase: Active

sre@k8s-controller-01:~/api/resourcequota$ kubectl --namespace=test  get resourcequotas
NAME          AGE    REQUEST                    LIMIT
memorylimit   148m   requests.memory: 0/512Mi   limits.memory: 0/1000Mi

sre@k8s-controller-01:~/api/resourcequota$ kubectl get resourcequota --namespace=test memorylimit -o yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  creationTimestamp: "2024-12-06T20:57:35Z"
  name: memorylimit
  namespace: test
  resourceVersion: "178635"
  uid: 838e44d1-3148-4d2a-b10e-fb4418517d3d
spec:
  hard:
    limits.memory: 1000Mi
    requests.memory: 512Mi
status:
  hard:
    limits.memory: 1000Mi
    requests.memory: 512Mi
  used:
    limits.memory: "0"
    requests.memory: "0"

sre@k8s-controller-01:~/api/resourcequota$ kubectl create -f pod.yml
pod/nginx created

sre@k8s-controller-01:~/api/resourcequota$ kubectl --namespace=test get pods
NAME    READY   STATUS    RESTARTS   AGE
nginx   1/1     Running   0          6m10s

sre@k8s-controller-01:~/api/resourcequota$ kubectl --namespace=test get pod nginx -o custom-columns='NAME:.metadata.name, MEM_LIMIT:.spec.containers[*].resources.limits.memory, MEM_REQUEST:.spec.containers[*].resources.requests.memory'
NAME     MEM_LIMIT    MEM_REQUEST
nginx   5Mi          2Mi

sre@k8s-controller-01:~/api/resourcequota$ kubectl --namespace=test get resourcequota memorylimit -o custom-columns='HARD_LIMIT:.spec.hard, USED_LIMIT:.status.used'
HARD_LIMIT                                         USED_LIMIT
map[limits.memory:1000Mi requests.memory:512Mi]   map[limits.memory:5Mi requests.memory:2Mi]

