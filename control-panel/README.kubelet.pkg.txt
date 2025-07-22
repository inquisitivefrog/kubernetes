
sre@k8s-controller-01:~$ dpkg -l | grep kubelet
hi  kubelet                              1.28.14-2.1                             amd64        Node agent for Kubernetes clusters
sre@k8s-controller-01:~$ find /var/lib/dpkg/ -print | grep kubelet
/var/lib/dpkg/info/kubelet.postrm
/var/lib/dpkg/info/kubelet.list
/var/lib/dpkg/info/kubelet.md5sums
/var/lib/dpkg/info/kubelet.postinst
/var/lib/dpkg/info/kubelet.prerm
/var/lib/dpkg/info/kubelet.conffiles
sre@k8s-controller-01:~$ cat /var/lib/dpkg/info/kubelet.postrm
#!/bin/sh -e

systemctl daemon-reload >/dev/null 2>&1 || :
sre@k8s-controller-01:~$ cat /var/lib/dpkg/info/kubelet.list
/.
/etc
/etc/default
/etc/default/kubelet
/etc/kubernetes
/etc/kubernetes/manifests
/etc/kubernetes/manifests/.kubelet-keep
/lib
/lib/systemd
/lib/systemd/system
/lib/systemd/system/kubelet.service
/usr
/usr/bin
/usr/bin/kubelet
/usr/share
/usr/share/doc
/usr/share/doc/kubelet
/usr/share/doc/kubelet/LICENSE
/usr/share/doc/kubelet/README.md
/var
/var/lib
/var/lib/kubelet
/var/lib/kubelet/.kubelet-keep
sre@k8s-controller-01:~$ cat /var/lib/dpkg/info/kubelet.md5sums
9ba5cd2e9a1e368fa51e13f1dd6a5ec1  etc/default/kubelet
d41d8cd98f00b204e9800998ecf8427e  etc/kubernetes/manifests/.kubelet-keep
0eb7a8b1f4574ce2afd128a123471785  lib/systemd/system/kubelet.service
f1d8de069f4bd70e01909ffcdaefc9dc  usr/bin/kubelet
f50f475573787dbce265247c193216fe  usr/share/doc/kubelet/LICENSE
5c7c4b50ca946b65de1aa374b2fd1cec  usr/share/doc/kubelet/README.md
d41d8cd98f00b204e9800998ecf8427e  var/lib/kubelet/.kubelet-keep
sre@k8s-controller-01:~$ cat /var/lib/dpkg/info/kubelet.postinst
#!/bin/sh -e

if [ "$1" = "configure" ] ; then
        # Initial installation
        systemctl preset kubelet.service >/dev/null 2>&1 || :
fi
sre@k8s-controller-01:~$ cat /var/lib/dpkg/info/kubelet.prerm
#!/bin/sh -e

if [ "$1" = "remove" ] || [ "$1" = "purge" ]; then
        # Package removal, not upgrade
        systemctl --no-reload disable kubelet.service > /dev/null 2>&1 || :
        systemctl stop kubelet.service > /dev/null 2>&1 || :
fi
sre@k8s-controller-01:~$ cat /var/lib/dpkg/info/kubelet.conffiles
/etc/default/kubelet

sre@k8s-controller-01:~$ sudo find /etc/kubernetes/
/etc/kubernetes/
/etc/kubernetes/manifests
/etc/kubernetes/manifests/.kubelet-keep

sre@k8s-controller-01:~$ grep kub /etc/passwd
sre@k8s-controller-01:~$ grep kub /etc/group
sre@k8s-controller-01:~$ 

