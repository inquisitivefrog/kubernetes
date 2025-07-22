
etcd --advertise-client-urls=https://192.168.1.105:2379 
     --cert-file=/etc/kubernetes/pki/etcd/server.crt 
     --client-cert-auth=true 
     --data-dir=/var/lib/etcd 
     --experimental-initial-corrupt-check=true 
     --experimental-watch-progress-notify-interval=5s 
     --initial-advertise-peer-urls=https://192.168.1.105:2380 
     --initial-cluster=k8s-controller-01=https://192.168.1.105:2380 
     --key-file=/etc/kubernetes/pki/etcd/server.key 
     --listen-client-urls=https://127.0.0.1:2379,https://192.168.1.105:2379 
     --listen-metrics-urls=http://127.0.0.1:2381 
     --listen-peer-urls=https://192.168.1.105:2380 
     --name=k8s-controller-01 
     --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt 
     --peer-client-cert-auth=true 
     --peer-key-file=/etc/kubernetes/pki/etcd/peer.key 
     --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt 
     --snapshot-count=10000 
     --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt

