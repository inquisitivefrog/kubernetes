
NOTE: get paths to etcd TLS keys from kube-apiserver

kube-apiserver 
--etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt 
--etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt
--etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key
--etcd-servers=https://127.0.0.1:2379


sre@k8s-controller-01:~$ ETCDCTL_API=3 sudo /home/sre/etcd/bin/etcdctl --endpoints=127.0.0.1:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/apiserver-etcd-client.crt --key /etc/kubernetes/pki/apiserver-etcd-client.key get / --prefix --keys-only
/registry/apiregistration.k8s.io/apiservices/v1.

/registry/apiregistration.k8s.io/apiservices/v1.admissionregistration.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.apiextensions.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.apps

/registry/apiregistration.k8s.io/apiservices/v1.authentication.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.authorization.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.autoscaling

/registry/apiregistration.k8s.io/apiservices/v1.batch

/registry/apiregistration.k8s.io/apiservices/v1.certificates.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.coordination.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.discovery.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.events.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.networking.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.node.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.policy

/registry/apiregistration.k8s.io/apiservices/v1.rbac.authorization.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.scheduling.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.storage.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1beta2.flowcontrol.apiserver.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1beta3.flowcontrol.apiserver.k8s.io

/registry/apiregistration.k8s.io/apiservices/v2.autoscaling

/registry/clusterrolebindings/cluster-admin

/registry/clusterrolebindings/kubeadm:get-nodes

/registry/clusterrolebindings/kubeadm:kubelet-bootstrap

/registry/clusterrolebindings/kubeadm:node-autoapprove-bootstrap

/registry/clusterrolebindings/kubeadm:node-autoapprove-certificate-rotation

/registry/clusterrolebindings/kubeadm:node-proxier

/registry/clusterrolebindings/system:basic-user

/registry/clusterrolebindings/system:controller:attachdetach-controller

/registry/clusterrolebindings/system:controller:certificate-controller

/registry/clusterrolebindings/system:controller:clusterrole-aggregation-controller

/registry/clusterrolebindings/system:controller:cronjob-controller

/registry/clusterrolebindings/system:controller:daemon-set-controller

/registry/clusterrolebindings/system:controller:deployment-controller

/registry/clusterrolebindings/system:controller:disruption-controller

/registry/clusterrolebindings/system:controller:endpoint-controller

/registry/clusterrolebindings/system:controller:endpointslice-controller

/registry/clusterrolebindings/system:controller:endpointslicemirroring-controller

/registry/clusterrolebindings/system:controller:ephemeral-volume-controller

/registry/clusterrolebindings/system:controller:expand-controller

/registry/clusterrolebindings/system:controller:generic-garbage-collector

/registry/clusterrolebindings/system:controller:horizontal-pod-autoscaler

/registry/clusterrolebindings/system:controller:job-controller

/registry/clusterrolebindings/system:controller:namespace-controller

/registry/clusterrolebindings/system:controller:node-controller

/registry/clusterrolebindings/system:controller:persistent-volume-binder

/registry/clusterrolebindings/system:controller:pod-garbage-collector

/registry/clusterrolebindings/system:controller:pv-protection-controller

/registry/clusterrolebindings/system:controller:pvc-protection-controller

/registry/clusterrolebindings/system:controller:replicaset-controller

/registry/clusterrolebindings/system:controller:replication-controller

/registry/clusterrolebindings/system:controller:resourcequota-controller

/registry/clusterrolebindings/system:controller:root-ca-cert-publisher

/registry/clusterrolebindings/system:controller:route-controller

/registry/clusterrolebindings/system:controller:service-account-controller

/registry/clusterrolebindings/system:controller:service-controller

/registry/clusterrolebindings/system:controller:statefulset-controller

/registry/clusterrolebindings/system:controller:ttl-after-finished-controller

/registry/clusterrolebindings/system:controller:ttl-controller

/registry/clusterrolebindings/system:coredns

/registry/clusterrolebindings/system:discovery

/registry/clusterrolebindings/system:kube-controller-manager

/registry/clusterrolebindings/system:kube-dns

/registry/clusterrolebindings/system:kube-scheduler

/registry/clusterrolebindings/system:monitoring

/registry/clusterrolebindings/system:node

/registry/clusterrolebindings/system:node-proxier

/registry/clusterrolebindings/system:public-info-viewer

/registry/clusterrolebindings/system:service-account-issuer-discovery

/registry/clusterrolebindings/system:volume-scheduler

/registry/clusterroles/admin

/registry/clusterroles/cluster-admin

/registry/clusterroles/edit

/registry/clusterroles/kubeadm:get-nodes

/registry/clusterroles/system:aggregate-to-admin

/registry/clusterroles/system:aggregate-to-edit

/registry/clusterroles/system:aggregate-to-view

