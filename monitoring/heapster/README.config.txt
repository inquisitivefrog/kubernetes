
tim@Tims-MBP heapster % kubectl --namespace=kube-system create -f heapster.yml 
serviceaccount/heapster created
tim@Tims-MBP heapster % kubectl --namespace=kube-system get serviceaccounts
NAME                                          SECRETS   AGE
attachdetach-controller                       0         4d22h
bootstrap-signer                              0         4d22h
certificate-controller                        0         4d22h
clusterrole-aggregation-controller            0         4d22h
coredns                                       0         4d22h
cronjob-controller                            0         4d22h
daemon-set-controller                         0         4d22h
default                                       0         4d22h
deployment-controller                         0         4d22h
disruption-controller                         0         4d22h
endpoint-controller                           0         4d22h
endpointslice-controller                      0         4d22h
endpointslicemirroring-controller             0         4d22h
ephemeral-volume-controller                   0         4d22h
expand-controller                             0         4d22h
generic-garbage-collector                     0         4d22h
heapster                                      0         29s
horizontal-pod-autoscaler                     0         4d22h
job-controller                                0         4d22h
kube-proxy                                    0         4d22h
legacy-service-account-token-cleaner          0         4d22h
namespace-controller                          0         4d22h
node-controller                               0         4d22h
persistent-volume-binder                      0         4d22h
pod-garbage-collector                         0         4d22h
pv-protection-controller                      0         4d22h
pvc-protection-controller                     0         4d22h
replicaset-controller                         0         4d22h
replication-controller                        0         4d22h
resourcequota-controller                      0         4d22h
root-ca-cert-publisher                        0         4d22h
service-account-controller                    0         4d22h
service-controller                            0         4d22h
statefulset-controller                        0         4d22h
storage-provisioner                           0         4d22h
token-cleaner                                 0         4d22h
ttl-after-finished-controller                 0         4d22h
ttl-controller                                0         4d22h
validatingadmissionpolicy-status-controller   0         4d22h
vpnkit-controller                             0         4d22h
tim@Tims-MBP heapster % cat heapster.yml 
apiVersion: v1
kind: ServiceAccount
metadata:
  name: heapster
tim@Tims-MBP heapster % 

tim@Tims-MBP heapster % kubectl --namespace=kube-system get serviceaccounts heapster
NAME       SECRETS   AGE
heapster   0         86s

tim@Tims-MBP heapster % vi rc.yml
tim@Tims-MBP heapster % cat rc.yml 
apiVersion: "v1"
kind: "ReplicationController"
metadata:
  labels:
    name: "heapster"
  name: "monitoring-heapster-controller"
spec:
  replicas: 1
  selector:
    name: "heapster"
  template:
    metadata:
      labels:
        name: "heapster"
    spec:
      serviceAccount: "heapster"
      containers:
        -
          image: "kubernetes/heapster:v0.13.0"
          name: "heapster"
          command:
            - "/heapster"
            - "--source=kubernetes:http://kubernetes-ro?inClusterConfig=false&useServiceAccount=true&auth="
            - "--sink=influxdb:http://monitoring-influxdb:80"
tim@Tims-MBP heapster % kubectl --namespace=kube-system create -f rc.yml
replicationcontroller/monitoring-heapster-controller created
tim@Tims-MBP heapster % kubectl --namespace=kube-system get replicationcontroller
NAME                             DESIRED   CURRENT   READY   AGE
monitoring-heapster-controller   1         1         0       13s
tim@Tims-MBP heapster % kubectl --namespace=kube-system describe replicationcontroller
Name:         monitoring-heapster-controller
Namespace:    kube-system
Selector:     name=heapster
Labels:       name=heapster
Annotations:  <none>
Replicas:     1 current / 1 desired
Pods Status:  0 Running / 1 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:           name=heapster
  Service Account:  heapster
  Containers:
   heapster:
    Image:      kubernetes/heapster:v0.13.0
    Port:       <none>
    Host Port:  <none>
    Command:
      /heapster
      --source=kubernetes:http://kubernetes-ro?inClusterConfig=false&useServiceAccount=true&auth=
      --sink=influxdb:http://monitoring-influxdb:80
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>

tim@Tims-MBP heapster % kubectl --namespace kube-system get apiservices
NAME                                   SERVICE   AVAILABLE   AGE
v1.                                    Local     True        4d22h
v1.admissionregistration.k8s.io        Local     True        4d22h
v1.apiextensions.k8s.io                Local     True        4d22h
v1.apps                                Local     True        4d22h
v1.authentication.k8s.io               Local     True        4d22h
v1.authorization.k8s.io                Local     True        4d22h
v1.autoscaling                         Local     True        4d22h
v1.batch                               Local     True        4d22h
v1.certificates.k8s.io                 Local     True        4d22h
v1.coordination.k8s.io                 Local     True        4d22h
v1.discovery.k8s.io                    Local     True        4d22h
v1.events.k8s.io                       Local     True        4d22h
v1.flowcontrol.apiserver.k8s.io        Local     True        4d22h
v1.networking.k8s.io                   Local     True        4d22h
v1.node.k8s.io                         Local     True        4d22h
v1.policy                              Local     True        4d22h
v1.rbac.authorization.k8s.io           Local     True        4d22h
v1.scheduling.k8s.io                   Local     True        4d22h
v1.storage.k8s.io                      Local     True        4d22h
v1beta3.flowcontrol.apiserver.k8s.io   Local     True        4d22h
v2.autoscaling                         Local     True        4d22h

tim@Tims-MBP heapster % kubectl --namespace=kube-system get tokenreviews
Error from server (MethodNotAllowed): the server does not allow this method on the requested resource

