

sre@controller:~$ sudo vi /etc/udev/rules.d/90-flannel.rules
sre@controller:~$ sudo cat /etc/udev/rules.d/90-flannel.rules
SUBSYSTEM=="net", ACTION=="add|change|move", ENV{INTERFACE}=="flannel.1", RUN+="/usr/sbin/ethtool -K flannel.1 tx-checksum-ip-generic off"

sre@controller:~$ sudo /usr/sbin/ethtool -K flannel.1 tx-checksum-ip-generic off
[sudo] password for sre: 
Actual changes:
tx-checksum-ip-generic: off
tx-tcp-segmentation: off [not requested]
tx-tcp-ecn-segmentation: off [not requested]
tx-tcp-mangleid-segmentation: off [not requested]
tx-tcp6-segmentation: off [not requested]

https://github.com/flannel-io/flannel/blob/master/README.md

wget https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
kubectl apply -f kube-flannel.yml
https://github.com/flannel-io/flannel/blob/master/Documentation/troubleshooting.md

