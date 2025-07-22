
sre@k8s-controller-01:~/api/resourcequota/space$ vi postgres-configmap.yml 
sre@k8s-controller-01:~/api/resourcequota/space$ cat postgres-configmap.yml 
apiVersion: v1
kind: ConfigMap
metadata:
  name: postgres-secrets
  namespace: space
  labels:
    app: postgres
data:
  POSTGRES_DB: demo
  POSTGRES_USER: demo
  POSTGRES_PASSWORD: P4$$w0rd!

sre@k8s-controller-01:~/api/resourcequota/space$ kubectl create -f postgres-configmap.yml 
configmap/postgres-secrets created
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space get configmap
NAME               DATA   AGE
kube-root-ca.crt   1      43m
postgres-secrets   3      12s
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space get configmap postgres-secrets -o yaml
apiVersion: v1
data:
  POSTGRES_DB: demo
  POSTGRES_PASSWORD: P4$$w0rd!
  POSTGRES_USER: demo
kind: ConfigMap
metadata:
  creationTimestamp: "2024-12-07T02:56:20Z"
  labels:
    app: postgres
  name: postgres-secrets
  namespace: space
  resourceVersion: "201412"
  uid: a7583c95-5096-4c0e-aa96-12d6475b672a