/registry/clusterroles/system:auth-delegator

/registry/clusterroles/system:basic-user

/registry/clusterroles/system:certificates.k8s.io:certificatesigningrequests:nodeclient

/registry/clusterroles/system:certificates.k8s.io:certificatesigningrequests:selfnodeclient

/registry/clusterroles/system:certificates.k8s.io:kube-apiserver-client-approver

/registry/clusterroles/system:certificates.k8s.io:kube-apiserver-client-kubelet-approver

/registry/clusterroles/system:certificates.k8s.io:kubelet-serving-approver

/registry/clusterroles/system:certificates.k8s.io:legacy-unknown-approver

/registry/clusterroles/system:controller:attachdetach-controller

/registry/clusterroles/system:controller:certificate-controller

/registry/clusterroles/system:controller:clusterrole-aggregation-controller

/registry/clusterroles/system:controller:cronjob-controller

/registry/clusterroles/system:controller:daemon-set-controller

/registry/clusterroles/system:controller:deployment-controller

/registry/clusterroles/system:controller:disruption-controller

/registry/clusterroles/system:controller:endpoint-controller

/registry/clusterroles/system:controller:endpointslice-controller

/registry/clusterroles/system:controller:endpointslicemirroring-controller

/registry/clusterroles/system:controller:ephemeral-volume-controller

/registry/clusterroles/system:controller:expand-controller

/registry/clusterroles/system:controller:generic-garbage-collector

/registry/clusterroles/system:controller:horizontal-pod-autoscaler

/registry/clusterroles/system:controller:job-controller

/registry/clusterroles/system:controller:namespace-controller

/registry/clusterroles/system:controller:node-controller

/registry/clusterroles/system:controller:persistent-volume-binder

/registry/clusterroles/system:controller:pod-garbage-collector

/registry/clusterroles/system:controller:pv-protection-controller

/registry/clusterroles/system:controller:pvc-protection-controller

/registry/clusterroles/system:controller:replicaset-controller

/registry/clusterroles/system:controller:replication-controller

/registry/clusterroles/system:controller:resourcequota-controller

/registry/clusterroles/system:controller:root-ca-cert-publisher

/registry/clusterroles/system:controller:route-controller

/registry/clusterroles/system:controller:service-account-controller

/registry/clusterroles/system:controller:service-controller

/registry/clusterroles/system:controller:statefulset-controller

/registry/clusterroles/system:controller:ttl-after-finished-controller

/registry/clusterroles/system:controller:ttl-controller

/registry/clusterroles/system:coredns

/registry/clusterroles/system:discovery

/registry/clusterroles/system:heapster

/registry/clusterroles/system:kube-aggregator

/registry/clusterroles/system:kube-controller-manager

/registry/clusterroles/system:kube-dns

/registry/clusterroles/system:kube-scheduler

/registry/clusterroles/system:kubelet-api-admin

/registry/clusterroles/system:monitoring

/registry/clusterroles/system:node

/registry/clusterroles/system:node-bootstrapper

/registry/clusterroles/system:node-problem-detector

/registry/clusterroles/system:node-proxier

/registry/clusterroles/system:persistent-volume-provisioner

/registry/clusterroles/system:public-info-viewer

/registry/clusterroles/system:service-account-issuer-discovery

/registry/clusterroles/system:volume-scheduler

/registry/clusterroles/view

/registry/configmaps/default/kube-root-ca.crt

/registry/configmaps/kube-node-lease/kube-root-ca.crt

/registry/configmaps/kube-public/cluster-info

/registry/configmaps/kube-public/kube-root-ca.crt

/registry/configmaps/kube-system/coredns

/registry/configmaps/kube-system/extension-apiserver-authentication

/registry/configmaps/kube-system/kube-apiserver-legacy-service-account-token-tracking

/registry/configmaps/kube-system/kube-proxy

/registry/configmaps/kube-system/kube-root-ca.crt

/registry/configmaps/kube-system/kubeadm-config

/registry/configmaps/kube-system/kubelet-config

/registry/controllerrevisions/kube-system/kube-proxy-747c75b954

/registry/csinodes/k8s-controller-01

/registry/daemonsets/kube-system/kube-proxy

/registry/deployments/kube-system/coredns

/registry/endpointslices/default/kubernetes

/registry/endpointslices/kube-system/kube-dns-kx7k8

/registry/events/default/k8s-controller-01.1801bdbe9e50978a

/registry/events/default/k8s-controller-01.1801bdbea05f6e2b

/registry/events/default/k8s-controller-01.1801bdbea5c1d1b3

/registry/events/default/k8s-controller-01.1801bdbea5c1fabe

/registry/events/default/k8s-controller-01.1801bdbea5c2153d

/registry/events/default/k8s-controller-01.1801bdbeaf320578

