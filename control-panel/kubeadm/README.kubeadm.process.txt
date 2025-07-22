
sre@k8s-controller-01:~$ ps -ef | grep kubeadm
sre        12541    2104  0 21:06 pts/0    00:00:00 grep --color=auto kubeadm

sre@k8s-controller-01:~$ which kubeadm
/usr/bin/kubeadm

sre@k8s-controller-01:~$ kubeadm version
kubeadm version: &version.Info{Major:"1", Minor:"28", GitVersion:"v1.28.14", GitCommit:"66f3325d5562da565def802b8bacf431b082991d", GitTreeState:"clean", BuildDate:"2024-09-11T08:26:11Z", GoVersion:"go1.22.6", Compiler:"gc", Platform:"linux/amd64"}

