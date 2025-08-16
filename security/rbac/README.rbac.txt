
sre@k8s-controller01:~$ ls -ld /etc/kubernetes/manifests/kube-apiserver.yaml
-rw------- 1 root root 4090 Aug 15 17:11 /etc/kubernetes/manifests/kube-apiserver.yaml
sre@k8s-controller01:~$ sudo vi /etc/kubernetes/manifests/kube-apiserver.yaml
sre@k8s-controller01:~$ sudo grep advertise-address= /etc/kubernetes/manifests/kube-apiserver.yaml
    - --advertise-address=192.168.4.147
sre@k8s-controller01:~$ sudo grep authorization-mode /etc/kubernetes/manifests/kube-apiserver.yaml
    - --authorization-mode=Node,RBAC
sre@k8s-controller01:~$ sudo grep rbac.authorization /etc/kubernetes/manifests/kube-apiserver.yaml
    - --runtime-config=rbac.authorization.k8s.io/v1
sre@k8s-controller01:~$ 
sre@k8s-controller01:~$ kubectl get pods -n kube-system | grep kube-apiserver
kube-apiserver-k8s-controller01            1/1     Running   0               118s

sre@k8s-controller01:~$ kubectl logs kube-apiserver-k8s-controller01 --namespace kube-system 
W0816 00:12:18.038782       1 lease.go:265] Resetting endpoints for master service "kubernetes" to [192.168.4.147]
I0816 00:12:18.039341       1 controller.go:615] quota admission added evaluator for: endpoints
I0816 00:12:18.042035       1 controller.go:615] quota admission added evaluator for: endpointslices.discovery.k8s.io


sre@k8s-controller01:~$ kubectl describe pod kube-apiserver-k8s-controller01 --namespace kube-system 
Name:                 kube-apiserver-k8s-controller01
Namespace:            kube-system
Priority:             2000001000
Priority Class Name:  system-node-critical
Node:                 k8s-controller01/192.168.4.147
Start Time:           Fri, 15 Aug 2025 16:49:46 -0700
Labels:               component=kube-apiserver
                      tier=control-plane
Annotations:          kubeadm.kubernetes.io/kube-apiserver.advertise-address.endpoint: 192.168.4.147:6443
                      kubernetes.io/config.hash: 67af7dc692e36aa0e2e233c13bd606d2
                      kubernetes.io/config.mirror: 67af7dc692e36aa0e2e233c13bd606d2
                      kubernetes.io/config.seen: 2025-08-15T17:12:05.288362174-07:00
                      kubernetes.io/config.source: file
Status:               Running
SeccompProfile:       RuntimeDefault
IP:                   192.168.4.147
IPs:
  IP:           192.168.4.147
