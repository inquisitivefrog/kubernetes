
sre@k8s-controller-01:~$ ps -ef | grep etcd
root        1363    1007  4 16:06 ?        00:06:31 etcd --advertise-client-urls=https://192.168.1.105:2379 --cert-file=/etc/kubernetes/pki/etcd/server.crt --client-cert-auth=true --data-dir=/var/lib/etcd --experimental-initial-corrupt-check=true --experimental-watch-progress-notify-interval=5s --initial-advertise-peer-urls=https://192.168.1.105:2380 --initial-cluster=k8s-controller-01=https://192.168.1.105:2380 --key-file=/etc/kubernetes/pki/etcd/server.key --listen-client-urls=https://127.0.0.1:2379,https://192.168.1.105:2379 --listen-metrics-urls=http://127.0.0.1:2381 --listen-peer-urls=https://192.168.1.105:2380 --name=k8s-controller-01 --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt --peer-client-cert-auth=true --peer-key-file=/etc/kubernetes/pki/etcd/peer.key --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt --snapshot-count=10000 --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt

sre@k8s-controller-01:~$ sudo mkdir /var/lib/etcd/backups

sre@k8s-controller-01:~$ ETCDCTL_API=3 sudo /home/sre/etcd/bin/etcdctl --endpoints=127.0.0.1:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/apiserver-etcd-client.crt --key /etc/kubernetes/pki/apiserver-etcd-client.key snapshot save /var/lib/etcd/backups/snapshot-20241025.db
{"level":"info","ts":"2024-10-25T18:47:56.974075Z","caller":"snapshot/v3_snapshot.go:65","msg":"created temporary db file","path":"/var/lib/etcd/backups/snapshot-20241025.db.part"}
{"level":"info","ts":"2024-10-25T18:47:56.985988Z","logger":"client","caller":"v3@v3.5.16/maintenance.go:212","msg":"opened snapshot stream; downloading"}
{"level":"info","ts":"2024-10-25T18:47:56.986184Z","caller":"snapshot/v3_snapshot.go:73","msg":"fetching snapshot","endpoint":"127.0.0.1:2379"}
{"level":"info","ts":"2024-10-25T18:47:57.030470Z","logger":"client","caller":"v3@v3.5.16/maintenance.go:220","msg":"completed snapshot read; closing"}
{"level":"info","ts":"2024-10-25T18:47:57.039439Z","caller":"snapshot/v3_snapshot.go:88","msg":"fetched snapshot","endpoint":"127.0.0.1:2379","size":"1.6 MB","took":"now"}
{"level":"info","ts":"2024-10-25T18:47:57.039696Z","caller":"snapshot/v3_snapshot.go:97","msg":"saved","path":"/var/lib/etcd/backups/snapshot-20241025.db"}
Snapshot saved at /var/lib/etcd/backups/snapshot-20241025.db

sre@k8s-controller-01:~$ sudo ls -l /var/lib/etcd/backups
total 1608
-rw------- 1 root root 1642528 Oct 25 18:47 snapshot-20241025.db

sre@k8s-controller-01:~$ sudo mkdir /var/lib/etcd/backups
sre@k8s-controller-01:~$ ETCDCTL_API=3 sudo /home/sre/etcd/bin/etcdctl --endpoints=127.0.0.1:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/apiserver-etcd-client.crt --key /etc/kubernetes/pki/apiserver-etcd-client.key snapshot save /var/lib/etcd/backups/snapshot-20241205.db
{"level":"info","ts":"2024-12-04T20:59:19.194577Z","caller":"snapshot/v3_snapshot.go:65","msg":"created temporary db file","path":"/var/lib/etcd/backups/snapshot-20241205.db.part"}
{"level":"info","ts":"2024-12-04T20:59:19.232867Z","logger":"client","caller":"v3@v3.5.16/maintenance.go:212","msg":"opened snapshot stream; downloading"}
{"level":"info","ts":"2024-12-04T20:59:19.233401Z","caller":"snapshot/v3_snapshot.go:73","msg":"fetching snapshot","endpoint":"127.0.0.1:2379"}
{"level":"info","ts":"2024-12-04T20:59:19.553637Z","logger":"client","caller":"v3@v3.5.16/maintenance.go:220","msg":"completed snapshot read; closing"}
{"level":"info","ts":"2024-12-04T20:59:19.584891Z","caller":"snapshot/v3_snapshot.go:88","msg":"fetched snapshot","endpoint":"127.0.0.1:2379","size":"6.1 MB","took":"now"}
{"level":"info","ts":"2024-12-04T20:59:19.585391Z","caller":"snapshot/v3_snapshot.go:97","msg":"saved","path":"/var/lib/etcd/backups/snapshot-20241205.db"}
Snapshot saved at /var/lib/etcd/backups/snapshot-20241205.db

sre@k8s-controller-01:~$ sudo ls -l /var/lib/etcd/backups/snapshot-20241205.db
-rw------- 1 root root 6062112 Dec  4 20:59 /var/lib/etcd/backups/snapshot-20241205.db

