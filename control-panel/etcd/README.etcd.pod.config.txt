
sre@k8s-controller-01:~$ kubectl --namespace=kube-system get pods
NAME                                        READY   STATUS    RESTARTS        AGE
coredns-784d4fcc8d-7t49h                    1/1     Running   0               37m
coredns-784d4fcc8d-rbj59                    1/1     Running   0               37m
etcd-k8s-controller-01                      1/1     Running   29 (101m ago)   35d
kube-apiserver-k8s-controller-01            1/1     Running   29 (101m ago)   35d
kube-controller-manager-k8s-controller-01   1/1     Running   48 (101m ago)   35d
kube-proxy-9dj7f                            1/1     Running   13 (101m ago)   31d
kube-proxy-gghxc                            1/1     Running   0               86m
kube-proxy-vk8w5                            1/1     Running   15 (101m ago)   35d
kube-scheduler-k8s-controller-01            1/1     Running   51 (101m ago)   35d

sre@k8s-controller-01:~$ kubectl --namespace=kube-system get pod etcd-k8s-controller-01 -o yaml
apiVersion: v1
kind: Pod
metadata:
  annotations:
    kubeadm.kubernetes.io/etcd.advertise-client-urls: https://192.168.1.105:2379
    kubernetes.io/config.hash: 720e3565e5682bf94a59c2d4563d46f0
    kubernetes.io/config.mirror: 720e3565e5682bf94a59c2d4563d46f0
    kubernetes.io/config.seen: "2024-11-07T21:11:51.120893079Z"
    kubernetes.io/config.source: file
  creationTimestamp: "2024-11-07T21:11:51Z"
  labels:
    component: etcd
    tier: control-plane
  name: etcd-k8s-controller-01
  namespace: kube-system
  ownerReferences:
  - apiVersion: v1
    controller: true
    kind: Node
    name: k8s-controller-01
    uid: 01344374-fa8e-4b9e-8d71-a271bac59c21
  resourceVersion: "259975"
  uid: 8dc8da01-8bf6-4d5c-91ae-1616af971908
spec:
  containers:
  - command:
    - etcd
    - --advertise-client-urls=https://192.168.1.105:2379
    - --cert-file=/etc/kubernetes/pki/etcd/server.crt
    - --client-cert-auth=true
    - --data-dir=/var/lib/etcd
    - --experimental-initial-corrupt-check=true
    - --experimental-watch-progress-notify-interval=5s
    - --initial-advertise-peer-urls=https://192.168.1.105:2380
    - --initial-cluster=k8s-controller-01=https://192.168.1.105:2380
    - --key-file=/etc/kubernetes/pki/etcd/server.key
    - --listen-client-urls=https://127.0.0.1:2379,https://192.168.1.105:2379
    - --listen-metrics-urls=http://127.0.0.1:2381
    - --listen-peer-urls=https://192.168.1.105:2380
    - --name=k8s-controller-01
    - --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt
    - --peer-client-cert-auth=true
    - --peer-key-file=/etc/kubernetes/pki/etcd/peer.key
    - --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
    - --snapshot-count=10000
    - --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
    image: registry.k8s.io/etcd:3.5.15-0
    imagePullPolicy: IfNotPresent
    livenessProbe:
      failureThreshold: 8
      httpGet:
        host: 127.0.0.1
        path: /health?exclude=NOSPACE&serializable=true
        port: 2381
        scheme: HTTP
      initialDelaySeconds: 10
      periodSeconds: 10
      successThreshold: 1
      timeoutSeconds: 15
    name: etcd
    resources:
      requests:
        cpu: 100m
        memory: 100Mi
    startupProbe:
      failureThreshold: 24
      httpGet:
        host: 127.0.0.1
        path: /health?serializable=false
        port: 2381
        scheme: HTTP
      initialDelaySeconds: 10
      periodSeconds: 10
      successThreshold: 1
      timeoutSeconds: 15
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /var/lib/etcd
      name: etcd-data
    - mountPath: /etc/kubernetes/pki/etcd
      name: etcd-certs
  dnsPolicy: ClusterFirst
  enableServiceLinks: true
  hostNetwork: true
  nodeName: k8s-controller-01
  preemptionPolicy: PreemptLowerPriority
  priority: 2000001000
  priorityClassName: system-node-critical
  restartPolicy: Always
  schedulerName: default-scheduler
  securityContext:
    seccompProfile:
      type: RuntimeDefault
  terminationGracePeriodSeconds: 30
  tolerations:
  - effect: NoExecute
    operator: Exists
  volumes:
  - hostPath:
      path: /etc/kubernetes/pki/etcd
      type: DirectoryOrCreate
    name: etcd-certs
  - hostPath:
      path: /var/lib/etcd
      type: DirectoryOrCreate
    name: etcd-data
status:
  conditions:
  - lastProbeTime: null
    lastTransitionTime: "2024-12-12T22:16:52Z"
    status: "True"
    type: Initialized
  - lastProbeTime: null
    lastTransitionTime: "2024-12-12T22:17:06Z"
    status: "True"
    type: Ready
  - lastProbeTime: null
    lastTransitionTime: "2024-12-12T22:17:06Z"
    status: "True"
    type: ContainersReady
  - lastProbeTime: null
    lastTransitionTime: "2024-12-12T22:16:52Z"
    status: "True"
    type: PodScheduled
  containerStatuses:
  - containerID: containerd://91b28df0afb87fbd96dedd3cfb80d52d503fc12efcdd463fd301fb6de8561c94
    image: registry.k8s.io/etcd:3.5.15-0
    imageID: registry.k8s.io/etcd@sha256:a6dc63e6e8cfa0307d7851762fa6b629afb18f28d8aa3fab5a6e91b4af60026a
    lastState:
      terminated:
        containerID: containerd://ba2b7410db3d5585e7b15c31cfcd42887fde6dfe15f7dca03e6a983c6da1f560
        exitCode: 255
        finishedAt: "2024-12-12T22:16:41Z"
        reason: Unknown
        startedAt: "2024-12-12T21:32:37Z"
    name: etcd
    ready: true
    restartCount: 29
    started: true
    state:
      running:
        startedAt: "2024-12-12T22:16:53Z"
  hostIP: 192.168.1.105
  phase: Running
  podIP: 192.168.1.105
  podIPs:
  - ip: 192.168.1.105
  qosClass: Burstable
  startTime: "2024-12-12T22:16:52Z"
sre@k8s-controller-01:~$ 

