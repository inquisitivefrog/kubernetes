
sre@k8s-controller-01:~$ ETCDCTL_API=3 sudo /home/sre/etcd/bin/etcdctl --endpoints=127.0.0.1:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/apiserver-etcd-client.crt --key /etc/kubernetes/pki/apiserver-etcd-client.key get /registry/services/specs/default/kubernetes --prefix
/registry/services/specs/default/kubernetes
k8s

v1Service?
?

kubernetesdefault"*$cec18cba-740a-40ff-818e-b13cafdbfaa62???Z
	component	apiserverZ
provider
kubernetes??
kube-apiserverUpdatev???FieldsV1:?
?{"f:metadata":{"f:labels":{".":{},"f:component":{},"f:provider":{}}},"f:spec":{"f:clusterIP":{},"f:internalTrafficPolicy":{},"f:ipFamilyPolicy":{},"f:ports":{".":{},"k:{\"port\":443,\"protocol\":\"TCP\"}":{".":{},"f:name":{},"f:port":{},"f:protocol":{},"f:targetPort":{}}},"f:sessionAffinity":{},"f:type":{}}}Bm

httpsTCP??2(	10.96.0.1"	ClusterIP:NoneBRZ`h?
                                                    SingleStack?	10.96.0.1?IPv4?Cluster
"

sre@k8s-controller-01:~$ ETCDCTL_API=3 sudo /home/sre/etcd/bin/etcdctl --endpoints=127.0.0.1:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/apiserver-etcd-client.crt --key /etc/kubernetes/pki/apiserver-etcd-client.key get /registry/services/specs/default/kubernetes --prefix --debug=true
ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
ETCDCTL_CERT=/etc/kubernetes/pki/apiserver-etcd-client.crt
ETCDCTL_COMMAND_TIMEOUT=5s
ETCDCTL_DEBUG=true
ETCDCTL_DIAL_TIMEOUT=2s
ETCDCTL_DISCOVERY_SRV=
ETCDCTL_DISCOVERY_SRV_NAME=
ETCDCTL_ENDPOINTS=[127.0.0.1:2379]
ETCDCTL_HEX=false
ETCDCTL_INSECURE_DISCOVERY=true
ETCDCTL_INSECURE_SKIP_TLS_VERIFY=false
ETCDCTL_INSECURE_TRANSPORT=true
ETCDCTL_KEEPALIVE_TIME=2s
ETCDCTL_KEEPALIVE_TIMEOUT=6s
ETCDCTL_KEY=/etc/kubernetes/pki/apiserver-etcd-client.key
ETCDCTL_PASSWORD=
ETCDCTL_USER=
ETCDCTL_WRITE_OUT=simple
2024/10/25 17:07:25 WARNING: [core] Adjusting keepalive ping interval to minimum period of 10s
2024/10/25 17:07:25 WARNING: [core] Adjusting keepalive ping interval to minimum period of 10s
2024/10/25 17:07:25 INFO: [core] [Channel #1] Channel created
2024/10/25 17:07:25 INFO: [core] [Channel #1] original dial target is: "etcd-endpoints://0xc0002c6000/127.0.0.1:2379"
2024/10/25 17:07:25 INFO: [core] [Channel #1] parsed dial target is: {URL:{Scheme:etcd-endpoints Opaque: User: Host:0xc0002c6000 Path:/127.0.0.1:2379 RawPath: OmitHost:false ForceQuery:false RawQuery: Fragment: RawFragment:}}
2024/10/25 17:07:25 INFO: [core] [Channel #1] Channel authority set to "127.0.0.1:2379"
2024/10/25 17:07:25 INFO: [core] [Channel #1] Resolver state updated: {
  "Addresses": [
    {
      "Addr": "127.0.0.1:2379",
      "ServerName": "127.0.0.1:2379",
      "Attributes": null,
      "BalancerAttributes": null,
      "Metadata": null
    }
  ],
  "Endpoints": [
    {
      "Addresses": [
        {
          "Addr": "127.0.0.1:2379",
          "ServerName": "127.0.0.1:2379",
          "Attributes": null,
          "BalancerAttributes": null,
          "Metadata": null
        }
      ],
      "Attributes": null
    }
  ],
  "ServiceConfig": {
    "Config": {
      "Config": null,
      "LB": "round_robin",
      "Methods": {}
    },
    "Err": null
  },
  "Attributes": null
} (service config updated; resolver returned new addresses)
2024/10/25 17:07:25 INFO: [core] [Channel #1] Channel switches to new LB policy "round_robin"
2024/10/25 17:07:25 INFO: [balancer] base.baseBalancer: got new ClientConn state:  {{[{Addr: "127.0.0.1:2379", ServerName: "127.0.0.1:2379", }] [{[{Addr: "127.0.0.1:2379", ServerName: "127.0.0.1:2379", }] <nil>}] 0xc00030a5c0 <nil>} <nil>}
2024/10/25 17:07:25 INFO: [core] [Channel #1 SubChannel #2] Subchannel created
2024/10/25 17:07:25 INFO: [core] [Channel #1 SubChannel #2] Subchannel Connectivity change to CONNECTING
2024/10/25 17:07:25 INFO: [core] [Channel #1 SubChannel #2] Subchannel picks a new address "127.0.0.1:2379" to connect
2024/10/25 17:07:25 INFO: [roundrobin] roundrobinPicker: Build called with info: {map[]}
2024/10/25 17:07:25 INFO: [core] [Channel #1] Channel Connectivity change to CONNECTING
2024/10/25 17:07:25 INFO: [balancer] base.baseBalancer: handle SubConn state change: 0xc000437e00, CONNECTING
2024/10/25 17:07:25 INFO: [core] [Channel #1 SubChannel #2] Subchannel Connectivity change to READY
2024/10/25 17:07:25 INFO: [balancer] base.baseBalancer: handle SubConn state change: 0xc000437e00, READY
2024/10/25 17:07:25 INFO: [roundrobin] roundrobinPicker: Build called with info: {map[SubConn(id:2):{{Addr: "127.0.0.1:2379", ServerName: "127.0.0.1:2379", }}]}
2024/10/25 17:07:25 INFO: [core] [Channel #1] Channel Connectivity change to READY
/registry/services/specs/default/kubernetes
k8s

v1Service?
?

kubernetesdefault"*$cec18cba-740a-40ff-818e-b13cafdbfaa62???Z
	component	apiserverZ
provider
kubernetes??
kube-apiserverUpdatev???FieldsV1:?
?{"f:metadata":{"f:labels":{".":{},"f:component":{},"f:provider":{}}},"f:spec":{"f:clusterIP":{},"f:internalTrafficPolicy":{},"f:ipFamilyPolicy":{},"f:ports":{".":{},"k:{\"port\":443,\"protocol\":\"TCP\"}":{".":{},"f:name":{},"f:port":{},"f:protocol":{},"f:targetPort":{}}},"f:sessionAffinity":{},"f:type":{}}}Bm

httpsTCP??2(	10.96.0.1"	ClusterIP:NoneBRZ`h?
                                                    SingleStack?	10.96.0.1?IPv4?Cluster
"

