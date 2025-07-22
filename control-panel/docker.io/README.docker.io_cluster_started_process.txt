
sre@k8s-controller-01:~$ ps -ef | grep docker
root         943       1  0 17:28 ?        00:00:03 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
sre        15077    2104  0 21:56 pts/0    00:00:00 grep --color=auto docker

sre@k8s-controller-01:~$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; preset: enabled)
     Active: active (running) since Thu 2024-10-24 17:28:14 UTC; 4h 23min ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 943 (dockerd)
      Tasks: 9
     Memory: 94.6M (peak: 95.9M)
        CPU: 3.577s
     CGroup: /system.slice/docker.service
             └─943 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.080501065Z" level=info msg="Starting up"
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.084892051Z" level=info msg="detected 127.0.0.53 nameserver, assuming systemd>
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.234741280Z" level=info msg="[graphdriver] using prior storage driver: overla>
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.245667559Z" level=info msg="Loading containers: start."
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.710432525Z" level=info msg="Default bridge (docker0) is assigned with an IP >
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.808375796Z" level=info msg="Loading containers: done."
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.892033727Z" level=info msg="Docker daemon" commit=24.0.7-0ubuntu4.1 graphdri>
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.893622222Z" level=info msg="Daemon has completed initialization"
Oct 24 17:28:14 k8s-controller-01 systemd[1]: Started docker.service - Docker Application Container Engine.
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.954260065Z" level=info msg="API listen on /run/docker.sock"
sre@k8s-controller-01:~$ journalctl -xe --unit docker
~
Oct 24 17:28:13 k8s-controller-01 systemd[1]: Starting docker.service - Docker Application Container Engine...
░░ Subject: A start job for unit docker.service has begun execution
░░ Defined-By: systemd
░░ Support: http://www.ubuntu.com/support
░░ 
░░ A start job for unit docker.service has begun execution.
░░ 
░░ The job identifier is 145.
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.080501065Z" level=info msg="Starting up"
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.084892051Z" level=info msg="detected 127.0.0.53 nameserver, assuming systemd>
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.234741280Z" level=info msg="[graphdriver] using prior storage driver: overla>
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.245667559Z" level=info msg="Loading containers: start."
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.710432525Z" level=info msg="Default bridge (docker0) is assigned with an IP >
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.808375796Z" level=info msg="Loading containers: done."
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.892033727Z" level=info msg="Docker daemon" commit=24.0.7-0ubuntu4.1 graphdri>
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.893622222Z" level=info msg="Daemon has completed initialization"
Oct 24 17:28:14 k8s-controller-01 systemd[1]: Started docker.service - Docker Application Container Engine.
░░ Subject: A start job for unit docker.service has finished successfully
░░ Defined-By: systemd
░░ Support: http://www.ubuntu.com/support
░░ 
░░ A start job for unit docker.service has finished successfully.
░░ 
░░ The job identifier is 145.
Oct 24 17:28:14 k8s-controller-01 dockerd[943]: time="2024-10-24T17:28:14.954260065Z" level=info msg="API listen on /run/docker.sock"

sre@k8s-controller-01:~$ sudo docker version
Client:
 Version:           24.0.7
 API version:       1.43
 Go version:        go1.22.2
 Git commit:        24.0.7-0ubuntu4.1
 Built:             Fri Aug  9 02:33:20 2024
 OS/Arch:           linux/amd64
 Context:           default

Server:
 Engine:
  Version:          24.0.7
  API version:      1.43 (minimum version 1.12)
  Go version:       go1.22.2
  Git commit:       24.0.7-0ubuntu4.1
  Built:            Fri Aug  9 02:33:20 2024
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.7.12
  GitCommit:        
 runc:
  Version:          1.1.12-0ubuntu3.1
  GitCommit:        
 docker-init:
  Version:          0.19.0
  GitCommit:        