/registry/events/default/k8s-controller-01.1801bdc1050d087a

/registry/events/default/k8s-controller-01.1801bdc7c34ef7f2

/registry/events/kube-system/coredns-5dd5756b68-2zrhr.1801808537d3d9f0

/registry/events/kube-system/coredns-5dd5756b68-2zrhr.1801bdc416b3447a

/registry/events/kube-system/coredns-5dd5756b68-wcs5x.180180853c608472

/registry/events/kube-system/coredns-5dd5756b68-wcs5x.1801bdc416b727d4

/registry/events/kube-system/etcd-k8s-controller-01.1801bdbeccdf14cc

/registry/events/kube-system/etcd-k8s-controller-01.1801bdbf0ce6e214

/registry/events/kube-system/etcd-k8s-controller-01.1801bdbf1e686b08

/registry/events/kube-system/etcd-k8s-controller-01.1801bdbf3cc2983c

/registry/events/kube-system/etcd-k8s-controller-01.1801bdc7c764aadd

/registry/events/kube-system/kube-apiserver-k8s-controller-01.1801bdbecb622788

/registry/events/kube-system/kube-apiserver-k8s-controller-01.1801bdbf04de89d2

/registry/events/kube-system/kube-apiserver-k8s-controller-01.1801bdbf202dad51

/registry/events/kube-system/kube-apiserver-k8s-controller-01.1801bdbf3cb94d56

/registry/events/kube-system/kube-apiserver-k8s-controller-01.1801bdc7c7700fb8

/registry/events/kube-system/kube-controller-manager-k8s-controller-01.1801bdbece512f21

/registry/events/kube-system/kube-controller-manager-k8s-controller-01.1801bdbf06b8c9d6

/registry/events/kube-system/kube-controller-manager-k8s-controller-01.1801bdbf19dcd696

/registry/events/kube-system/kube-controller-manager-k8s-controller-01.1801bdbf3cc0c976

/registry/events/kube-system/kube-controller-manager-k8s-controller-01.1801bdc7c7b58c9d

/registry/events/kube-system/kube-controller-manager.1801bdc506cd5e35

/registry/events/kube-system/kube-proxy-p4jmn.1801bdc0cce7cafc

/registry/events/kube-system/kube-proxy-p4jmn.1801bdc0d64f2c81

/registry/events/kube-system/kube-proxy-p4jmn.1801bdc0d94e2aa7

/registry/events/kube-system/kube-proxy-p4jmn.1801bdc0e04cc5af

/registry/events/kube-system/kube-proxy-p4jmn.1801bdc7c697979c

/registry/events/kube-system/kube-scheduler-k8s-controller-01.1801bdbed03788f4

/registry/events/kube-system/kube-scheduler-k8s-controller-01.1801bdbf02189f29

/registry/events/kube-system/kube-scheduler-k8s-controller-01.1801bdbf19808aa8

/registry/events/kube-system/kube-scheduler-k8s-controller-01.1801bdbf37e402d3

/registry/events/kube-system/kube-scheduler-k8s-controller-01.1801bdc7c9b27243

/registry/events/kube-system/kube-scheduler.1801bdc4164b5696

/registry/flowschemas/catch-all

/registry/flowschemas/endpoint-controller

/registry/flowschemas/exempt

/registry/flowschemas/global-default

/registry/flowschemas/kube-controller-manager

/registry/flowschemas/kube-scheduler

/registry/flowschemas/kube-system-service-accounts

/registry/flowschemas/probes

/registry/flowschemas/service-accounts

/registry/flowschemas/system-leader-election

/registry/flowschemas/system-node-high

/registry/flowschemas/system-nodes

/registry/flowschemas/workload-leader-election

/registry/leases/kube-node-lease/k8s-controller-01

/registry/leases/kube-system/apiserver-2lveot2v6kd5ppz7kzff6tkpmy

/registry/leases/kube-system/kube-controller-manager

/registry/leases/kube-system/kube-scheduler

/registry/masterleases/192.168.1.105

/registry/minions/k8s-controller-01

/registry/namespaces/default

/registry/namespaces/kube-node-lease

/registry/namespaces/kube-public

/registry/namespaces/kube-system

/registry/pods/kube-system/coredns-5dd5756b68-2zrhr

/registry/pods/kube-system/coredns-5dd5756b68-wcs5x

/registry/pods/kube-system/etcd-k8s-controller-01

/registry/pods/kube-system/kube-apiserver-k8s-controller-01

/registry/pods/kube-system/kube-controller-manager-k8s-controller-01

/registry/pods/kube-system/kube-proxy-p4jmn

/registry/pods/kube-system/kube-scheduler-k8s-controller-01

/registry/priorityclasses/system-cluster-critical

/registry/priorityclasses/system-node-critical

