
sre@k8s-controller-01:~$ ps -ef | grep kube-proxy
root       14448   14398  0 21:24 ?        00:00:00 /usr/local/bin/kube-proxy --config=/var/lib/kube-proxy/config.conf --hostname-override=k8s-controller-01
sre        14974    2104  0 21:50 pts/0    00:00:00 grep --color=auto kube-proxy

sre@k8s-controller-01:~$ sudo cat /var/lib/kube-proxy/config.conf
cat: /var/lib/kube-proxy/config.conf: No such file or directory

