
sre@k8s-controller-01:~$ kubectl get services -o wide
NAME       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE   SELECTOR
kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   19h   k8s-app=kube-dns
sre@k8s-controller-01:~$ kubectl get nodes -o wide
NAME                STATUS   ROLES           AGE   VERSION    INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
k8s-controller-01   Ready    control-plane   19h   v1.28.14   192.168.1.105   <none>        Ubuntu 24.04.1 LTS   6.8.0-47-generic   containerd://1.7.12
sre@k8s-controller-01:~$ kubectl get pods --all-namespaces=true -o wide
NAMESPACE      NAME                                        READY   STATUS    RESTARTS      AGE     IP              NODE                NOMINATED NODE   READINESS GATES
kube-flannel   kube-flannel-ds-b6t6r                       1/1     Running   0             6m45s   192.168.1.105   k8s-controller-01   <none>           <none>
kube-system    coredns-5dd5756b68-vnt9b                    1/1     Running   1 (52m ago)   19h     10.244.0.5      k8s-controller-01   <none>           <none>
kube-system    coredns-5dd5756b68-z9vcd                    1/1     Running   1 (52m ago)   19h     10.244.0.4      k8s-controller-01   <none>           <none>
kube-system    etcd-k8s-controller-01                      1/1     Running   3 (42m ago)   19h     192.168.1.105   k8s-controller-01   <none>           <none>
kube-system    kube-apiserver-k8s-controller-01            1/1     Running   3 (42m ago)   19h     192.168.1.105   k8s-controller-01   <none>           <none>
kube-system    kube-controller-manager-k8s-controller-01   1/1     Running   3 (42m ago)   19h     192.168.1.105   k8s-controller-01   <none>           <none>
kube-system    kube-proxy-4wjrk                            1/1     Running   2 (42m ago)   19h     192.168.1.105   k8s-controller-01   <none>           <none>
kube-system    kube-scheduler-k8s-controller-01            1/1     Running   3 (42m ago)   19h     192.168.1.105   k8s-controller-01   <none>           <none>
kube-system    weave-net-lfgst                             2/2     Running   6 (41m ago)   18h     192.168.1.105   k8s-controller-01   <none>      

sre@k8s-controller-01:~$ sudo cat /etc/cni/net.d/10-weave.conflist
{
    "cniVersion": "0.3.0",
    "name": "weave",
    "plugins": [
        {
            "name": "weave",
            "type": "weave-net",
            "hairpinMode": true
        },
        {
            "type": "portmap",
            "capabilities": {"portMappings": true},
            "snat": true
        }
    ]
}


sre@k8s-controller-01:~$ ps -ef | grep weave
root        2294    1551  0 17:16 ?        00:00:01 /usr/bin/weave-npc
root        2654    1551  0 17:16 ?        00:00:00 /bin/sh /home/weave/launch.sh
root        2723    2654  0 17:16 ?        00:00:01 /home/weave/weaver --port=6783 --datapath=datapath --name=26:2b:93:f6:09:9e --http-addr=127.0.0.1:6784 --metrics-addr=0.0.0.0:6782 --docker-api= --no-dns --db-prefix=/weavedb/weave-net --ipalloc-range=10.32.0.0/12 --nickname=k8s-controller-01 --ipalloc-init consensus=0 --conn-limit=200 --expect-npc --no-masq-local
root        2874    2654  0 17:17 ?        00:00:00 /home/weave/kube-utils -run-reclaim-daemon -node-name=k8s-controller-01 -peer-name=26:2b:93:f6:09:9e -log-level=debug
sre        12274    4413  0 17:41 pts/0    00:00:00 grep --color=auto weave

sre@k8s-controller-01:~$ wget https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
sre@k8s-controller-01:~$ kubectl apply -f weave-daemonset-k8s.yaml

