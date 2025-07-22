
https://github.com/kubernetes-sigs/metrics-server#readme

sre@k8s-node-01:~$ ps -ef | grep kubelet
root         844       1  5 18:46 ?        00:00:30 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config=/var/lib/kubelet/config.yaml --container-runtime-endpoint=unix:///var/run/containerd/containerd.sock --pod-infra-container-image=registry.k8s.io/pause:3.9
sre         3599    3378  0 18:46 ?        00:00:05 /metrics-server --cert-dir=/tmp --secure-port=10250 --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname --kubelet-use-node-status-port --metric-resolution=15s --kubelet-insecure-tls

sre@k8s-node-01:~$ sudo bash
root@k8s-node-01:/home/sre# cat /etc/kubernetes/bootstrap-kubelet.conf
cat: /etc/kubernetes/bootstrap-kubelet.conf: No such file or directory
root@k8s-node-01:/home/sre# cat /etc/kubernetes/kubelet.conf 
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJTzB5dFdNb0tmcDB3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TkRFeE1EY3lNVEEyTXpoYUZ3MHpOREV4TURVeU1URXhNemhhTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUURFNEl6N1NxZWRQWFpWNjlrTitjZTJ1UCtreVhEc1k0aGkvVVRoTm9LV1pRUFFPb3RvM3Y5R1JEdEoKdDJkeEM0aUdnNGdiUDBGSkIvbi9HdUZDYllsQ3k1R1prNithNy9FK0xVYTNieFFVVDBSV2xLYVNzOEtaZGdSUApWV2lOYUFickhOS1hTLzh3ZU1TalNQcDh4TjRNSW16Yms3ZlVmQkYwcUo4Z3ZvSXNIeGN5TjBMd1YyOTB5QWdFCnEwOEZMWTFTZm1SaVFZSk1TdElncThTNGRyTzF6L3NsRDFDN2VTUHhGT2swc3pnSy8xRC9rVWQ4WkptRUNBMHcKbm11QzFzUDVpVFdqSWlSQnZjZlRudnJWVEZiUGtrZGs3R2pBQVJZampQWSs2ZDJaK1hTdVA5ZzdNL25Zb1NOOAowVDlxZEJ2YlVaWHhFS3RnRmtEeEZ2ZDlseUtYQWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJRZzFYL1d6SlZQakxydlZsMFN5ZWh2NkJVMUh6QVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRQkorUXJ6ejlsUwoycXFqL25EK3doTFdjUEZRSWoyL205NG1hdWZPa2V1M1RoRFdyektoQ0dwSmVEOFFtVVp3TXJCKys1Tmp4TmxGCnlhdnhxM2wwVkJhL2kxUDNieWduMnRHanlpUFFCSDROL0U3ZHpsNDRtZk9WZU9QNUN6Q3NUUW5QcTlDYzlRaEQKK042amRZWDZ0RG53S3JSZmMzY0FLY0NYL3NIcEVtTkl0WnJQNnY4N29PTml6cjhOQWxZMUYvMVhickhBeVZRYgpCVUZhbkhDQ2FQalViczUwTkdRa25ScWk3R3Yra3UrSEJrV0JLSXZjNlo4dFdmeGxSeXBtYTJKWXh0Q3N5VmZQCjBFQzkzYmVoVXl6VHQ4clMvdzlrQThqWk9rV01YMmhKcnBscklFcXRvcTJURUw2bmFqK0k3ZXVMTlRTYVg4bjQKbVlzb0VPMm84N3AyCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
    server: https://192.168.1.105:6443
  name: default-cluster
contexts:
- context:
    cluster: default-cluster
    namespace: default
    user: default-auth
  name: default-context
current-context: default-context
kind: Config
preferences: {}
users:
- name: default-auth
  user:
    client-certificate: /var/lib/kubelet/pki/kubelet-client-current.pem
    client-key: /var/lib/kubelet/pki/kubelet-client-current.pem
root@k8s-node-01:/home/sre# 

root@k8s-node-01:/home/sre# grep pem /etc/kubernetes/kubelet.conf 
    client-certificate: /var/lib/kubelet/pki/kubelet-client-current.pem
    client-key: /var/lib/kubelet/pki/kubelet-client-current.pem

root@k8s-node-01:/home/sre# openssl x509 -in /var/lib/kubelet/pki/kubelet-client-current.pem -text | grep 'CN\|Not'
        Issuer: CN = kubernetes
            Not Before: Nov  8 21:06:26 2024 GMT
            Not After : Nov  8 21:06:26 2025 GMT
        Subject: O = system:nodes, CN = system:node:k8s-node-01

