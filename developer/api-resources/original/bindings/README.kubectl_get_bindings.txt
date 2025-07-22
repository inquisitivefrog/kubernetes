
sre@k8s-controller-01:~$ kubectl config get-contexts
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   

sre@k8s-controller-01:~$ kubectl get rolebindings,clusterrolebindings \
--all-namespaces  \
-o custom-columns='KIND:kind,NAMESPACE:metadata.namespace,NAME:metadata.name,SERVICE_ACCOUNTS:subjects[?(@.kind=="ServiceAccount")].name'
KIND                 NAMESPACE     NAME                                                   SERVICE_ACCOUNTS
RoleBinding          kube-public   kubeadm:bootstrap-signer-clusterinfo                   <none>
RoleBinding          kube-public   system:controller:bootstrap-signer                     bootstrap-signer
RoleBinding          kube-system   kube-proxy                                             <none>
RoleBinding          kube-system   kubeadm:kubelet-config                                 <none>
RoleBinding          kube-system   kubeadm:nodes-kubeadm-config                           <none>
RoleBinding          kube-system   system::extension-apiserver-authentication-reader      <none>
RoleBinding          kube-system   system::leader-locking-kube-controller-manager         kube-controller-manager
RoleBinding          kube-system   system::leader-locking-kube-scheduler                  kube-scheduler
RoleBinding          kube-system   system:controller:bootstrap-signer                     bootstrap-signer
RoleBinding          kube-system   system:controller:cloud-provider                       cloud-provider
RoleBinding          kube-system   system:controller:token-cleaner                        token-cleaner
ClusterRoleBinding   <none>        cluster-admin                                          <none>
ClusterRoleBinding   <none>        kubeadm:get-nodes                                      <none>
ClusterRoleBinding   <none>        kubeadm:kubelet-bootstrap                              <none>
ClusterRoleBinding   <none>        kubeadm:node-autoapprove-bootstrap                     <none>
ClusterRoleBinding   <none>        kubeadm:node-autoapprove-certificate-rotation          <none>
ClusterRoleBinding   <none>        kubeadm:node-proxier                                   kube-proxy
ClusterRoleBinding   <none>        system:basic-user                                      <none>
ClusterRoleBinding   <none>        system:controller:attachdetach-controller              attachdetach-controller
ClusterRoleBinding   <none>        system:controller:certificate-controller               certificate-controller
ClusterRoleBinding   <none>        system:controller:clusterrole-aggregation-controller   clusterrole-aggregation-controller
ClusterRoleBinding   <none>        system:controller:cronjob-controller                   cronjob-controller
ClusterRoleBinding   <none>        system:controller:daemon-set-controller                daemon-set-controller
ClusterRoleBinding   <none>        system:controller:deployment-controller                deployment-controller
ClusterRoleBinding   <none>        system:controller:disruption-controller                disruption-controller
ClusterRoleBinding   <none>        system:controller:endpoint-controller                  endpoint-controller
ClusterRoleBinding   <none>        system:controller:endpointslice-controller             endpointslice-controller
ClusterRoleBinding   <none>        system:controller:endpointslicemirroring-controller    endpointslicemirroring-controller
ClusterRoleBinding   <none>        system:controller:ephemeral-volume-controller          ephemeral-volume-controller
ClusterRoleBinding   <none>        system:controller:expand-controller                    expand-controller
ClusterRoleBinding   <none>        system:controller:generic-garbage-collector            generic-garbage-collector
ClusterRoleBinding   <none>        system:controller:horizontal-pod-autoscaler            horizontal-pod-autoscaler
ClusterRoleBinding   <none>        system:controller:job-controller                       job-controller
ClusterRoleBinding   <none>        system:controller:namespace-controller                 namespace-controller
ClusterRoleBinding   <none>        system:controller:node-controller                      node-controller
ClusterRoleBinding   <none>        system:controller:persistent-volume-binder             persistent-volume-binder
ClusterRoleBinding   <none>        system:controller:pod-garbage-collector                pod-garbage-collector
ClusterRoleBinding   <none>        system:controller:pv-protection-controller             pv-protection-controller
ClusterRoleBinding   <none>        system:controller:pvc-protection-controller            pvc-protection-controller
ClusterRoleBinding   <none>        system:controller:replicaset-controller                replicaset-controller
ClusterRoleBinding   <none>        system:controller:replication-controller               replication-controller
ClusterRoleBinding   <none>        system:controller:resourcequota-controller             resourcequota-controller
ClusterRoleBinding   <none>        system:controller:root-ca-cert-publisher               root-ca-cert-publisher
ClusterRoleBinding   <none>        system:controller:route-controller                     route-controller
ClusterRoleBinding   <none>        system:controller:service-account-controller           service-account-controller
ClusterRoleBinding   <none>        system:controller:service-controller                   service-controller
ClusterRoleBinding   <none>        system:controller:statefulset-controller               statefulset-controller
ClusterRoleBinding   <none>        system:controller:ttl-after-finished-controller        ttl-after-finished-controller
ClusterRoleBinding   <none>        system:controller:ttl-controller                       ttl-controller
ClusterRoleBinding   <none>        system:coredns                                         coredns
ClusterRoleBinding   <none>        system:discovery                                       <none>
ClusterRoleBinding   <none>        system:kube-controller-manager                         <none>
ClusterRoleBinding   <none>        system:kube-dns                                        kube-dns
ClusterRoleBinding   <none>        system:kube-scheduler                                  <none>
ClusterRoleBinding   <none>        system:monitoring                                      <none>
ClusterRoleBinding   <none>        system:node                                            <none>
ClusterRoleBinding   <none>        system:node-proxier                                    <none>
ClusterRoleBinding   <none>        system:public-info-viewer                              <none>
ClusterRoleBinding   <none>        system:service-account-issuer-discovery                <none>
ClusterRoleBinding   <none>        system:volume-scheduler                                <none>
sre@k8s-controller-01:~$ kubectl get rolebindings,clusterrolebindings
NAME                                                                                                ROLE                                                                               AGE
clusterrolebinding.rbac.authorization.k8s.io/cluster-admin                                          ClusterRole/cluster-admin                                                          6d21h
clusterrolebinding.rbac.authorization.k8s.io/kubeadm:get-nodes                                      ClusterRole/kubeadm:get-nodes                                                      6d21h
clusterrolebinding.rbac.authorization.k8s.io/kubeadm:kubelet-bootstrap                              ClusterRole/system:node-bootstrapper                                               6d21h
clusterrolebinding.rbac.authorization.k8s.io/kubeadm:node-autoapprove-bootstrap                     ClusterRole/system:certificates.k8s.io:certificatesigningrequests:nodeclient       6d21h
clusterrolebinding.rbac.authorization.k8s.io/kubeadm:node-autoapprove-certificate-rotation          ClusterRole/system:certificates.k8s.io:certificatesigningrequests:selfnodeclient   6d21h
clusterrolebinding.rbac.authorization.k8s.io/kubeadm:node-proxier                                   ClusterRole/system:node-proxier                                                    6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:basic-user                                      ClusterRole/system:basic-user                                                      6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:attachdetach-controller              ClusterRole/system:controller:attachdetach-controller                              6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:certificate-controller               ClusterRole/system:controller:certificate-controller                               6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:clusterrole-aggregation-controller   ClusterRole/system:controller:clusterrole-aggregation-controller                   6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:cronjob-controller                   ClusterRole/system:controller:cronjob-controller                                   6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:daemon-set-controller                ClusterRole/system:controller:daemon-set-controller                                6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:deployment-controller                ClusterRole/system:controller:deployment-controller                                6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:disruption-controller                ClusterRole/system:controller:disruption-controller                                6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:endpoint-controller                  ClusterRole/system:controller:endpoint-controller                                  6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:endpointslice-controller             ClusterRole/system:controller:endpointslice-controller                             6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:endpointslicemirroring-controller    ClusterRole/system:controller:endpointslicemirroring-controller                    6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:ephemeral-volume-controller          ClusterRole/system:controller:ephemeral-volume-controller                          6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:expand-controller                    ClusterRole/system:controller:expand-controller                                    6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:generic-garbage-collector            ClusterRole/system:controller:generic-garbage-collector                            6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:horizontal-pod-autoscaler            ClusterRole/system:controller:horizontal-pod-autoscaler                            6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:job-controller                       ClusterRole/system:controller:job-controller                                       6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:namespace-controller                 ClusterRole/system:controller:namespace-controller                                 6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:node-controller                      ClusterRole/system:controller:node-controller                                      6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:persistent-volume-binder             ClusterRole/system:controller:persistent-volume-binder                             6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:pod-garbage-collector                ClusterRole/system:controller:pod-garbage-collector                                6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:pv-protection-controller             ClusterRole/system:controller:pv-protection-controller                             6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:pvc-protection-controller            ClusterRole/system:controller:pvc-protection-controller                            6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:replicaset-controller                ClusterRole/system:controller:replicaset-controller                                6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:replication-controller               ClusterRole/system:controller:replication-controller                               6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:resourcequota-controller             ClusterRole/system:controller:resourcequota-controller                             6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:root-ca-cert-publisher               ClusterRole/system:controller:root-ca-cert-publisher                               6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:route-controller                     ClusterRole/system:controller:route-controller                                     6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:service-account-controller           ClusterRole/system:controller:service-account-controller                           6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:service-controller                   ClusterRole/system:controller:service-controller                                   6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:statefulset-controller               ClusterRole/system:controller:statefulset-controller                               6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:ttl-after-finished-controller        ClusterRole/system:controller:ttl-after-finished-controller                        6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:controller:ttl-controller                       ClusterRole/system:controller:ttl-controller                                       6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:coredns                                         ClusterRole/system:coredns                                                         6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:discovery                                       ClusterRole/system:discovery                                                       6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:kube-controller-manager                         ClusterRole/system:kube-controller-manager                                         6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:kube-dns                                        ClusterRole/system:kube-dns                                                        6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:kube-scheduler                                  ClusterRole/system:kube-scheduler                                                  6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:monitoring                                      ClusterRole/system:monitoring                                                      6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:node                                            ClusterRole/system:node                                                            6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:node-proxier                                    ClusterRole/system:node-proxier                                                    6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:public-info-viewer                              ClusterRole/system:public-info-viewer                                              6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:service-account-issuer-discovery                ClusterRole/system:service-account-issuer-discovery                                6d21h
clusterrolebinding.rbac.authorization.k8s.io/system:volume-scheduler                                ClusterRole/system:volume-scheduler                                                6d21h
sre@k8s-controller-01:~$ 

