
sre@k8s-controller-01:~$ hostnamectl status
 Static hostname: k8s-controller-01
       Icon name: computer-vm
         Chassis: vm 🖴
      Machine ID: 817698d76b7f497e8956e2e5836d079e
         Boot ID: 77563223288642ba9864b461752fcc7d
  Virtualization: oracle
Operating System: Ubuntu 24.04.1 LTS              
          Kernel: Linux 6.8.0-47-generic
    Architecture: x86-64
 Hardware Vendor: innotek GmbH
  Hardware Model: VirtualBox
Firmware Version: VirtualBox
   Firmware Date: Fri 2006-12-01
    Firmware Age: 17y 10month 3w 3d               

sre@k8s-controller-01:~$ hostnamectl hostname
k8s-controller-01

sre@k8s-controller-01:~$ ip addr show  enp0s3
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:66:a7:09 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.105/24 brd 192.168.1.255 scope global enp0s3
       valid_lft forever preferred_lft forever
    inet6 2001:5a8:49c1:be00:a00:27ff:fe66:a709/64 scope global dynamic mngtmpaddr noprefixroute 
       valid_lft 21600sec preferred_lft 21600sec
    inet6 fe80::a00:27ff:fe66:a709/64 scope link 
       valid_lft forever preferred_lft forever

sre@k8s-controller-01:~$ ip link show enp0s3
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 08:00:27:66:a7:09 brd ff:ff:ff:ff:ff:ff

sre@k8s-controller-01:~$ ip link show type vxlan
sre@k8s-controller-01:~$ 

sre@k8s-controller-01:~$ sudo iptables -L
[sudo] password for sre: 
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
DOCKER-USER  all  --  anywhere             anywhere            
DOCKER-ISOLATION-STAGE-1  all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
DOCKER     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

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
sre@k8s-controller-01:~$ 

sre@k8s-controller-01:~$ grep nameserver /etc/resolv.conf
nameserver 127.0.0.53
sre@k8s-controller-01:~$ dig k8s-controller-01 @127.0.0.53

; <<>> DiG 9.18.28-0ubuntu0.24.04.1-Ubuntu <<>> k8s-controller-01 @127.0.0.53
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 58088
;; flags: qr aa rd ra ad; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;k8s-controller-01.		IN	A

;; ANSWER SECTION:
k8s-controller-01.	0	IN	A	192.168.1.105

;; Query time: 1 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Thu Oct 24 21:29:19 UTC 2024
;; MSG SIZE  rcvd: 62

sre@k8s-controller-01:~$ ping -c 3 k8s-controller-01
PING k8s-controller-01 (192.168.1.105) 56(84) bytes of data.
64 bytes from k8s-controller-01 (192.168.1.105): icmp_seq=1 ttl=64 time=0.064 ms
64 bytes from k8s-controller-01 (192.168.1.105): icmp_seq=2 ttl=64 time=0.147 ms
64 bytes from k8s-controller-01 (192.168.1.105): icmp_seq=3 ttl=64 time=0.053 ms

--- k8s-controller-01 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2063ms
rtt min/avg/max/mdev = 0.053/0.088/0.147/0.041 ms

