
sre@k8s-controller-01:~$ sudo ss -ltpn
[sudo] password for sre: 
State     Recv-Q    Send-Q       Local Address:Port        Peer Address:Port    Process                                                                         
LISTEN    0         4096            127.0.0.54:53               0.0.0.0:*        users:(("systemd-resolve",pid=536,fd=17))                                      
LISTEN    0         4096         192.168.1.105:2379             0.0.0.0:*        users:(("etcd",pid=14238,fd=9))                                                
LISTEN    0         4096         192.168.1.105:2380             0.0.0.0:*        users:(("etcd",pid=14238,fd=7))                                                
LISTEN    0         4096         127.0.0.53%lo:53               0.0.0.0:*        users:(("systemd-resolve",pid=536,fd=15))                                      
LISTEN    0         4096             127.0.0.1:10249            0.0.0.0:*        users:(("kube-proxy",pid=14448,fd=14))                                         
LISTEN    0         4096             127.0.0.1:10248            0.0.0.0:*        users:(("kubelet",pid=14362,fd=9))                                             
LISTEN    0         4096             127.0.0.1:10257            0.0.0.0:*        users:(("kube-controller",pid=14254,fd=3))                                     
LISTEN    0         4096             127.0.0.1:10259            0.0.0.0:*        users:(("kube-scheduler",pid=14207,fd=3))                                      
LISTEN    0         4096             127.0.0.1:2379             0.0.0.0:*        users:(("etcd",pid=14238,fd=8))                                                
LISTEN    0         4096             127.0.0.1:2381             0.0.0.0:*        users:(("etcd",pid=14238,fd=13))                                               
LISTEN    0         4096             127.0.0.1:33025            0.0.0.0:*        users:(("containerd",pid=733,fd=11))                                           
LISTEN    0         4096                     *:10250                  *:*        users:(("kubelet",pid=14362,fd=19))                                            
LISTEN    0         4096                     *:22                     *:*        users:(("sshd",pid=1988,fd=3),("systemd",pid=1,fd=103))                        
LISTEN    0         4096                     *:10256                  *:*        users:(("kube-proxy",pid=14448,fd=13))                                         
LISTEN    0         4096                     *:6443                   *:*        users:(("kube-apiserver",pid=14215,fd=3))                                      

