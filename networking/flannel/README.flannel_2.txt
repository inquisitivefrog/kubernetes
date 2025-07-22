
sre@k8s-controller-01:~$ sudo vi /etc/udev/rules.d/90-flannel.rules
[sudo] password for sre: 
sre@k8s-controller-01:~$ sudo /usr/bin/ethtool -K flannel.1 tx-checksum-ip-generic off
sudo: /usr/bin/ethtool: command not found
sre@k8s-controller-01:~$ sudo apt-get ethtool
E: Invalid operation ethtool
sre@k8s-controller-01:~$ sudo apt-get install -y ethtool
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
ethtool is already the newest version (1:6.7-1build1).
ethtool set to manually installed.
0 upgraded, 0 newly installed, 0 to remove and 7 not upgraded.

sre@k8s-controller-01:~$ sudo /usr/sbin/ethtool -K flannel.1 tx-checksum-ip-generic off
netlink error: no device matches name (offset 24)
netlink error: No such device

sre@k8s-controller-01:~$ wget https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
--2024-11-04 21:09:56--  https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
Resolving github.com (github.com)... 140.82.116.4
Connecting to github.com (github.com)|140.82.116.4|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://github.com/flannel-io/flannel/releases/download/v0.26.0/kube-flannel.yml [following]
--2024-11-04 21:09:57--  https://github.com/flannel-io/flannel/releases/download/v0.26.0/kube-flannel.yml
Reusing existing connection to github.com:443.
HTTP request sent, awaiting response... 302 Found
Location: https://objects.githubusercontent.com/github-production-release-asset-2e65be/21704134/f07ae2c2-51ac-49ba-90db-485607015e43?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20241104%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241104T210957Z&X-Amz-Expires=300&X-Amz-Signature=f53617111b656cd6f2d453ea8a1c2dd5c4d034323854bebc2839997b204d99de&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Dkube-flannel.yml&response-content-type=application%2Foctet-stream [following]
--2024-11-04 21:09:57--  https://objects.githubusercontent.com/github-production-release-asset-2e65be/21704134/f07ae2c2-51ac-49ba-90db-485607015e43?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20241104%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241104T210957Z&X-Amz-Expires=300&X-Amz-Signature=f53617111b656cd6f2d453ea8a1c2dd5c4d034323854bebc2839997b204d99de&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Dkube-flannel.yml&response-content-type=application%2Foctet-stream
Resolving objects.githubusercontent.com (objects.githubusercontent.com)... 185.199.110.133, 185.199.108.133, 185.199.109.133, ...
Connecting to objects.githubusercontent.com (objects.githubusercontent.com)|185.199.110.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4406 (4.3K) [application/octet-stream]
Saving to: ‘kube-flannel.yml’

kube-flannel.yml                             100%[===========================================================================================>]   4.30K  --.-KB/s    in 0.01s   

2024-11-04 21:09:58 (441 KB/s) - ‘kube-flannel.yml’ saved [4406/4406]

sre@k8s-controller-01:~$ 
sre@k8s-controller-01:~$ kubectl apply -f kube-flannel.yml
namespace/kube-flannel created
serviceaccount/flannel created
clusterrole.rbac.authorization.k8s.io/flannel created
clusterrolebinding.rbac.authorization.k8s.io/flannel created
configmap/kube-flannel-cfg created
daemonset.apps/kube-flannel-ds created

