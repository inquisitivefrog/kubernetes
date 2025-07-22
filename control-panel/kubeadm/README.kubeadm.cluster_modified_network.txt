
sre@k8s-controller-01:~$ ip addr show docker0
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 02:42:92:a0:a9:1a brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
sre@k8s-controller-01:~$ ip link show dev docker0
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default 
    link/ether 02:42:92:a0:a9:1a brd ff:ff:ff:ff:ff:ff

sre@k8s-controller-01:~$ ip route show
default via 192.168.1.1 dev enp0s3 proto static 
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown 
192.168.1.0/24 dev enp0s3 proto kernel scope link src 192.168.1.105 

sre@k8s-controller-01:~$ sudo iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
KUBE-PROXY-FIREWALL  all  --  anywhere             anywhere             ctstate NEW /* kubernetes load balancer firewall */
KUBE-NODEPORTS  all  --  anywhere             anywhere             /* kubernetes health check service ports */
KUBE-EXTERNAL-SERVICES  all  --  anywhere             anywhere             ctstate NEW /* kubernetes externally-visible service portals */
KUBE-FIREWALL  all  --  anywhere             anywhere            

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
KUBE-PROXY-FIREWALL  all  --  anywhere             anywhere             ctstate NEW /* kubernetes load balancer firewall */
KUBE-FORWARD  all  --  anywhere             anywhere             /* kubernetes forwarding rules */
KUBE-SERVICES  all  --  anywhere             anywhere             ctstate NEW /* kubernetes service portals */
KUBE-EXTERNAL-SERVICES  all  --  anywhere             anywhere             ctstate NEW /* kubernetes externally-visible service portals */
DOCKER-USER  all  --  anywhere             anywhere            
DOCKER-ISOLATION-STAGE-1  all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
DOCKER     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
KUBE-PROXY-FIREWALL  all  --  anywhere             anywhere             ctstate NEW /* kubernetes load balancer firewall */
KUBE-SERVICES  all  --  anywhere             anywhere             ctstate NEW /* kubernetes service portals */
KUBE-FIREWALL  all  --  anywhere             anywhere            

Chain DOCKER (1 references)
target     prot opt source               destination         

Chain DOCKER-ISOLATION-STAGE-1 (1 references)
target     prot opt source               destination         
DOCKER-ISOLATION-STAGE-2  all  --  anywhere             anywhere            
RETURN     all  --  anywhere             anywhere            

Chain DOCKER-ISOLATION-STAGE-2 (1 references)
target     prot opt source               destination         
DROP       all  --  anywhere             anywhere            
RETURN     all  --  anywhere             anywhere            

Chain DOCKER-USER (1 references)
target     prot opt source               destination         
RETURN     all  --  anywhere             anywhere            

Chain KUBE-EXTERNAL-SERVICES (2 references)
target     prot opt source               destination         

Chain KUBE-FIREWALL (2 references)
target     prot opt source               destination         
DROP       all  -- !localhost/8          localhost/8          /* block incoming localnet connections */ ! ctstate RELATED,ESTABLISHED,DNAT

Chain KUBE-FORWARD (1 references)
target     prot opt source               destination         
DROP       all  --  anywhere             anywhere             ctstate INVALID
ACCEPT     all  --  anywhere             anywhere             /* kubernetes forwarding rules */ mark match 0x4000/0x4000
ACCEPT     all  --  anywhere             anywhere             /* kubernetes forwarding conntrack rule */ ctstate RELATED,ESTABLISHED

Chain KUBE-KUBELET-CANARY (0 references)
target     prot opt source               destination         

Chain KUBE-NODEPORTS (1 references)
target     prot opt source               destination         

Chain KUBE-PROXY-CANARY (0 references)
target     prot opt source               destination         

Chain KUBE-PROXY-FIREWALL (3 references)
target     prot opt source               destination         

Chain KUBE-SERVICES (2 references)
target     prot opt source               destination         
REJECT     tcp  --  anywhere             10.96.0.10           /* kube-system/kube-dns:dns-tcp has no endpoints */ tcp dpt:domain reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             10.96.0.10           /* kube-system/kube-dns:metrics has no endpoints */ tcp dpt:9153 reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             10.96.0.10           /* kube-system/kube-dns:dns has no endpoints */ udp dpt:domain reject-with icmp-port-unreachable

sre@k8s-controller-01:~$ ss -aunp
State          Recv-Q         Send-Q                                     Local Address:Port                  Peer Address:Port         Process         
UNCONN         0              0                                             127.0.0.54:53                         0.0.0.0:*                            
UNCONN         0              0                                          127.0.0.53%lo:53                         0.0.0.0:*                            
UNCONN         0              0                      [fe80::a00:27ff:fe66:a709]%enp0s3:546                           [::]:*                            

