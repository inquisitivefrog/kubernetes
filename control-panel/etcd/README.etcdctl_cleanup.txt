
root@k8s-controller-01:/home/sre# etcdctl del "" --prefix
{"level":"warn","ts":"2024-11-07T20:37:22.485Z","caller":"clientv3/retry_interceptor.go:62","msg":"retrying of unary invoker failed","target":"endpoint://client-6d6da0e5-bc37-478e-9ff5-6a4f0dd0e480/127.0.0.1:2379","attempt":0,"error":"rpc error: code = DeadlineExceeded desc = latest balancer error: all SubConns are in TransientFailure, latest connection error: connection error: desc = \"transport: Error while dialing dial tcp 127.0.0.1:2379: connect: connection refused\""}
Error: context deadline exceeded

root@k8s-controller-01:/home/sre# ss -at | grep LISTEN
LISTEN 0      4096            127.0.0.53%lo:domain                0.0.0.0:*           
LISTEN 0      4096               127.0.0.54:domain                0.0.0.0:*           
LISTEN 0      4096                127.0.0.1:37505                 0.0.0.0:*           
LISTEN 0      4096                        *:ssh                         *:*           
LISTEN 0      4096                        *:6443                        *:*           
root@k8s-controller-01:/home/sre# 

root@k8s-controller-01:/home/sre# ps -ef | grep etcd
root        1373    1065 10 19:54 ?        00:04:23 kube-apiserver --advertise-address=192.168.1.105 --allow-privileged=true --authorization-mode=Node,RBAC --client-ca-file=/etc/kubernetes/pki/ca.crt --enable-admission-plugins=NodeRestriction --enable-bootstrap-token-auth=true --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt --etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key --etcd-servers=https://127.0.0.1:2379 --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key --requestheader-allowed-names=front-proxy-client --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --requestheader-extra-headers-prefix=X-Remote-Extra- --requestheader-group-headers=X-Remote-Group --requestheader-username-headers=X-Remote-User --secure-port=6443 --service-account-issuer=https://kubernetes.default.svc.cluster.local --service-account-key-file=/etc/kubernetes/pki/sa.pub --service-account-signing-key-file=/etc/kubernetes/pki/sa.key --service-cluster-ip-range=10.96.0.0/12 --tls-cert-file=/etc/kubernetes/pki/apiserver.crt --tls-private-key-file=/etc/kubernetes/pki/apiserver.key
root       15727   15248  0 20:38 pts/1    00:00:00 grep --color=auto etcd

