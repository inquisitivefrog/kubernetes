
sre@k8s-controller-01:~/api/resourcequota/space$ vi postgres-claim.yml 
sre@k8s-controller-01:~/api/resourcequota/space$ cat postgres-claim.yml 
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: postgres-pvc-space
  namespace: space
  labels:
    app: postgres
spec:
  storageClassName: local
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 10Gi
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl create -f postgres-claim.yml 
persistentvolumeclaim/postgres-pvc-space created
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl get PersistentVolumeClaim
No resources found in default namespace.
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space get PersistentVolumeClaim
NAME                 STATUS    VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
postgres-pvc-space   Pending                                      local          19s

sre@k8s-controller-01:~/api/resourcequota/space$ vi postgres-pv.yml 
sre@k8s-controller-01:~/api/resourcequota/space$ cat postgres-pv.yml 
apiVersion: v1
kind: PersistentVolume
metadata:
  name: postgres-pv-space
  namespace: space
  labels:
    type: local
    app: postgres
spec:
  storageClassName: local
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteMany
  hostPath:
    path: /data/postgresql
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl create -f postgres-pv.yml 
persistentvolume/postgres-pv-space created
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl get PersistentVolume
NAME                CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                      STORAGECLASS   REASON   AGE
postgres-pv-space   10Gi       RWX            Retain           Bound    space/postgres-pvc-space   local                   3m40s
sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space get PersistentVolume
NAME                CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                      STORAGECLASS   REASON   AGE
postgres-pv-space   10Gi       RWX            Retain           Bound    space/postgres-pvc-space   local                   12s

sre@k8s-controller-01:~/api/resourcequota/space$ kubectl --namespace=space get PersistentVolumeClaim
NAME                 STATUS   VOLUME              CAPACITY   ACCESS MODES   STORAGECLASS   AGE
postgres-pvc-space   Bound    postgres-pv-space   10Gi       RWX            local          86s


NOTES: 
1. PersistentVolumeClaim and PersistentVolume are paired.  
   They must be created, modified and deleted together or one will be pending
2. PersistentVolumeClaim must be BOUND to a PersistentVolume before it can be used
   so reliant pods, replicasets or deployments will be incomplete until then
3. although PersistentVolume includes the namespace in the CLAIM 
   ie. <namespace>/<pv_name>, these exist in a cluster namespace so must have
   unique names.  probably wise to add namespace to the actual PV name
