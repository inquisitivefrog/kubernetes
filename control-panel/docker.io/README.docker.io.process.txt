
sre@k8s-controller-01:~$ ps -ef | grep docker
root         943       1  0 17:28 ?        00:00:02 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
sre        13032    2104  0 21:14 pts/0    00:00:00 grep --color=auto docker

sre@k8s-controller-01:~$ systemctl status docker
● docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; preset: enabled)
     Active: active (running) since Thu 2024-10-24 17:28:14 UTC; 3h 46min ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 943 (dockerd)
      Tasks: 9
     Memory: 94.5M (peak: 95.9M)
        CPU: 3.209s
     CGroup: /system.slice/docker.service
             └─943 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.080501065Z" level=info msg=">
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.084892051Z" level=info msg=">
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.234741280Z" level=info msg=">
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.245667559Z" level=info msg=">
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.710432525Z" level=info msg=">
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.808375796Z" level=info msg=">
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.892033727Z" level=info msg=">
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.893622222Z" level=info msg=">
Oct 24 17:28:14 k8s-controller-01 systemd[1]: Started docker.service - Docker Application Container En>
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.954260065Z" level=info msg=">
sre@k8s-controller-01:~$ 

sre@k8s-controller-01:~$ which docker
/usr/bin/docker
sre@k8s-controller-01:~$ docker version
Client:
 Version:           24.0.7
 API version:       1.43
 Go version:        go1.22.2
 Git commit:        24.0.7-0ubuntu4.1
 Built:             Fri Aug  9 02:33:20 2024
 OS/Arch:           linux/amd64
 Context:           default
permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/version": dial unix /var/run/docker.sock: connect: permission denied