/registry/prioritylevelconfigurations/catch-all

/registry/prioritylevelconfigurations/exempt

/registry/prioritylevelconfigurations/global-default

/registry/prioritylevelconfigurations/leader-election

/registry/prioritylevelconfigurations/node-high

/registry/prioritylevelconfigurations/system

/registry/prioritylevelconfigurations/workload-high

/registry/prioritylevelconfigurations/workload-low

/registry/ranges/serviceips

/registry/ranges/servicenodeports

/registry/replicasets/kube-system/coredns-5dd5756b68

/registry/rolebindings/kube-public/kubeadm:bootstrap-signer-clusterinfo

/registry/rolebindings/kube-public/system:controller:bootstrap-signer

/registry/rolebindings/kube-system/kube-proxy

/registry/rolebindings/kube-system/kubeadm:kubelet-config

/registry/rolebindings/kube-system/kubeadm:nodes-kubeadm-config

/registry/rolebindings/kube-system/system::extension-apiserver-authentication-reader

/registry/rolebindings/kube-system/system::leader-locking-kube-controller-manager

/registry/rolebindings/kube-system/system::leader-locking-kube-scheduler

/registry/rolebindings/kube-system/system:controller:bootstrap-signer

/registry/rolebindings/kube-system/system:controller:cloud-provider

/registry/rolebindings/kube-system/system:controller:token-cleaner

/registry/roles/kube-public/kubeadm:bootstrap-signer-clusterinfo

/registry/roles/kube-public/system:controller:bootstrap-signer

/registry/roles/kube-system/extension-apiserver-authentication-reader

/registry/roles/kube-system/kube-proxy

/registry/roles/kube-system/kubeadm:kubelet-config

/registry/roles/kube-system/kubeadm:nodes-kubeadm-config

/registry/roles/kube-system/system::leader-locking-kube-controller-manager

/registry/roles/kube-system/system::leader-locking-kube-scheduler

/registry/roles/kube-system/system:controller:bootstrap-signer

/registry/roles/kube-system/system:controller:cloud-provider

/registry/roles/kube-system/system:controller:token-cleaner

/registry/secrets/kube-system/bootstrap-token-yxzxa2

/registry/serviceaccounts/default/default

/registry/serviceaccounts/kube-node-lease/default

/registry/serviceaccounts/kube-public/default

/registry/serviceaccounts/kube-system/attachdetach-controller

/registry/serviceaccounts/kube-system/bootstrap-signer

/registry/serviceaccounts/kube-system/certificate-controller

/registry/serviceaccounts/kube-system/clusterrole-aggregation-controller

/registry/serviceaccounts/kube-system/coredns

/registry/serviceaccounts/kube-system/cronjob-controller

/registry/serviceaccounts/kube-system/daemon-set-controller

/registry/serviceaccounts/kube-system/default

/registry/serviceaccounts/kube-system/deployment-controller

/registry/serviceaccounts/kube-system/disruption-controller

/registry/serviceaccounts/kube-system/endpoint-controller

/registry/serviceaccounts/kube-system/endpointslice-controller

/registry/serviceaccounts/kube-system/endpointslicemirroring-controller

/registry/serviceaccounts/kube-system/ephemeral-volume-controller

/registry/serviceaccounts/kube-system/expand-controller

/registry/serviceaccounts/kube-system/generic-garbage-collector

/registry/serviceaccounts/kube-system/horizontal-pod-autoscaler

/registry/serviceaccounts/kube-system/job-controller

/registry/serviceaccounts/kube-system/kube-proxy

/registry/serviceaccounts/kube-system/namespace-controller

/registry/serviceaccounts/kube-system/node-controller

/registry/serviceaccounts/kube-system/persistent-volume-binder

/registry/serviceaccounts/kube-system/pod-garbage-collector

/registry/serviceaccounts/kube-system/pv-protection-controller

/registry/serviceaccounts/kube-system/pvc-protection-controller

/registry/serviceaccounts/kube-system/replicaset-controller

/registry/serviceaccounts/kube-system/replication-controller

/registry/serviceaccounts/kube-system/resourcequota-controller

/registry/serviceaccounts/kube-system/root-ca-cert-publisher

/registry/serviceaccounts/kube-system/service-account-controller

/registry/serviceaccounts/kube-system/service-controller

/registry/serviceaccounts/kube-system/statefulset-controller

/registry/serviceaccounts/kube-system/token-cleaner

/registry/serviceaccounts/kube-system/ttl-after-finished-controller

/registry/serviceaccounts/kube-system/ttl-controller

/registry/services/endpoints/default/kubernetes

/registry/services/endpoints/kube-system/kube-dns

/registry/services/specs/default/kubernetes

/registry/services/specs/kube-system/kube-dns

sre@k8s-controller-01:~$ 