Controlled By:  Node/k8s-controller01
Containers:
  kube-apiserver:
    Container ID:  containerd://90a3fa0fc392dfcf683f901d7ac85adec551494287260296619ada40b4503de4
    Image:         registry.k8s.io/kube-apiserver:v1.30.14
    Image ID:      registry.k8s.io/kube-apiserver@sha256:be079fe85d6b6804b89ab4fdd6a35cd56341e99ea809881cfe37962f440dc1be
    Port:          <none>
    Host Port:     <none>
    Command:
      kube-apiserver
      --advertise-address=192.168.4.147
      --allow-privileged=true
      --authorization-mode=Node,RBAC
      --client-ca-file=/etc/kubernetes/pki/ca.crt
      --enable-admission-plugins=NodeRestriction
      --enable-bootstrap-token-auth=true
      --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt
      --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt
      --etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key
      --etcd-servers=https://127.0.0.1:2379
      --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt
      --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key
      --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
      --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt
      --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key
      --requestheader-allowed-names=front-proxy-client
      --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt
      --requestheader-extra-headers-prefix=X-Remote-Extra-
      --requestheader-group-headers=X-Remote-Group
      --requestheader-username-headers=X-Remote-User
      --runtime-config=rbac.authorization.k8s.io/v1
      --secure-port=6443
      --service-account-issuer=https://kubernetes.default.svc.cluster.local
      --service-account-key-file=/etc/kubernetes/pki/sa.pub
      --service-account-signing-key-file=/etc/kubernetes/pki/sa.key
      --service-cluster-ip-range=10.96.0.0/12
      --tls-cert-file=/etc/kubernetes/pki/apiserver.crt
      --tls-private-key-file=/etc/kubernetes/pki/apiserver.key
    State:          Running
      Started:      Fri, 15 Aug 2025 17:12:16 -0700
    Ready:          True
    Restart Count:  0
    Requests:
      cpu:        250m
    Liveness:     http-get https://192.168.4.147:6443/livez delay=10s timeout=15s period=10s #success=1 #failure=8
    Readiness:    http-get https://192.168.4.147:6443/readyz delay=0s timeout=15s period=1s #success=1 #failure=3
    Startup:      http-get https://192.168.4.147:6443/livez delay=10s timeout=15s period=10s #success=1 #failure=24
    Environment:  <none>
    Mounts:
      /etc/ca-certificates from etc-ca-certificates (ro)
      /etc/kubernetes/pki from k8s-certs (ro)
      /etc/pki from etc-pki (ro)
      /etc/ssl/certs from ca-certs (ro)
      /usr/local/share/ca-certificates from usr-local-share-ca-certificates (ro)
      /usr/share/ca-certificates from usr-share-ca-certificates (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  ca-certs:
    Type:          HostPath (bare host directory volume)
    Path:          /etc/ssl/certs
    HostPathType:  DirectoryOrCreate
  etc-ca-certificates:
    Type:          HostPath (bare host directory volume)
    Path:          /etc/ca-certificates
    HostPathType:  DirectoryOrCreate
  etc-pki:
    Type:          HostPath (bare host directory volume)
    Path:          /etc/pki
    HostPathType:  DirectoryOrCreate
  k8s-certs:
    Type:          HostPath (bare host directory volume)
    Path:          /etc/kubernetes/pki
    HostPathType:  DirectoryOrCreate
  usr-local-share-ca-certificates:
    Type:          HostPath (bare host directory volume)
    Path:          /usr/local/share/ca-certificates
    HostPathType:  DirectoryOrCreate
  usr-share-ca-certificates:
    Type:          HostPath (bare host directory volume)
    Path:          /usr/share/ca-certificates
    HostPathType:  DirectoryOrCreate
QoS Class:         Burstable
Node-Selectors:    <none>
Tolerations:       :NoExecute op=Exists
Events:
  Type    Reason   Age   From     Message
  ----    ------   ----  ----     -------
  Normal  Pulled   9m2s  kubelet  Container image "registry.k8s.io/kube-apiserver:v1.30.14" already present on machine
  Normal  Created  9m2s  kubelet  Created container: kube-apiserver
  Normal  Started  9m2s  kubelet  Started container kube-apiserver
sre@k8s-controller01:~$ 

sre@k8s-controller01:~$ kubectl auth can-i --list
Resources                                       Non-Resource URLs   Resource Names   Verbs
*.*                                             []                  []               [*]
                                                [*]                 []               [*]
selfsubjectreviews.authentication.k8s.io        []                  []               [create]
selfsubjectaccessreviews.authorization.k8s.io   []                  []               [create]
selfsubjectrulesreviews.authorization.k8s.io    []                  []               [create]
                                                [/api/*]            []               [get]
                                                [/api]              []               [get]
                                                [/apis/*]           []               [get]
                                                [/apis]             []               [get]
                                                [/healthz]          []               [get]
                                                [/healthz]          []               [get]
                                                [/livez]            []               [get]
                                                [/livez]            []               [get]
                                                [/openapi/*]        []               [get]
                                                [/openapi]          []               [get]
                                                [/readyz]           []               [get]
                                                [/readyz]           []               [get]
                                                [/version/]         []               [get]
                                                [/version/]         []               [get]
                                                [/version]          []               [get]
                                                [/version]          []               [get]


sre@k8s-controller01:~$ sudo adduser develop
info: Adding user `develop' ...
info: Selecting UID/GID from range 1000 to 59999 ...
info: Adding new group `develop' (1001) ...
info: Adding new user `develop' (1001) with group `develop (1001)' ...
info: Creating home directory `/home/develop' ...
info: Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for develop
Enter the new value, or press ENTER for the default
	Full Name []: Honest Developer
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] y
info: Adding new user `develop' to supplemental / extra groups `users' ...
info: Adding user `develop' to group `users' ...
sre@k8s-controller01:~$ sudo adduser qa
info: Adding user `qa' ...
info: Selecting UID/GID from range 1000 to 59999 ...
info: Adding new group `qa' (1002) ...
info: Adding new user `qa' (1002) with group `qa (1002)' ...
info: Creating home directory `/home/qa' ...
info: Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for qa
Enter the new value, or press ENTER for the default
	Full Name []: You Break It You Buy It
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] y
info: Adding new user `qa' to supplemental / extra groups `users' ...
info: Adding user `qa' to group `users' ...

sre@k8s-controller01:~$ grep -i 'sre\|develop\|qa' /etc/passwd
sre:x:1000:1000:sre:/home/sre:/bin/bash
develop:x:1001:1001:Honest Developer,,,:/home/develop:/bin/bash
qa:x:1002:1002:You Break It You Buy It,,,:/home/qa:/bin/bash
sre@k8s-controller01:~$ grep -i 'sre\|develop\|qa' /etc/group
sudo:x:27:sre
users:x:100:develop,qa
sre:x:1000:
develop:x:1001:
qa:x:1002:
sre@k8s-controller01:~$ id develop
uid=1001(develop) gid=1001(develop) groups=1001(develop),100(users)
sre@k8s-controller01:~$ id qa
uid=1002(qa) gid=1002(qa) groups=1002(qa),100(users)


sre@k8s-controller01:~$ ls -l /home
total 12
drwxr-x--- 2 develop develop 4096 Aug 15 17:25 develop
drwxr-x--- 2 qa      qa      4096 Aug 15 17:26 qa
drwxr-x--- 5 sre     sre     4096 Aug 15 17:06 sre

sre@k8s-controller01:~/k8s$ vi develop-rbac.yaml
sre@k8s-controller01:~/k8s$ cat develop-rbac.yaml 
# develop-rbac.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: developer-role
  namespace: dev
rules:
- apiGroups: ["", "apps"]
  resources: ["pods", "deployments", "services"]
  verbs: ["*"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: develop-rolebinding
  namespace: dev
subjects:
- kind: User
  name: develop
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: developer-role
  apiGroup: rbac.authorization.k8s.io
sre@k8s-controller01:~/k8s$ 
sre@k8s-controller01:~/k8s$ kubectl apply -f develop-rbac.yaml
role.rbac.authorization.k8s.io/developer-role created
rolebinding.rbac.authorization.k8s.io/develop-rolebinding created

sre@k8s-controller01:~/k8s$ vi qa-rbac.yaml
sre@k8s-controller01:~/k8s$ cat qa-rbac.yaml 
# qa-rbac.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: qa-viewer
rules:
- apiGroups: [""] # "" indicates the core API group
  resources: ["pods", "services", "namespaces", "nodes"]
  verbs: ["get", "list", "watch"]
- apiGroups: ["apps"]
  resources: ["deployments", "statefulsets", "daemonsets"]
  verbs: ["get", "list", "watch"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: qa-viewer-binding
subjects:
- kind: User
  name: qa
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: qa-viewer
  apiGroup: rbac.authorization.k8s.io
sre@k8s-controller01:~/k8s$ kubectl apply -f qa-rbac.yaml 
clusterrole.rbac.authorization.k8s.io/qa-viewer created
clusterrolebinding.rbac.authorization.k8s.io/qa-viewer-binding created
sre@k8s-controller01:~/k8s$ 

sre@k8s-controller01:~/k8s$ kubectl auth can-i list pods --namespace dev --as develop
yes
sre@k8s-controller01:~/k8s$ kubectl auth can-i list pods --namespace default --as develop
no
sre@k8s-controller01:~/k8s$ kubectl auth can-i list pods --all-namespaces --as qa
yes
sre@k8s-controller01:~/k8s$ kubectl auth can-i delete pod my-pod --as qa
error: you must specify two arguments: verb resource or verb resource/resourceName.
See 'kubectl auth can-i -h' for help and examples.

sre@k8s-controller01:~/k8s$ mkdir ~/k8s-users && cd ~/k8s-users
sre@k8s-controller01:~/k8s-users$ openssl genrsa -out develop.key 2048
sre@k8s-controller01:~/k8s-users$ openssl req -new -key develop.key -out develop.csr -subj "/CN=develop"
sre@k8s-controller01:~/k8s-users$ openssl genrsa -out qa.key 2048
sre@k8s-controller01:~/k8s-users$ openssl req -new -key qa.key -out qa.csr -subj "/CN=qa"
sre@k8s-controller01:~/k8s-users$ ls -l
total 16
-rw-rw-r-- 1 sre sre  887 Aug 15 17:39 develop.csr
-rw------- 1 sre sre 1704 Aug 15 17:39 develop.key
-rw-rw-r-- 1 sre sre  883 Aug 15 17:39 qa.csr
-rw------- 1 sre sre 1704 Aug 15 17:39 qa.key
sre@k8s-controller01:~/k8s-users$ export DEVELOP_CSR=$(cat develop.csr | base64 -w 0)
sre@k8s-controller01:~/k8s-users$ export QA_CSR=$(cat qa.csr | base64 -w 0)
sre@k8s-controller01:~/k8s-users$ echo $DEVELOP_CSR
LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1Z6Q0NBVDhDQVFBd0VqRVFNQTRHQTFVRUF3d0haR1YyWld4dmNEQ0NBU0l3RFFZSktvWklodmNOQVFFQgpCUUFEZ2dFUEFEQ0NBUW9DZ2dFQkFNbHFxWGtwT3JGYnM0aHBIN3VLbnVkYjdReCtZSGEvYVVmYVZRNWlYWVNjCk51QWZuQmIxb1VoUXVHTXZmbUtsUlFCdk9USDNJTjZIYkptam85cmNhY052Q3Rzc0puMjcwUFVzdjJ3VFdLaGIKSHorVEZyZ3ptSklFR1lpY2pPeWRNaE1HVG5DRnI0WmU4UnZPUXpJc0VaNURCd3lrc3NZZHM3elhxZ0hZbzZZYgp0Z1ZDNlJyYndBeHVvSUo5T2hGZ0c4VEJSMS9RdTNhR0tnZnlQd0RhVC9wTjJGVjRDZExVRnR2ZHUwVXY1bmZVCnA0NEpVYXZQdFVBRkFkblkwbWZnQ2phWjNETFNTNXBiUUxlUzNvNFl0RndISDQ1Q3pXYS9ZNGM3YWtsRHBGdlUKcWdPWlkzTjJsZ3hhSWxnTEhheTBzWENsUnZuOEttL2g3Q0tiMm5iYkZOa0NBd0VBQWFBQU1BMEdDU3FHU0liMwpEUUVCQ3dVQUE0SUJBUUJNQUZGQlhNd2N3Q05VRVdTK1piRWRDdzAvWVZNRk8rRUdrVkpTcmE0RnM3YU1vbngwCnNtSVNzZDV3Q2k2aTMrV1EvaWJnWGZiTkJxQ2FyKyt4aEVZVUM5MTl5NUdDNTNDTVgrazJzVkttYlBsd1ZZMG4KSU9NeXdTZW9TQUNsRERuWDhnOU80cndsOHNOT3pPMHQrNGl2Q1FxdVczUkJTK2Q1OGhhS3VDMW9qaW1TTUFVKwpYOFl2QWd3b0E5TlpCTkxwYy9RQ1VmL3lQalZUZTNOTTNKNlBWWkJhbG9rR1JhUlY0aktXN1BxWTZJQ0xweU1kCnNYZWpwbXI1N0RrOWZoam5qSzcya3NsZHQ5Mlo4eUtGc3pYR3JtYW5WME41SjExVGtJeHRXYVo0Z0RRREdkbHoKUHloSEJxTXRVMjVhL0dZRWVNckF4TVI5R3o5Y0hJYTdRMUNYCi0tLS0tRU5EIENFUlRJRklDQVRFIFJFUVVFU1QtLS0tLQo=
sre@k8s-controller01:~/k8s-users$ echo $QA_CSR
LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1VqQ0NBVG9DQVFBd0RURUxNQWtHQTFVRUF3d0NjV0V3Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQgpEd0F3Z2dFS0FvSUJBUURHRUtUbTlCbXg0MnBkWU5zQkkrRFM3L24raW80K3p1YWF5UUtpS1N3S3YvcVJucmNNClpBSVlGbUVablYxWm9UdXJxMHIvd2dIL2VsRjhoV081ZWQreE9XK0dlTDBRc3JFL1dYZXh6R0c5V2lxR0J3dHkKZG1BVUk2aVVjcnJLNHFVTVgyWGd3bDU3NXFVRkNqdHRRVHU1cnI4Sm00bnlvdHpuWlIzZ0U2WC84RG9WQWFhRApvRzR1RHRQK21KWkRVUXZaZTNXUWdwWFJXbG0xV1YwV2dlSGh1ODBJcVJBV0RMRjR4WENVOW1NMGVQWjN0MDR2CjFhV2FwREUxSTI4Zk1JeXlWc00rSVJJTlFncnQyMXg0RHVKaFk1VDZzNGtjaHpFM0JKYis0aDcwajJmcVF0clUKYVhsMEFvUFVUNmJsVVJEWmh2Y2NWWWgrL0V6RjVlRzN4K2dEQWdNQkFBR2dBREFOQmdrcWhraUc5dzBCQVFzRgpBQU9DQVFFQWN5UXZ1MHI2L0l6Tk8xdmpNdnNZcnU2RlNvTGZ2d0ZpclZMbisvQ1grckFtb2I4eXhFMDFONXVaCjdPMUhjMWtUZ2hOeHJmeUQxL3N1MTFBdTRPVXJyYi80OXFuSWl2Z1h3OFU0QmFFVFAvWFBHeWh3V0NMOWlaRCsKYWFqL0pOd3ZodURRZUhVcUtYQmJBUDNiYUV6bWFOQi9Pa05KYURuZ1hlNS9XYUZnUkE5TVdRUGVFVFh6VStuRQowaEo3bDAwTjBTYVBzM3dSVUtlanE5MWkxaE5CVG0wMmtzajhEWlRJMTRtaHFVWEx2RFUxNmlrQWxDTk12T0k4CkNwdnRoZjl3Zkx5WjducFJEUy9mK3Q3dzRCaFdxc3BWK2d0bHhzRGM0d0w2d0RXcTRrTy80QkxBZmphS3VDOVUKSnZ4c0RWMlNzdXZXWHNMSDcrK3FVT3liODVTbzRnPT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUgUkVRVUVTVC0tLS0tCg==
sre@k8s-controller01:~/k8s-users$ cat <<EOF | kubectl apply -f -
> apiVersion: certificates.k8s.io/v1
> kind: CertificateSigningRequest
> metadata:
>   name: develop-csr
> spec:
>   request: ${DEVELOP_CSR}
>   signerName: kubernetes.io/kube-apiserver-client
>   usages:
>   - digital signature
>   - key encipherment
>   - client auth
> EOF
certificatesigningrequest.certificates.k8s.io/develop-csr created
sre@k8s-controller01:~/k8s-users$ cat <<EOF | kubectl apply -f -
> apiVersion: certificates.k8s.io/v1
> kind: CertificateSigningRequest
> metadata:
>   name: qa-csr
> spec:
>   request: ${QA_CSR}
>   signerName: kubernetes.io/kube-apiserver-client
>   usages:
>   - digital signature
>   - key encipherment
>   - client auth
> EOF
certificatesigningrequest.certificates.k8s.io/qa-csr created

sre@k8s-controller01:~/k8s-users$ kubectl api-resources > resources.txt
sre@k8s-controller01:~/k8s-users$ grep cert resources.txt 
certificatesigningrequests          csr          certificates.k8s.io/v1            false        CertificateSigningRequest
sre@k8s-controller01:~/k8s-users$ kubectl get certificatesigningrequests
NAME          AGE     SIGNERNAME                                    REQUESTOR                      REQUESTEDDURATION   CONDITION
csr-f2n88     45m     kubernetes.io/kube-apiserver-client-kubelet   system:bootstrap:om575c        <none>              Approved,Issued
csr-h9mm2     55m     kubernetes.io/kube-apiserver-client-kubelet   system:node:k8s-controller01   <none>              Approved,Issued
csr-j7vfp     44m     kubernetes.io/kube-apiserver-client-kubelet   system:bootstrap:om575c        <none>              Approved,Issued
csr-nkdkb     45m     kubernetes.io/kube-apiserver-client-kubelet   system:bootstrap:om575c        <none>              Approved,Issued
develop-csr   3m31s   kubernetes.io/kube-apiserver-client           kubernetes-admin               <none>              Pending
qa-csr        2m15s   kubernetes.io/kube-apiserver-client           kubernetes-admin               <none>              Pending

sre@k8s-controller01:~/k8s-users$ kubectl certificate approve develop-csr qa-csr
certificatesigningrequest.certificates.k8s.io/develop-csr approved
certificatesigningrequest.certificates.k8s.io/qa-csr approved
sre@k8s-controller01:~/k8s-users$ kubectl get certificatesigningrequests
NAME          AGE     SIGNERNAME                                    REQUESTOR                      REQUESTEDDURATION   CONDITION
csr-f2n88     46m     kubernetes.io/kube-apiserver-client-kubelet   system:bootstrap:om575c        <none>              Approved,Issued
csr-h9mm2     55m     kubernetes.io/kube-apiserver-client-kubelet   system:node:k8s-controller01   <none>              Approved,Issued
csr-j7vfp     44m     kubernetes.io/kube-apiserver-client-kubelet   system:bootstrap:om575c        <none>              Approved,Issued
csr-nkdkb     45m     kubernetes.io/kube-apiserver-client-kubelet   system:bootstrap:om575c        <none>              Approved,Issued
develop-csr   4m7s    kubernetes.io/kube-apiserver-client           kubernetes-admin               <none>              Approved,Issued
qa-csr        2m51s   kubernetes.io/kube-apiserver-client           kubernetes-admin               <none>              Approved,Issued


sre@k8s-controller01:~/k8s-users$ kubectl get csr develop-csr -o jsonpath='{.status.certificate}' | base64 -d > develop.crt
sre@k8s-controller01:~/k8s-users$ kubectl get csr qa-csr -o jsonpath='{.status.certificate}' | base64 -d > qa.crt
sre@k8s-controller01:~/k8s-users$ ls -l
total 32
-rw-rw-r-- 1 sre sre 1111 Aug 15 17:46 develop.crt
-rw-rw-r-- 1 sre sre  887 Aug 15 17:39 develop.csr
-rw------- 1 sre sre 1704 Aug 15 17:39 develop.key
-rw-rw-r-- 1 sre sre 1103 Aug 15 17:46 qa.crt
-rw-rw-r-- 1 sre sre  883 Aug 15 17:39 qa.csr
-rw------- 1 sre sre 1704 Aug 15 17:39 qa.key

sre@k8s-controller01:~/k8s-users$ CLUSTER_NAME=$(kubectl config view --minify -o jsonpath='{.clusters[0].name}')
sre@k8s-controller01:~/k8s-users$ echo $CLUSTER_NAME
kubernetes
sre@k8s-controller01:~/k8s-users$ sudo ls -l /etc/kubernetes/pki/ca.crt
[sudo] password for sre: 
-rw-r--r-- 1 root root 1107 Aug 15 16:49 /etc/kubernetes/pki/ca.crt
sre@k8s-controller01:~/k8s-users$ CA_CERT_PATH="/etc/kubernetes/pki/ca.crt"
sre@k8s-controller01:~/k8s-users$ kubectl config set-cluster ${CLUSTER_NAME} --server=https://192.168.4.147:6443 --certificate-authority=${CA_CERT_PATH} --embed-certs=true --kubeconfig=develop.kubeconfig
Cluster "kubernetes" set.
sre@k8s-controller01:~/k8s-users$ kubectl config set-credentials develop --client-key=develop.key --client-certificate=develop.crt --embed-certs=true --kubeconfig=develop.kubeconfig
User "develop" set.
sre@k8s-controller01:~/k8s-users$ kubectl config set-context develop-context --cluster=${CLUSTER_NAME} --user=develop --kubeconfig=develop.kubeconfig
Context "develop-context" created.
sre@k8s-controller01:~/k8s-users$ kubectl config use-context develop-context --kubeconfig=develop.kubeconfig
Switched to context "develop-context".
sre@k8s-controller01:~/k8s-users$ 
sre@k8s-controller01:~/k8s-users$ kubectl config set-cluster ${CLUSTER_NAME} --server=https://192.168.4.147:6443 --certificate-authority=${CA_CERT_PATH} --embed-certs=true --kubeconfig=qa.kubeconfig
Cluster "kubernetes" set.
sre@k8s-controller01:~/k8s-users$ kubectl config set-credentials qa --client-key=qa.key --client-certificate=qa.crt --embed-certs=true --kubeconfig=qa.kubeconfig
User "qa" set.
sre@k8s-controller01:~/k8s-users$ kubectl config set-context qa-context --cluster=${CLUSTER_NAME} --user=qa --kubeconfig=qa.kubeconfig
Context "qa-context" created.
sre@k8s-controller01:~/k8s-users$ kubectl config use-context qa-context --kubeconfig=qa.kubeconfig
Switched to context "qa-context".


sre@k8s-controller01:~/k8s-users$ kubectl get namespaces
NAME              STATUS   AGE
default           Active   72m
dev               Active   29m
kube-flannel      Active   69m
kube-node-lease   Active   72m
kube-public       Active   72m
kube-system       Active   72m
sre@k8s-controller01:~/k8s-users$ kubectl auth can-i --list --namespace default --as develop
Resources                                       Non-Resource URLs   Resource Names   Verbs
selfsubjectreviews.authentication.k8s.io        []                  []               [create]
selfsubjectaccessreviews.authorization.k8s.io   []                  []               [create]
selfsubjectrulesreviews.authorization.k8s.io    []                  []               [create]
                                                [/api/*]            []               [get]
                                                [/api]              []               [get]
                                                [/apis/*]           []               [get]
                                                [/apis]             []               [get]
                                                [/healthz]          []               [get]
                                                [/healthz]          []               [get]
                                                [/livez]            []               [get]
                                                [/livez]            []               [get]
                                                [/openapi/*]        []               [get]
                                                [/openapi]          []               [get]
                                                [/readyz]           []               [get]
                                                [/readyz]           []               [get]
                                                [/version/]         []               [get]
                                                [/version/]         []               [get]
                                                [/version]          []               [get]
                                                [/version]          []               [get]
sre@k8s-controller01:~/k8s-users$ kubectl auth can-i --list --namespace default --as qa
Resources                                       Non-Resource URLs   Resource Names   Verbs
selfsubjectreviews.authentication.k8s.io        []                  []               [create]
selfsubjectaccessreviews.authorization.k8s.io   []                  []               [create]
selfsubjectrulesreviews.authorization.k8s.io    []                  []               [create]
namespaces                                      []                  []               [get list watch]
nodes                                           []                  []               [get list watch]
pods                                            []                  []               [get list watch]
services                                        []                  []               [get list watch]
daemonsets.apps                                 []                  []               [get list watch]
deployments.apps                                []                  []               [get list watch]
statefulsets.apps                               []                  []               [get list watch]
                                                [/api/*]            []               [get]
                                                [/api]              []               [get]
                                                [/apis/*]           []               [get]
                                                [/apis]             []               [get]
                                                [/healthz]          []               [get]
                                                [/healthz]          []               [get]
                                                [/livez]            []               [get]
                                                [/livez]            []               [get]
                                                [/openapi/*]        []               [get]
                                                [/openapi]          []               [get]
                                                [/readyz]           []               [get]
                                                [/readyz]           []               [get]
                                                [/version/]         []               [get]
                                                [/version/]         []               [get]
                                                [/version]          []               [get]
                                                [/version]          []               [get]
sre@k8s-controller01:~/k8s-users$ 

sre@k8s-controller01:~/k8s-users$ kubectl auth can-i --list --namespace dev --as develop
Resources                                       Non-Resource URLs   Resource Names   Verbs
deployments                                     []                  []               [*]
pods                                            []                  []               [*]
services                                        []                  []               [*]
deployments.apps                                []                  []               [*]
pods.apps                                       []                  []               [*]
services.apps                                   []                  []               [*]
selfsubjectreviews.authentication.k8s.io        []                  []               [create]
selfsubjectaccessreviews.authorization.k8s.io   []                  []               [create]
selfsubjectrulesreviews.authorization.k8s.io    []                  []               [create]
                                                [/api/*]            []               [get]
                                                [/api]              []               [get]
                                                [/apis/*]           []               [get]
                                                [/apis]             []               [get]
                                                [/healthz]          []               [get]
                                                [/healthz]          []               [get]
                                                [/livez]            []               [get]
                                                [/livez]            []               [get]
                                                [/openapi/*]        []               [get]
                                                [/openapi]          []               [get]
                                                [/readyz]           []               [get]
                                                [/readyz]           []               [get]
                                                [/version/]         []               [get]
                                                [/version/]         []               [get]
                                                [/version]          []               [get]
                                                [/version]          []               [get]
sre@k8s-controller01:~/k8s-users$ kubectl auth can-i --list --namespace dev --as qa
Resources                                       Non-Resource URLs   Resource Names   Verbs
selfsubjectreviews.authentication.k8s.io        []                  []               [create]
selfsubjectaccessreviews.authorization.k8s.io   []                  []               [create]
selfsubjectrulesreviews.authorization.k8s.io    []                  []               [create]
namespaces                                      []                  []               [get list watch]
nodes                                           []                  []               [get list watch]
pods                                            []                  []               [get list watch]
services                                        []                  []               [get list watch]
daemonsets.apps                                 []                  []               [get list watch]
deployments.apps                                []                  []               [get list watch]
statefulsets.apps                               []                  []               [get list watch]
                                                [/api/*]            []               [get]
                                                [/api]              []               [get]
                                                [/apis/*]           []               [get]
                                                [/apis]             []               [get]
                                                [/healthz]          []               [get]
                                                [/healthz]          []               [get]
                                                [/livez]            []               [get]
                                                [/livez]            []               [get]
                                                [/openapi/*]        []               [get]
                                                [/openapi]          []               [get]
                                                [/readyz]           []               [get]
                                                [/readyz]           []               [get]
                                                [/version/]         []               [get]
                                                [/version/]         []               [get]
                                                [/version]          []               [get]
                                                [/version]          []               [get]
sre@k8s-controller01:~/k8s-users$ 

sre@k8s-controller01:~/k8s$ su - develop
Password: 
develop@k8s-controller01:~$ cd
develop@k8s-controller01:~$ pwd
/home/develop
develop@k8s-controller01:~$ mkdir .kube
develop@k8s-controller01:~$ exit
logout
sre@k8s-controller01:~/k8s-users$ sudo cp develop.kubeconfig /home/develop/.kube/config
[sudo] password for sre: 
sre@k8s-controller01:~/k8s-users$ sudo chown develop:develop /home/develop/.kube/config
sre@k8s-controller01:~/k8s-users$ su - qa
Password: 
qa@k8s-controller01:~$ pwd
/home/qa
qa@k8s-controller01:~$ mkdir .kube
qa@k8s-controller01:~$ exit
logout
sre@k8s-controller01:~/k8s-users$ sudo cp qa.kubeconfig /home/qa/.kube/config
sre@k8s-controller01:~/k8s-users$ sudo chown qa:qa /home/qa/.kube/config
sre@k8s-controller01:~/k8s-users$ su - develop
Password: 
develop@k8s-controller01:~$ which kubectl
/usr/bin/kubectl
develop@k8s-controller01:~$ kubectl get pods --all-namespaces
Error from server (Forbidden): pods is forbidden: User "develop" cannot list resource "pods" in API group "" at the cluster scope
develop@k8s-controller01:~$ kubectl get nodes
Error from server (Forbidden): nodes is forbidden: User "develop" cannot list resource "nodes" in API group "" at the cluster scope
develop@k8s-controller01:~$ kubectl get pods --namespace dev
No resources found in dev namespace.
develop@k8s-controller01:~$ kubectl get pods --namespace default
Error from server (Forbidden): pods is forbidden: User "develop" cannot list resource "pods" in API group "" in the namespace "default"
develop@k8s-controller01:~$ 
develop@k8s-controller01:~$ exit
logout
sre@k8s-controller01:~/k8s-users$ su - qa
Password: 
qa@k8s-controller01:~$ which kubectl
/usr/bin/kubectl
qa@k8s-controller01:~$ kubectl get pods --all-namespaces
NAMESPACE      NAME                                       READY   STATUS    RESTARTS      AGE
kube-flannel   kube-flannel-ds-4rnvv                      1/1     Running   0             71m
kube-flannel   kube-flannel-ds-cd2tk                      1/1     Running   0             70m
kube-flannel   kube-flannel-ds-fr5xl                      1/1     Running   0             71m
kube-flannel   kube-flannel-ds-qk9p2                      1/1     Running   0             77m
kube-system    coredns-55cb58b774-22kk2                   1/1     Running   0             80m
kube-system    coredns-55cb58b774-dkwwm                   1/1     Running   0             80m
kube-system    etcd-k8s-controller01                      1/1     Running   0             80m
kube-system    kube-apiserver-k8s-controller01            1/1     Running   0             58m
kube-system    kube-controller-manager-k8s-controller01   1/1     Running   1 (58m ago)   80m
kube-system    kube-proxy-f58bq                           1/1     Running   0             71m
kube-system    kube-proxy-p4sfk                           1/1     Running   0             80m
kube-system    kube-proxy-pxj6m                           1/1     Running   0             70m
kube-system    kube-proxy-rljxs                           1/1     Running   0             71m
kube-system    kube-scheduler-k8s-controller01            1/1     Running   1 (58m ago)   80m
qa@k8s-controller01:~$ kubectl get nodes -o wide
NAME               STATUS   ROLES           AGE   VERSION    INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
k8s-controller01   Ready    control-plane   81m   v1.30.14   192.168.4.147   <none>        Ubuntu 24.04.3 LTS   6.8.0-71-generic   containerd://1.7.27
k8s-node01         Ready    <none>          71m   v1.30.14   192.168.4.148   <none>        Ubuntu 24.04.3 LTS   6.8.0-71-generic   containerd://1.7.27
k8s-node02         Ready    <none>          70m   v1.30.14   192.168.4.149   <none>        Ubuntu 24.04.3 LTS   6.8.0-71-generic   containerd://1.7.27
k8s-node03         Ready    <none>          71m   v1.30.14   192.168.4.150   <none>        Ubuntu 24.04.3 LTS   6.8.0-71-generic   containerd://1.7.27
qa@k8s-controller01:~$ exit
logout
sre@k8s-controller01:~/k8s-users$ 



