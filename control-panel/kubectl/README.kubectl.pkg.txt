
sre@k8s-controller-01:~$ dpkg -l | grep kubectl
hi  kubectl                              1.28.14-2.1                             amd64        Command-line utility for interacting with a Kubernetes cluster
sre@k8s-controller-01:~$ find /var/lib/dpkg/ -print | grep kubectl
/var/lib/dpkg/info/kubectl.md5sums
/var/lib/dpkg/info/kubectl.list
sre@k8s-controller-01:~$ sudo cat /var/lib/dpkg/info/kubectl.md5sums
aca911ce1c96526fd705498743636831  usr/bin/kubectl
f50f475573787dbce265247c193216fe  usr/share/doc/kubectl/LICENSE
5c7c4b50ca946b65de1aa374b2fd1cec  usr/share/doc/kubectl/README.md
sre@k8s-controller-01:~$ sudo cat /var/lib/dpkg/info/kubectl.list
/.
/usr
/usr/bin
/usr/bin/kubectl
/usr/share
/usr/share/doc
/usr/share/doc/kubectl
/usr/share/doc/kubectl/LICENSE
/usr/share/doc/kubectl/README.md

