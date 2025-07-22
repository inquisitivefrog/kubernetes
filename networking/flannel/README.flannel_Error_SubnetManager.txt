
sre@k8s-controller-01:~$ kubectl --namespace=kube-flannel logs kube-flannel-ds-j2qmt --container=kube-flannel
I1023 17:20:49.270032       1 main.go:211] CLI flags config: {etcdEndpoints:http://127.0.0.1:4001,http://127.0.0.1:2379 etcdPrefix:/coreos.com/network etcdKeyfile: etcdCertfile: etcdCAFile: etcdUsername: etcdPassword: version:false kubeSubnetMgr:true kubeApiUrl: kubeAnnotationPrefix:flannel.alpha.coreos.com kubeConfigFile: iface:[] ifaceRegex:[] ipMasq:true ifaceCanReach: subnetFile:/run/flannel/subnet.env publicIP: publicIPv6: subnetLeaseRenewMargin:60 healthzIP:0.0.0.0 healthzPort:0 iptablesResyncSeconds:5 iptablesForwardRules:true netConfPath:/etc/kube-flannel/net-conf.json setNodeNetworkUnavailable:true}
W1023 17:20:49.270220       1 client_config.go:618] Neither --kubeconfig nor --master was specified.  Using the inClusterConfig.  This might not work.
E1023 17:20:49.287435       1 main.go:228] Failed to create SubnetManager: error retrieving pod spec for 'kube-flannel/kube-flannel-ds-j2qmt': pods "kube-flannel-ds-j2qmt" is forbidden: User "system:serviceaccount:kube-flannel:flannel" cannot get resource "pods" in API group "" in the namespace "kube-flannel"

