
sre@k8s-controller-01:~$ kubectl cluster-info
Kubernetes control plane is running at https://192.168.1.105:6443
CoreDNS is running at https://192.168.1.105:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
sre@k8s-controller-01:~$ kubectl cluster-info dump
{
    "kind": "NodeList",
    "apiVersion": "v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": [
        {
            "metadata": {
                "name": "k8s-controller-01",
                "uid": "fe8cecaa-e538-4cf7-bea3-bcabc3faee4a",
                "resourceVersion": "21855",
                "creationTimestamp": "2024-10-24T21:23:43Z",
                "labels": {
                    "beta.kubernetes.io/arch": "amd64",
                    "beta.kubernetes.io/os": "linux",
                    "kubernetes.io/arch": "amd64",
                    "kubernetes.io/hostname": "k8s-controller-01",
                    "kubernetes.io/os": "linux",
                    "node-role.kubernetes.io/control-plane": "",
                    "node.kubernetes.io/exclude-from-external-load-balancers": ""
                },
                "annotations": {
                    "kubeadm.alpha.kubernetes.io/cri-socket": "unix:///var/run/containerd/containerd.sock",
                    "node.alpha.kubernetes.io/ttl": "0",
                    "volumes.kubernetes.io/controller-managed-attach-detach": "true"
                }
            },
            "spec": {
                "podCIDR": "10.244.0.0/24",
                "podCIDRs": [
                    "10.244.0.0/24"
                ],
                "taints": [
                    {
                        "key": "node-role.kubernetes.io/control-plane",
                        "effect": "NoSchedule"
                    },
                    {
                        "key": "node.kubernetes.io/not-ready",
                        "effect": "NoSchedule"
                    }
                ]
            },
            "status": {
                "capacity": {
                    "cpu": "2",
                    "ephemeral-storage": "11758760Ki",
                    "hugepages-2Mi": "0",
                    "memory": "2015104Ki",
                    "pods": "110"
                },
                "allocatable": {
                    "cpu": "2",
                    "ephemeral-storage": "10836873199",
                    "hugepages-2Mi": "0",
                    "memory": "1912704Ki",
                    "pods": "110"
                },
                "conditions": [
                    {
                        "type": "MemoryPressure",
                        "status": "False",
                        "lastHeartbeatTime": "2024-10-25T17:53:23Z",
                        "lastTransitionTime": "2024-10-24T21:23:39Z",
                        "reason": "KubeletHasSufficientMemory",
                        "message": "kubelet has sufficient memory available"
                    },
                    {
                        "type": "DiskPressure",
                        "status": "False",
                        "lastHeartbeatTime": "2024-10-25T17:53:23Z",
                        "lastTransitionTime": "2024-10-24T21:23:39Z",
                        "reason": "KubeletHasNoDiskPressure",
                        "message": "kubelet has no disk pressure"
                    },
                    {
                        "type": "PIDPressure",
                        "status": "False",
                        "lastHeartbeatTime": "2024-10-25T17:53:23Z",
                        "lastTransitionTime": "2024-10-24T21:23:39Z",
                        "reason": "KubeletHasSufficientPID",
                        "message": "kubelet has sufficient PID available"
                    },
                    {
                        "type": "Ready",
                        "status": "False",
                        "lastHeartbeatTime": "2024-10-25T17:53:23Z",
                        "lastTransitionTime": "2024-10-24T21:23:39Z",
                        "reason": "KubeletNotReady",
                        "message": "container runtime network not ready: NetworkReady=false reason:NetworkPluginNotReady message:Network plugin returns error: cni plugin not initialized"
                    }
                ],
                "addresses": [
                    {
                        "type": "InternalIP",
                        "address": "192.168.1.105"
                    },
                    {
                        "type": "Hostname",
                        "address": "k8s-controller-01"
                    }
                ],
                "daemonEndpoints": {
                    "kubeletEndpoint": {
                        "Port": 10250
                    }
                },
                "nodeInfo": {
                    "machineID": "817698d76b7f497e8956e2e5836d079e",
                    "systemUUID": "ce208c27-5849-0f46-9cbc-90c7028d3efd",
                    "bootID": "8a4d9935-a08c-42d5-8ec0-325f499e0762",
                    "kernelVersion": "6.8.0-47-generic",
                    "osImage": "Ubuntu 24.04.1 LTS",
                    "containerRuntimeVersion": "containerd://1.7.12",
                    "kubeletVersion": "v1.28.14",
                    "kubeProxyVersion": "v1.28.14",
                    "operatingSystem": "linux",
                    "architecture": "amd64"
                },
                "images": [
                    {
                        "names": [
                            "registry.k8s.io/etcd@sha256:a6dc63e6e8cfa0307d7851762fa6b629afb18f28d8aa3fab5a6e91b4af60026a",
                            "registry.k8s.io/etcd:3.5.15-0"
                        ],
                        "sizeBytes": 56909194
                    },
                    {
                        "names": [
                            "registry.k8s.io/kube-apiserver@sha256:6dfa84f5d6be711ae0d19758201d337e836ab7de73306ff14725ceaa978fea8f",
                            "registry.k8s.io/kube-apiserver:v1.28.15"
                        ],
                        "sizeBytes": 34424787
                    },
                    {
                        "names": [
                            "registry.k8s.io/kube-controller-manager@sha256:dadd2a3784783018a7ee8588d11f787fee4d5424f2cdd6ce89d3ba1844a6c175",
                            "registry.k8s.io/kube-controller-manager:v1.28.15"
                        ],
                        "sizeBytes": 33305858
                    },
                    {
                        "names": [
                            "registry.k8s.io/kube-proxy@sha256:8e039a309ca0dc220e6d4350f78d96d1c4c76dd7444354a3ea6142a890ae8ae5",
                            "registry.k8s.io/kube-proxy:v1.28.15"
                        ],
                        "sizeBytes": 28311262
                    },
                    {
                        "names": [
                            "registry.k8s.io/kube-scheduler@sha256:82f4a42317450858d3d70fde5b3c0f22153ea155fd053f09865999a4661f2dca",
                            "registry.k8s.io/kube-scheduler:v1.28.15"
                        ],
                        "sizeBytes": 18544333
                    },
                    {
                        "names": [
                            "registry.k8s.io/coredns/coredns@sha256:a0ead06651cf580044aeb0a0feba63591858fb2e43ade8c9dea45a6a89ae7e5e",
                            "registry.k8s.io/coredns/coredns:v1.10.1"
                        ],
                        "sizeBytes": 16190758
                    },
                    {
                        "names": [
                            "registry.k8s.io/pause@sha256:7031c1b283388d2c2e09b57badb803c05ebed362dc88d84b480cc47f72a21097",
                            "registry.k8s.io/pause:3.9"
                        ],
                        "sizeBytes": 321520
                    },
                    {
                        "names": [
                            "registry.k8s.io/pause@sha256:9001185023633d17a2f98ff69b6ff2615b8ea02a825adffa40422f51dfdcde9d",
                            "registry.k8s.io/pause:3.8"
                        ],
                        "sizeBytes": 311286
                    }
                ]
            }
        }
    ]
}
{
    "kind": "EventList",
    "apiVersion": "v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": [
        {
            "metadata": {
                "name": "coredns-5dd5756b68-2zrhr.1801bdc416b3447a",
                "namespace": "kube-system",
                "uid": "5d09dddf-985c-4483-8d76-ad4cf7caee0e",
                "resourceVersion": "22087",
                "creationTimestamp": "2024-10-25T16:06:21Z"
            },
            "involvedObject": {
                "kind": "Pod",
                "namespace": "kube-system",
                "name": "coredns-5dd5756b68-2zrhr",
                "uid": "2c176363-9a3a-40d0-ab36-27f04a14dceb",
                "apiVersion": "v1",
                "resourceVersion": "394"
            },
            "reason": "FailedScheduling",
            "message": "0/1 nodes are available: 1 node(s) had untolerated taint {node.kubernetes.io/not-ready: }. preemption: 0/1 nodes are available: 1 Preemption is not helpful for scheduling..",
            "source": {
                "component": "default-scheduler"
            },
            "firstTimestamp": "2024-10-25T16:06:21Z",
            "lastTimestamp": "2024-10-25T17:56:23Z",
            "count": 23,
            "type": "Warning",
            "eventTime": null,
            "reportingComponent": "default-scheduler",
            "reportingInstance": ""
        },
        {
            "metadata": {
                "name": "coredns-5dd5756b68-wcs5x.1801bdc416b727d4",
                "namespace": "kube-system",
                "uid": "b5114958-925d-458c-ba21-b74f82e567f9",
                "resourceVersion": "22088",
                "creationTimestamp": "2024-10-25T16:06:21Z"
            },
            "involvedObject": {
                "kind": "Pod",
                "namespace": "kube-system",
                "name": "coredns-5dd5756b68-wcs5x",
                "uid": "60a77136-ed98-4a10-a01f-bb554631b9f4",
                "apiVersion": "v1",
                "resourceVersion": "398"
            },
            "reason": "FailedScheduling",
            "message": "0/1 nodes are available: 1 node(s) had untolerated taint {node.kubernetes.io/not-ready: }. preemption: 0/1 nodes are available: 1 Preemption is not helpful for scheduling..",
            "source": {
                "component": "default-scheduler"
            },
            "firstTimestamp": "2024-10-25T16:06:21Z",
            "lastTimestamp": "2024-10-25T17:56:23Z",
            "count": 23,
            "type": "Warning",
            "eventTime": null,
            "reportingComponent": "default-scheduler",
            "reportingInstance": ""
        }
    ]
}
{
    "kind": "ReplicationControllerList",
    "apiVersion": "v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": []
}
{
    "kind": "ServiceList",
    "apiVersion": "v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": [
        {
            "metadata": {
                "name": "kube-dns",
                "namespace": "kube-system",
                "uid": "8667b006-1a13-499f-876b-28f8908e47f3",
                "resourceVersion": "279",
                "creationTimestamp": "2024-10-24T21:23:48Z",
                "labels": {
                    "k8s-app": "kube-dns",
                    "kubernetes.io/cluster-service": "true",
                    "kubernetes.io/name": "CoreDNS"
                },
                "annotations": {
                    "prometheus.io/port": "9153",
                    "prometheus.io/scrape": "true"
                }
            },
            "spec": {
                "ports": [
                    {
                        "name": "dns",
                        "protocol": "UDP",
                        "port": 53,
                        "targetPort": 53
                    },
                    {
                        "name": "dns-tcp",
                        "protocol": "TCP",
                        "port": 53,
                        "targetPort": 53
                    },
                    {
                        "name": "metrics",
                        "protocol": "TCP",
                        "port": 9153,
                        "targetPort": 9153
                    }
                ],
                "selector": {
                    "k8s-app": "kube-dns"
                },
                "clusterIP": "10.96.0.10",
                "clusterIPs": [
                    "10.96.0.10"
                ],
                "type": "ClusterIP",
                "sessionAffinity": "None",
                "ipFamilies": [
                    "IPv4"
                ],
                "ipFamilyPolicy": "SingleStack",
                "internalTrafficPolicy": "Cluster"
            },
            "status": {
                "loadBalancer": {}
            }
        }
    ]
}
{
    "kind": "DaemonSetList",
    "apiVersion": "apps/v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": [
        {
            "metadata": {
                "name": "kube-proxy",
                "namespace": "kube-system",
                "uid": "10011c31-e359-45b5-b841-dcfc37baab96",
                "resourceVersion": "13523",
                "generation": 1,
                "creationTimestamp": "2024-10-24T21:23:48Z",
                "labels": {
                    "k8s-app": "kube-proxy"
                },
                "annotations": {
                    "deprecated.daemonset.template.generation": "1"
                }
            },
            "spec": {
                "selector": {
                    "matchLabels": {
                        "k8s-app": "kube-proxy"
                    }
                },
                "template": {
                    "metadata": {
                        "creationTimestamp": null,
                        "labels": {
                            "k8s-app": "kube-proxy"
                        }
                    },
                    "spec": {
                        "volumes": [
                            {
                                "name": "kube-proxy",
                                "configMap": {
                                    "name": "kube-proxy",
                                    "defaultMode": 420
                                }
                            },
                            {
                                "name": "xtables-lock",
                                "hostPath": {
                                    "path": "/run/xtables.lock",
                                    "type": "FileOrCreate"
                                }
                            },
                            {
                                "name": "lib-modules",
                                "hostPath": {
                                    "path": "/lib/modules",
                                    "type": ""
                                }
                            }
                        ],
                        "containers": [
                            {
                                "name": "kube-proxy",
                                "image": "registry.k8s.io/kube-proxy:v1.28.15",
                                "command": [
                                    "/usr/local/bin/kube-proxy",
                                    "--config=/var/lib/kube-proxy/config.conf",
                                    "--hostname-override=$(NODE_NAME)"
                                ],
                                "env": [
                                    {
                                        "name": "NODE_NAME",
                                        "valueFrom": {
                                            "fieldRef": {
                                                "apiVersion": "v1",
                                                "fieldPath": "spec.nodeName"
                                            }
                                        }
                                    }
                                ],
                                "resources": {},
                                "volumeMounts": [
                                    {
                                        "name": "kube-proxy",
                                        "mountPath": "/var/lib/kube-proxy"
                                    },
                                    {
                                        "name": "xtables-lock",
                                        "mountPath": "/run/xtables.lock"
                                    },
                                    {
                                        "name": "lib-modules",
                                        "readOnly": true,
                                        "mountPath": "/lib/modules"
                                    }
                                ],
                                "terminationMessagePath": "/dev/termination-log",
                                "terminationMessagePolicy": "File",
                                "imagePullPolicy": "IfNotPresent",
                                "securityContext": {
                                    "privileged": true
                                }
                            }
                        ],
                        "restartPolicy": "Always",
                        "terminationGracePeriodSeconds": 30,
                        "dnsPolicy": "ClusterFirst",
                        "nodeSelector": {
                            "kubernetes.io/os": "linux"
                        },
                        "serviceAccountName": "kube-proxy",
                        "serviceAccount": "kube-proxy",
                        "hostNetwork": true,
                        "securityContext": {},
                        "schedulerName": "default-scheduler",
                        "tolerations": [
                            {
                                "operator": "Exists"
                            }
                        ],
                        "priorityClassName": "system-node-critical"
                    }
                },
                "updateStrategy": {
                    "type": "RollingUpdate",
                    "rollingUpdate": {
                        "maxUnavailable": 1,
                        "maxSurge": 0
                    }
                },
                "revisionHistoryLimit": 10
            },
            "status": {
                "currentNumberScheduled": 1,
                "numberMisscheduled": 0,
                "desiredNumberScheduled": 1,
                "numberReady": 1,
                "observedGeneration": 1,
                "updatedNumberScheduled": 1,
                "numberAvailable": 1
            }
        }
    ]
}
{
    "kind": "DeploymentList",
    "apiVersion": "apps/v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": [
        {
            "metadata": {
                "name": "coredns",
                "namespace": "kube-system",
                "uid": "507b9a20-e27b-418e-9428-577628dc4ee8",
                "resourceVersion": "1187",
                "generation": 1,
                "creationTimestamp": "2024-10-24T21:23:48Z",
                "labels": {
                    "k8s-app": "kube-dns"
                },
                "annotations": {
                    "deployment.kubernetes.io/revision": "1"
                }
            },
            "spec": {
                "replicas": 2,
                "selector": {
                    "matchLabels": {
                        "k8s-app": "kube-dns"
                    }
                },
                "template": {
                    "metadata": {
                        "creationTimestamp": null,
                        "labels": {
                            "k8s-app": "kube-dns"
                        }
                    },
                    "spec": {
                        "volumes": [
                            {
                                "name": "config-volume",
                                "configMap": {
                                    "name": "coredns",
                                    "items": [
                                        {
                                            "key": "Corefile",
                                            "path": "Corefile"
                                        }
                                    ],
                                    "defaultMode": 420
                                }
                            }
                        ],
                        "containers": [
                            {
                                "name": "coredns",
                                "image": "registry.k8s.io/coredns/coredns:v1.10.1",
                                "args": [
                                    "-conf",
                                    "/etc/coredns/Corefile"
                                ],
                                "ports": [
                                    {
                                        "name": "dns",
                                        "containerPort": 53,
                                        "protocol": "UDP"
                                    },
                                    {
                                        "name": "dns-tcp",
                                        "containerPort": 53,
                                        "protocol": "TCP"
                                    },
                                    {
                                        "name": "metrics",
                                        "containerPort": 9153,
                                        "protocol": "TCP"
                                    }
                                ],
                                "resources": {
                                    "limits": {
                                        "memory": "170Mi"
                                    },
                                    "requests": {
                                        "cpu": "100m",
                                        "memory": "70Mi"
                                    }
                                },
                                "volumeMounts": [
                                    {
                                        "name": "config-volume",
                                        "readOnly": true,
                                        "mountPath": "/etc/coredns"
                                    }
                                ],
                                "livenessProbe": {
                                    "httpGet": {
                                        "path": "/health",
                                        "port": 8080,
                                        "scheme": "HTTP"
                                    },
                                    "initialDelaySeconds": 60,
                                    "timeoutSeconds": 5,
                                    "periodSeconds": 10,
                                    "successThreshold": 1,
                                    "failureThreshold": 5
                                },
                                "readinessProbe": {
                                    "httpGet": {
                                        "path": "/ready",
                                        "port": 8181,
                                        "scheme": "HTTP"
                                    },
                                    "timeoutSeconds": 1,
                                    "periodSeconds": 10,
                                    "successThreshold": 1,
                                    "failureThreshold": 3
                                },
                                "terminationMessagePath": "/dev/termination-log",
                                "terminationMessagePolicy": "File",
                                "imagePullPolicy": "IfNotPresent",
                                "securityContext": {
                                    "capabilities": {
                                        "add": [
                                            "NET_BIND_SERVICE"
                                        ],
                                        "drop": [
                                            "all"
                                        ]
                                    },
                                    "readOnlyRootFilesystem": true,
                                    "allowPrivilegeEscalation": false
                                }
                            }
                        ],
                        "restartPolicy": "Always",
                        "terminationGracePeriodSeconds": 30,
                        "dnsPolicy": "Default",
                        "nodeSelector": {
                            "kubernetes.io/os": "linux"
                        },
                        "serviceAccountName": "coredns",
                        "serviceAccount": "coredns",
                        "securityContext": {},
                        "affinity": {
                            "podAntiAffinity": {
                                "preferredDuringSchedulingIgnoredDuringExecution": [
                                    {
                                        "weight": 100,
                                        "podAffinityTerm": {
                                            "labelSelector": {
                                                "matchExpressions": [
                                                    {
                                                        "key": "k8s-app",
                                                        "operator": "In",
                                                        "values": [
                                                            "kube-dns"
                                                        ]
                                                    }
                                                ]
                                            },
                                            "topologyKey": "kubernetes.io/hostname"
                                        }
                                    }
                                ]
                            }
                        },
                        "schedulerName": "default-scheduler",
                        "tolerations": [
                            {
                                "key": "CriticalAddonsOnly",
                                "operator": "Exists"
                            },
                            {
                                "key": "node-role.kubernetes.io/control-plane",
                                "effect": "NoSchedule"
                            }
                        ],
                        "priorityClassName": "system-cluster-critical"
                    }
                },
                "strategy": {
                    "type": "RollingUpdate",
                    "rollingUpdate": {
                        "maxUnavailable": 1,
                        "maxSurge": "25%"
                    }
                },
                "revisionHistoryLimit": 10,
                "progressDeadlineSeconds": 600
            },
            "status": {
                "observedGeneration": 1,
                "replicas": 2,
                "updatedReplicas": 2,
                "unavailableReplicas": 2,
                "conditions": [
                    {
                        "type": "Available",
                        "status": "False",
                        "lastUpdateTime": "2024-10-24T21:24:01Z",
                        "lastTransitionTime": "2024-10-24T21:24:01Z",
                        "reason": "MinimumReplicasUnavailable",
                        "message": "Deployment does not have minimum availability."
                    },
                    {
                        "type": "Progressing",
                        "status": "False",
                        "lastUpdateTime": "2024-10-24T21:34:02Z",
                        "lastTransitionTime": "2024-10-24T21:34:02Z",
                        "reason": "ProgressDeadlineExceeded",
                        "message": "ReplicaSet \"coredns-5dd5756b68\" has timed out progressing."
                    }
                ]
            }
        }
    ]
}
{
    "kind": "ReplicaSetList",
    "apiVersion": "apps/v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": [
        {
            "metadata": {
                "name": "coredns-5dd5756b68",
                "namespace": "kube-system",
                "uid": "68e15cd8-b65d-4a69-a6e6-53e117b75051",
                "resourceVersion": "399",
                "generation": 1,
                "creationTimestamp": "2024-10-24T21:24:01Z",
                "labels": {
                    "k8s-app": "kube-dns",
                    "pod-template-hash": "5dd5756b68"
                },
                "annotations": {
                    "deployment.kubernetes.io/desired-replicas": "2",
                    "deployment.kubernetes.io/max-replicas": "3",
                    "deployment.kubernetes.io/revision": "1"
                },
                "ownerReferences": [
                    {
                        "apiVersion": "apps/v1",
                        "kind": "Deployment",
                        "name": "coredns",
                        "uid": "507b9a20-e27b-418e-9428-577628dc4ee8",
                        "controller": true,
                        "blockOwnerDeletion": true
                    }
                ]
            },
            "spec": {
                "replicas": 2,
                "selector": {
                    "matchLabels": {
                        "k8s-app": "kube-dns",
                        "pod-template-hash": "5dd5756b68"
                    }
                },
                "template": {
                    "metadata": {
                        "creationTimestamp": null,
                        "labels": {
                            "k8s-app": "kube-dns",
                            "pod-template-hash": "5dd5756b68"
                        }
                    },
                    "spec": {
                        "volumes": [
                            {
                                "name": "config-volume",
                                "configMap": {
                                    "name": "coredns",
                                    "items": [
                                        {
                                            "key": "Corefile",
                                            "path": "Corefile"
                                        }
                                    ],
                                    "defaultMode": 420
                                }
                            }
                        ],
                        "containers": [
                            {
                                "name": "coredns",
                                "image": "registry.k8s.io/coredns/coredns:v1.10.1",
                                "args": [
                                    "-conf",
                                    "/etc/coredns/Corefile"
                                ],
                                "ports": [
                                    {
                                        "name": "dns",
                                        "containerPort": 53,
                                        "protocol": "UDP"
                                    },
                                    {
                                        "name": "dns-tcp",
                                        "containerPort": 53,
                                        "protocol": "TCP"
                                    },
                                    {
                                        "name": "metrics",
                                        "containerPort": 9153,
                                        "protocol": "TCP"
                                    }
                                ],
                                "resources": {
                                    "limits": {
                                        "memory": "170Mi"
                                    },
                                    "requests": {
                                        "cpu": "100m",
                                        "memory": "70Mi"
                                    }
                                },
                                "volumeMounts": [
                                    {
                                        "name": "config-volume",
                                        "readOnly": true,
                                        "mountPath": "/etc/coredns"
                                    }
                                ],
                                "livenessProbe": {
                                    "httpGet": {
                                        "path": "/health",
                                        "port": 8080,
                                        "scheme": "HTTP"
                                    },
                                    "initialDelaySeconds": 60,
                                    "timeoutSeconds": 5,
                                    "periodSeconds": 10,
                                    "successThreshold": 1,
                                    "failureThreshold": 5
                                },
                                "readinessProbe": {
                                    "httpGet": {
                                        "path": "/ready",
                                        "port": 8181,
                                        "scheme": "HTTP"
                                    },
                                    "timeoutSeconds": 1,
                                    "periodSeconds": 10,
                                    "successThreshold": 1,
                                    "failureThreshold": 3
                                },
                                "terminationMessagePath": "/dev/termination-log",
                                "terminationMessagePolicy": "File",
                                "imagePullPolicy": "IfNotPresent",
                                "securityContext": {
                                    "capabilities": {
                                        "add": [
                                            "NET_BIND_SERVICE"
                                        ],
                                        "drop": [
                                            "all"
                                        ]
                                    },
                                    "readOnlyRootFilesystem": true,
                                    "allowPrivilegeEscalation": false
                                }
                            }
                        ],
                        "restartPolicy": "Always",
                        "terminationGracePeriodSeconds": 30,
                        "dnsPolicy": "Default",
                        "nodeSelector": {
                            "kubernetes.io/os": "linux"
                        },
                        "serviceAccountName": "coredns",
                        "serviceAccount": "coredns",
                        "securityContext": {},
                        "affinity": {
                            "podAntiAffinity": {
                                "preferredDuringSchedulingIgnoredDuringExecution": [
                                    {
                                        "weight": 100,
                                        "podAffinityTerm": {
                                            "labelSelector": {
                                                "matchExpressions": [
                                                    {
                                                        "key": "k8s-app",
                                                        "operator": "In",
                                                        "values": [
                                                            "kube-dns"
                                                        ]
                                                    }
                                                ]
                                            },
                                            "topologyKey": "kubernetes.io/hostname"
                                        }
                                    }
                                ]
                            }
                        },
                        "schedulerName": "default-scheduler",
                        "tolerations": [
                            {
                                "key": "CriticalAddonsOnly",
                                "operator": "Exists"
                            },
                            {
                                "key": "node-role.kubernetes.io/control-plane",
                                "effect": "NoSchedule"
                            }
                        ],
                        "priorityClassName": "system-cluster-critical"
                    }
                }
            },
            "status": {
                "replicas": 2,
                "fullyLabeledReplicas": 2,
                "observedGeneration": 1
            }
        }
    ]
}
{
    "kind": "PodList",
    "apiVersion": "v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": [
        {
            "metadata": {
                "name": "coredns-5dd5756b68-2zrhr",
                "generateName": "coredns-5dd5756b68-",
                "namespace": "kube-system",
                "uid": "2c176363-9a3a-40d0-ab36-27f04a14dceb",
                "resourceVersion": "394",
                "creationTimestamp": "2024-10-24T21:24:01Z",
                "labels": {
                    "k8s-app": "kube-dns",
                    "pod-template-hash": "5dd5756b68"
                },
                "ownerReferences": [
                    {
                        "apiVersion": "apps/v1",
                        "kind": "ReplicaSet",
                        "name": "coredns-5dd5756b68",
                        "uid": "68e15cd8-b65d-4a69-a6e6-53e117b75051",
                        "controller": true,
                        "blockOwnerDeletion": true
                    }
                ]
            },
            "spec": {
                "volumes": [
                    {
                        "name": "config-volume",
                        "configMap": {
                            "name": "coredns",
                            "items": [
                                {
                                    "key": "Corefile",
                                    "path": "Corefile"
                                }
                            ],
                            "defaultMode": 420
                        }
                    },
                    {
                        "name": "kube-api-access-kw8mg",
                        "projected": {
                            "sources": [
                                {
                                    "serviceAccountToken": {
                                        "expirationSeconds": 3607,
                                        "path": "token"
                                    }
                                },
                                {
                                    "configMap": {
                                        "name": "kube-root-ca.crt",
                                        "items": [
                                            {
                                                "key": "ca.crt",
                                                "path": "ca.crt"
                                            }
                                        ]
                                    }
                                },
                                {
                                    "downwardAPI": {
                                        "items": [
                                            {
                                                "path": "namespace",
                                                "fieldRef": {
                                                    "apiVersion": "v1",
                                                    "fieldPath": "metadata.namespace"
                                                }
                                            }
                                        ]
                                    }
                                }
                            ],
                            "defaultMode": 420
                        }
                    }
                ],
                "containers": [
                    {
                        "name": "coredns",
                        "image": "registry.k8s.io/coredns/coredns:v1.10.1",
                        "args": [
                            "-conf",
                            "/etc/coredns/Corefile"
                        ],
                        "ports": [
                            {
                                "name": "dns",
                                "containerPort": 53,
                                "protocol": "UDP"
                            },
                            {
                                "name": "dns-tcp",
                                "containerPort": 53,
                                "protocol": "TCP"
                            },
                            {
                                "name": "metrics",
                                "containerPort": 9153,
                                "protocol": "TCP"
                            }
                        ],
                        "resources": {
                            "limits": {
                                "memory": "170Mi"
                            },
                            "requests": {
                                "cpu": "100m",
                                "memory": "70Mi"
                            }
                        },
                        "volumeMounts": [
                            {
                                "name": "config-volume",
                                "readOnly": true,
                                "mountPath": "/etc/coredns"
                            },
                            {
                                "name": "kube-api-access-kw8mg",
                                "readOnly": true,
                                "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
                            }
                        ],
                        "livenessProbe": {
                            "httpGet": {
                                "path": "/health",
                                "port": 8080,
                                "scheme": "HTTP"
                            },
                            "initialDelaySeconds": 60,
                            "timeoutSeconds": 5,
                            "periodSeconds": 10,
                            "successThreshold": 1,
                            "failureThreshold": 5
                        },
                        "readinessProbe": {
                            "httpGet": {
                                "path": "/ready",
                                "port": 8181,
                                "scheme": "HTTP"
                            },
                            "timeoutSeconds": 1,
                            "periodSeconds": 10,
                            "successThreshold": 1,
                            "failureThreshold": 3
                        },
                        "terminationMessagePath": "/dev/termination-log",
                        "terminationMessagePolicy": "File",
                        "imagePullPolicy": "IfNotPresent",
                        "securityContext": {
                            "capabilities": {
                                "add": [
                                    "NET_BIND_SERVICE"
                                ],
                                "drop": [
                                    "all"
                                ]
                            },
                            "readOnlyRootFilesystem": true,
                            "allowPrivilegeEscalation": false
                        }
                    }
                ],
                "restartPolicy": "Always",
                "terminationGracePeriodSeconds": 30,
                "dnsPolicy": "Default",
                "nodeSelector": {
                    "kubernetes.io/os": "linux"
                },
                "serviceAccountName": "coredns",
                "serviceAccount": "coredns",
                "securityContext": {},
                "affinity": {
                    "podAntiAffinity": {
                        "preferredDuringSchedulingIgnoredDuringExecution": [
                            {
                                "weight": 100,
                                "podAffinityTerm": {
                                    "labelSelector": {
                                        "matchExpressions": [
                                            {
                                                "key": "k8s-app",
                                                "operator": "In",
                                                "values": [
                                                    "kube-dns"
                                                ]
                                            }
                                        ]
                                    },
                                    "topologyKey": "kubernetes.io/hostname"
                                }
                            }
                        ]
                    }
                },
                "schedulerName": "default-scheduler",
                "tolerations": [
                    {
                        "key": "CriticalAddonsOnly",
                        "operator": "Exists"
                    },
                    {
                        "key": "node-role.kubernetes.io/control-plane",
                        "effect": "NoSchedule"
                    },
                    {
                        "key": "node.kubernetes.io/not-ready",
                        "operator": "Exists",
                        "effect": "NoExecute",
                        "tolerationSeconds": 300
                    },
                    {
                        "key": "node.kubernetes.io/unreachable",
                        "operator": "Exists",
                        "effect": "NoExecute",
                        "tolerationSeconds": 300
                    }
                ],
                "priorityClassName": "system-cluster-critical",
                "priority": 2000000000,
                "enableServiceLinks": true,
                "preemptionPolicy": "PreemptLowerPriority"
            },
            "status": {
                "phase": "Pending",
                "conditions": [
                    {
                        "type": "PodScheduled",
                        "status": "False",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-24T21:24:01Z",
                        "reason": "Unschedulable",
                        "message": "0/1 nodes are available: 1 node(s) had untolerated taint {node.kubernetes.io/not-ready: }. preemption: 0/1 nodes are available: 1 Preemption is not helpful for scheduling.."
                    }
                ],
                "qosClass": "Burstable"
            }
        },
        {
            "metadata": {
                "name": "coredns-5dd5756b68-wcs5x",
                "generateName": "coredns-5dd5756b68-",
                "namespace": "kube-system",
                "uid": "60a77136-ed98-4a10-a01f-bb554631b9f4",
                "resourceVersion": "398",
                "creationTimestamp": "2024-10-24T21:24:01Z",
                "labels": {
                    "k8s-app": "kube-dns",
                    "pod-template-hash": "5dd5756b68"
                },
                "ownerReferences": [
                    {
                        "apiVersion": "apps/v1",
                        "kind": "ReplicaSet",
                        "name": "coredns-5dd5756b68",
                        "uid": "68e15cd8-b65d-4a69-a6e6-53e117b75051",
                        "controller": true,
                        "blockOwnerDeletion": true
                    }
                ]
            },
            "spec": {
                "volumes": [
                    {
                        "name": "config-volume",
                        "configMap": {
                            "name": "coredns",
                            "items": [
                                {
                                    "key": "Corefile",
                                    "path": "Corefile"
                                }
                            ],
                            "defaultMode": 420
                        }
                    },
                    {
                        "name": "kube-api-access-jbcvs",
                        "projected": {
                            "sources": [
                                {
                                    "serviceAccountToken": {
                                        "expirationSeconds": 3607,
                                        "path": "token"
                                    }
                                },
                                {
                                    "configMap": {
                                        "name": "kube-root-ca.crt",
                                        "items": [
                                            {
                                                "key": "ca.crt",
                                                "path": "ca.crt"
                                            }
                                        ]
                                    }
                                },
                                {
                                    "downwardAPI": {
                                        "items": [
                                            {
                                                "path": "namespace",
                                                "fieldRef": {
                                                    "apiVersion": "v1",
                                                    "fieldPath": "metadata.namespace"
                                                }
                                            }
                                        ]
                                    }
                                }
                            ],
                            "defaultMode": 420
                        }
                    }
                ],
                "containers": [
                    {
                        "name": "coredns",
                        "image": "registry.k8s.io/coredns/coredns:v1.10.1",
                        "args": [
                            "-conf",
                            "/etc/coredns/Corefile"
                        ],
                        "ports": [
                            {
                                "name": "dns",
                                "containerPort": 53,
                                "protocol": "UDP"
                            },
                            {
                                "name": "dns-tcp",
                                "containerPort": 53,
                                "protocol": "TCP"
                            },
                            {
                                "name": "metrics",
                                "containerPort": 9153,
                                "protocol": "TCP"
                            }
                        ],
                        "resources": {
                            "limits": {
                                "memory": "170Mi"
                            },
                            "requests": {
                                "cpu": "100m",
                                "memory": "70Mi"
                            }
                        },
                        "volumeMounts": [
                            {
                                "name": "config-volume",
                                "readOnly": true,
                                "mountPath": "/etc/coredns"
                            },
                            {
                                "name": "kube-api-access-jbcvs",
                                "readOnly": true,
                                "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
                            }
                        ],
                        "livenessProbe": {
                            "httpGet": {
                                "path": "/health",
                                "port": 8080,
                                "scheme": "HTTP"
                            },
                            "initialDelaySeconds": 60,
                            "timeoutSeconds": 5,
                            "periodSeconds": 10,
                            "successThreshold": 1,
                            "failureThreshold": 5
                        },
                        "readinessProbe": {
                            "httpGet": {
                                "path": "/ready",
                                "port": 8181,
                                "scheme": "HTTP"
                            },
                            "timeoutSeconds": 1,
                            "periodSeconds": 10,
                            "successThreshold": 1,
                            "failureThreshold": 3
                        },
                        "terminationMessagePath": "/dev/termination-log",
                        "terminationMessagePolicy": "File",
                        "imagePullPolicy": "IfNotPresent",
                        "securityContext": {
                            "capabilities": {
                                "add": [
                                    "NET_BIND_SERVICE"
                                ],
                                "drop": [
                                    "all"
                                ]
                            },
                            "readOnlyRootFilesystem": true,
                            "allowPrivilegeEscalation": false
                        }
                    }
                ],
                "restartPolicy": "Always",
                "terminationGracePeriodSeconds": 30,
                "dnsPolicy": "Default",
                "nodeSelector": {
                    "kubernetes.io/os": "linux"
                },
                "serviceAccountName": "coredns",
                "serviceAccount": "coredns",
                "securityContext": {},
                "affinity": {
                    "podAntiAffinity": {
                        "preferredDuringSchedulingIgnoredDuringExecution": [
                            {
                                "weight": 100,
                                "podAffinityTerm": {
                                    "labelSelector": {
                                        "matchExpressions": [
                                            {
                                                "key": "k8s-app",
                                                "operator": "In",
                                                "values": [
                                                    "kube-dns"
                                                ]
                                            }
                                        ]
                                    },
                                    "topologyKey": "kubernetes.io/hostname"
                                }
                            }
                        ]
                    }
                },
                "schedulerName": "default-scheduler",
                "tolerations": [
                    {
                        "key": "CriticalAddonsOnly",
                        "operator": "Exists"
                    },
                    {
                        "key": "node-role.kubernetes.io/control-plane",
                        "effect": "NoSchedule"
                    },
                    {
                        "key": "node.kubernetes.io/not-ready",
                        "operator": "Exists",
                        "effect": "NoExecute",
                        "tolerationSeconds": 300
                    },
                    {
                        "key": "node.kubernetes.io/unreachable",
                        "operator": "Exists",
                        "effect": "NoExecute",
                        "tolerationSeconds": 300
                    }
                ],
                "priorityClassName": "system-cluster-critical",
                "priority": 2000000000,
                "enableServiceLinks": true,
                "preemptionPolicy": "PreemptLowerPriority"
            },
            "status": {
                "phase": "Pending",
                "conditions": [
                    {
                        "type": "PodScheduled",
                        "status": "False",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-24T21:24:01Z",
                        "reason": "Unschedulable",
                        "message": "0/1 nodes are available: 1 node(s) had untolerated taint {node.kubernetes.io/not-ready: }. preemption: 0/1 nodes are available: 1 Preemption is not helpful for scheduling.."
                    }
                ],
                "qosClass": "Burstable"
            }
        },
        {
            "metadata": {
                "name": "etcd-k8s-controller-01",
                "namespace": "kube-system",
                "uid": "8e8fff2d-be18-4c30-9237-15081eb36a31",
                "resourceVersion": "13525",
                "creationTimestamp": "2024-10-24T21:23:49Z",
                "labels": {
                    "component": "etcd",
                    "tier": "control-plane"
                },
                "annotations": {
                    "kubeadm.kubernetes.io/etcd.advertise-client-urls": "https://192.168.1.105:2379",
                    "kubernetes.io/config.hash": "720e3565e5682bf94a59c2d4563d46f0",
                    "kubernetes.io/config.mirror": "720e3565e5682bf94a59c2d4563d46f0",
                    "kubernetes.io/config.seen": "2024-10-24T21:23:48.561417663Z",
                    "kubernetes.io/config.source": "file"
                },
                "ownerReferences": [
                    {
                        "apiVersion": "v1",
                        "kind": "Node",
                        "name": "k8s-controller-01",
                        "uid": "fe8cecaa-e538-4cf7-bea3-bcabc3faee4a",
                        "controller": true
                    }
                ]
            },
            "spec": {
                "volumes": [
                    {
                        "name": "etcd-certs",
                        "hostPath": {
                            "path": "/etc/kubernetes/pki/etcd",
                            "type": "DirectoryOrCreate"
                        }
                    },
                    {
                        "name": "etcd-data",
                        "hostPath": {
                            "path": "/var/lib/etcd",
                            "type": "DirectoryOrCreate"
                        }
                    }
                ],
                "containers": [
                    {
                        "name": "etcd",
                        "image": "registry.k8s.io/etcd:3.5.15-0",
                        "command": [
                            "etcd",
                            "--advertise-client-urls=https://192.168.1.105:2379",
                            "--cert-file=/etc/kubernetes/pki/etcd/server.crt",
                            "--client-cert-auth=true",
                            "--data-dir=/var/lib/etcd",
                            "--experimental-initial-corrupt-check=true",
                            "--experimental-watch-progress-notify-interval=5s",
                            "--initial-advertise-peer-urls=https://192.168.1.105:2380",
                            "--initial-cluster=k8s-controller-01=https://192.168.1.105:2380",
                            "--key-file=/etc/kubernetes/pki/etcd/server.key",
                            "--listen-client-urls=https://127.0.0.1:2379,https://192.168.1.105:2379",
                            "--listen-metrics-urls=http://127.0.0.1:2381",
                            "--listen-peer-urls=https://192.168.1.105:2380",
                            "--name=k8s-controller-01",
                            "--peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt",
                            "--peer-client-cert-auth=true",
                            "--peer-key-file=/etc/kubernetes/pki/etcd/peer.key",
                            "--peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt",
                            "--snapshot-count=10000",
                            "--trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt"
                        ],
                        "resources": {
                            "requests": {
                                "cpu": "100m",
                                "memory": "100Mi"
                            }
                        },
                        "volumeMounts": [
                            {
                                "name": "etcd-data",
                                "mountPath": "/var/lib/etcd"
                            },
                            {
                                "name": "etcd-certs",
                                "mountPath": "/etc/kubernetes/pki/etcd"
                            }
                        ],
                        "livenessProbe": {
                            "httpGet": {
                                "path": "/health?exclude=NOSPACE\u0026serializable=true",
                                "port": 2381,
                                "host": "127.0.0.1",
                                "scheme": "HTTP"
                            },
                            "initialDelaySeconds": 10,
                            "timeoutSeconds": 15,
                            "periodSeconds": 10,
                            "successThreshold": 1,
                            "failureThreshold": 8
                        },
                        "startupProbe": {
                            "httpGet": {
                                "path": "/health?serializable=false",
                                "port": 2381,
                                "host": "127.0.0.1",
                                "scheme": "HTTP"
                            },
                            "initialDelaySeconds": 10,
                            "timeoutSeconds": 15,
                            "periodSeconds": 10,
                            "successThreshold": 1,
                            "failureThreshold": 24
                        },
                        "terminationMessagePath": "/dev/termination-log",
                        "terminationMessagePolicy": "File",
                        "imagePullPolicy": "IfNotPresent"
                    }
                ],
                "restartPolicy": "Always",
                "terminationGracePeriodSeconds": 30,
                "dnsPolicy": "ClusterFirst",
                "nodeName": "k8s-controller-01",
                "hostNetwork": true,
                "securityContext": {
                    "seccompProfile": {
                        "type": "RuntimeDefault"
                    }
                },
                "schedulerName": "default-scheduler",
                "tolerations": [
                    {
                        "operator": "Exists",
                        "effect": "NoExecute"
                    }
                ],
                "priorityClassName": "system-node-critical",
                "priority": 2000001000,
                "enableServiceLinks": true,
                "preemptionPolicy": "PreemptLowerPriority"
            },
            "status": {
                "phase": "Running",
                "conditions": [
                    {
                        "type": "Initialized",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:05:58Z"
                    },
                    {
                        "type": "Ready",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:06:13Z"
                    },
                    {
                        "type": "ContainersReady",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:06:13Z"
                    },
                    {
                        "type": "PodScheduled",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:05:58Z"
                    }
                ],
                "hostIP": "192.168.1.105",
                "podIP": "192.168.1.105",
                "podIPs": [
                    {
                        "ip": "192.168.1.105"
                    }
                ],
                "startTime": "2024-10-25T16:05:58Z",
                "containerStatuses": [
                    {
                        "name": "etcd",
                        "state": {
                            "running": {
                                "startedAt": "2024-10-25T16:06:00Z"
                            }
                        },
                        "lastState": {
                            "terminated": {
                                "exitCode": 255,
                                "reason": "Unknown",
                                "startedAt": "2024-10-24T21:23:39Z",
                                "finishedAt": "2024-10-25T16:05:57Z",
                                "containerID": "containerd://636168c87901fee448ea70708b601f2d01d9ab6949ceac7e2bd5e64ee1ed4284"
                            }
                        },
                        "ready": true,
                        "restartCount": 1,
                        "image": "registry.k8s.io/etcd:3.5.15-0",
                        "imageID": "registry.k8s.io/etcd@sha256:a6dc63e6e8cfa0307d7851762fa6b629afb18f28d8aa3fab5a6e91b4af60026a",
                        "containerID": "containerd://bd8e739c800c48d94c001dffece330d6229d4223d417579a8da27eb474f3f0de",
                        "started": true
                    }
                ],
                "qosClass": "Burstable"
            }
        },
        {
            "metadata": {
                "name": "kube-apiserver-k8s-controller-01",
                "namespace": "kube-system",
                "uid": "06a7744c-36a8-4393-b2a2-16cc32e364f8",
                "resourceVersion": "13524",
                "creationTimestamp": "2024-10-24T21:23:47Z",
                "labels": {
                    "component": "kube-apiserver",
                    "tier": "control-plane"
                },
                "annotations": {
                    "kubeadm.kubernetes.io/kube-apiserver.advertise-address.endpoint": "192.168.1.105:6443",
                    "kubernetes.io/config.hash": "ea28308f06c4898081f42d3ce5e34ad5",
                    "kubernetes.io/config.mirror": "ea28308f06c4898081f42d3ce5e34ad5",
                    "kubernetes.io/config.seen": "2024-10-24T21:23:36.404726587Z",
                    "kubernetes.io/config.source": "file"
                },
                "ownerReferences": [
                    {
                        "apiVersion": "v1",
                        "kind": "Node",
                        "name": "k8s-controller-01",
                        "uid": "fe8cecaa-e538-4cf7-bea3-bcabc3faee4a",
                        "controller": true
                    }
                ]
            },
            "spec": {
                "volumes": [
                    {
                        "name": "ca-certs",
                        "hostPath": {
                            "path": "/etc/ssl/certs",
                            "type": "DirectoryOrCreate"
                        }
                    },
                    {
                        "name": "etc-ca-certificates",
                        "hostPath": {
                            "path": "/etc/ca-certificates",
                            "type": "DirectoryOrCreate"
                        }
                    },
                    {
                        "name": "etc-pki",
                        "hostPath": {
                            "path": "/etc/pki",
                            "type": "DirectoryOrCreate"
                        }
                    },
                    {
                        "name": "k8s-certs",
                        "hostPath": {
                            "path": "/etc/kubernetes/pki",
                            "type": "DirectoryOrCreate"
                        }
                    },
                    {
                        "name": "usr-local-share-ca-certificates",
                        "hostPath": {
                            "path": "/usr/local/share/ca-certificates",
                            "type": "DirectoryOrCreate"
                        }
                    },
                    {
                        "name": "usr-share-ca-certificates",
                        "hostPath": {
                            "path": "/usr/share/ca-certificates",
                            "type": "DirectoryOrCreate"
                        }
                    }
                ],
                "containers": [
                    {
                        "name": "kube-apiserver",
                        "image": "registry.k8s.io/kube-apiserver:v1.28.15",
                        "command": [
                            "kube-apiserver",
                            "--advertise-address=192.168.1.105",
                            "--allow-privileged=true",
                            "--authorization-mode=Node,RBAC",
                            "--client-ca-file=/etc/kubernetes/pki/ca.crt",
                            "--enable-admission-plugins=NodeRestriction",
                            "--enable-bootstrap-token-auth=true",
                            "--etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt",
                            "--etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt",
                            "--etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key",
                            "--etcd-servers=https://127.0.0.1:2379",
                            "--kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt",
                            "--kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key",
                            "--kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname",
                            "--proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt",
                            "--proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key",
                            "--requestheader-allowed-names=front-proxy-client",
                            "--requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt",
                            "--requestheader-extra-headers-prefix=X-Remote-Extra-",
                            "--requestheader-group-headers=X-Remote-Group",
                            "--requestheader-username-headers=X-Remote-User",
                            "--secure-port=6443",
                            "--service-account-issuer=https://kubernetes.default.svc.cluster.local",
                            "--service-account-key-file=/etc/kubernetes/pki/sa.pub",
                            "--service-account-signing-key-file=/etc/kubernetes/pki/sa.key",
                            "--service-cluster-ip-range=10.96.0.0/12",
                            "--tls-cert-file=/etc/kubernetes/pki/apiserver.crt",
                            "--tls-private-key-file=/etc/kubernetes/pki/apiserver.key"
                        ],
                        "resources": {
                            "requests": {
                                "cpu": "250m"
                            }
                        },
                        "volumeMounts": [
                            {
                                "name": "ca-certs",
                                "readOnly": true,
                                "mountPath": "/etc/ssl/certs"
                            },
                            {
                                "name": "etc-ca-certificates",
                                "readOnly": true,
                                "mountPath": "/etc/ca-certificates"
                            },
                            {
                                "name": "etc-pki",
                                "readOnly": true,
                                "mountPath": "/etc/pki"
                            },
                            {
                                "name": "k8s-certs",
                                "readOnly": true,
                                "mountPath": "/etc/kubernetes/pki"
                            },
                            {
                                "name": "usr-local-share-ca-certificates",
                                "readOnly": true,
                                "mountPath": "/usr/local/share/ca-certificates"
                            },
                            {
                                "name": "usr-share-ca-certificates",
                                "readOnly": true,
                                "mountPath": "/usr/share/ca-certificates"
                            }
                        ],
                        "livenessProbe": {
                            "httpGet": {
                                "path": "/livez",
                                "port": 6443,
                                "host": "192.168.1.105",
                                "scheme": "HTTPS"
                            },
                            "initialDelaySeconds": 10,
                            "timeoutSeconds": 15,
                            "periodSeconds": 10,
                            "successThreshold": 1,
                            "failureThreshold": 8
                        },
                        "readinessProbe": {
                            "httpGet": {
                                "path": "/readyz",
                                "port": 6443,
                                "host": "192.168.1.105",
                                "scheme": "HTTPS"
                            },
                            "timeoutSeconds": 15,
                            "periodSeconds": 1,
                            "successThreshold": 1,
                            "failureThreshold": 3
                        },
                        "startupProbe": {
                            "httpGet": {
                                "path": "/livez",
                                "port": 6443,
                                "host": "192.168.1.105",
                                "scheme": "HTTPS"
                            },
                            "initialDelaySeconds": 10,
                            "timeoutSeconds": 15,
                            "periodSeconds": 10,
                            "successThreshold": 1,
                            "failureThreshold": 24
                        },
                        "terminationMessagePath": "/dev/termination-log",
                        "terminationMessagePolicy": "File",
                        "imagePullPolicy": "IfNotPresent"
                    }
                ],
                "restartPolicy": "Always",
                "terminationGracePeriodSeconds": 30,
                "dnsPolicy": "ClusterFirst",
                "nodeName": "k8s-controller-01",
                "hostNetwork": true,
                "securityContext": {
                    "seccompProfile": {
                        "type": "RuntimeDefault"
                    }
                },
                "schedulerName": "default-scheduler",
                "tolerations": [
                    {
                        "operator": "Exists",
                        "effect": "NoExecute"
                    }
                ],
                "priorityClassName": "system-node-critical",
                "priority": 2000001000,
                "enableServiceLinks": true,
                "preemptionPolicy": "PreemptLowerPriority"
            },
            "status": {
                "phase": "Running",
                "conditions": [
                    {
                        "type": "Initialized",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:05:58Z"
                    },
                    {
                        "type": "Ready",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:06:14Z"
                    },
                    {
                        "type": "ContainersReady",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:06:14Z"
                    },
                    {
                        "type": "PodScheduled",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:05:58Z"
                    }
                ],
                "hostIP": "192.168.1.105",
                "podIP": "192.168.1.105",
                "podIPs": [
                    {
                        "ip": "192.168.1.105"
                    }
                ],
                "startTime": "2024-10-25T16:05:58Z",
                "containerStatuses": [
                    {
                        "name": "kube-apiserver",
                        "state": {
                            "running": {
                                "startedAt": "2024-10-25T16:06:00Z"
                            }
                        },
                        "lastState": {
                            "terminated": {
                                "exitCode": 255,
                                "reason": "Unknown",
                                "startedAt": "2024-10-24T21:23:39Z",
                                "finishedAt": "2024-10-25T16:05:57Z",
                                "containerID": "containerd://4a0eed3d974785838ca7d79c086cc39e463734f33782b53e19a869d8cf23c92a"
                            }
                        },
                        "ready": true,
                        "restartCount": 1,
                        "image": "registry.k8s.io/kube-apiserver:v1.28.15",
                        "imageID": "registry.k8s.io/kube-apiserver@sha256:6dfa84f5d6be711ae0d19758201d337e836ab7de73306ff14725ceaa978fea8f",
                        "containerID": "containerd://75e23a466fc0e0602fe4bbfa69f6a0e88276bc68100ae29ddc1eee073a153245",
                        "started": true
                    }
                ],
                "qosClass": "Burstable"
            }
        },
        {
            "metadata": {
                "name": "kube-controller-manager-k8s-controller-01",
                "namespace": "kube-system",
                "uid": "59a9a2f1-07d4-43f6-a7f9-6754b644960e",
                "resourceVersion": "13520",
                "creationTimestamp": "2024-10-24T21:23:49Z",
                "labels": {
                    "component": "kube-controller-manager",
                    "tier": "control-plane"
                },
                "annotations": {
                    "kubernetes.io/config.hash": "eb96ceebd79d1875058a2fe90f8b820b",
                    "kubernetes.io/config.mirror": "eb96ceebd79d1875058a2fe90f8b820b",
                    "kubernetes.io/config.seen": "2024-10-24T21:23:48.561425242Z",
                    "kubernetes.io/config.source": "file"
                },
                "ownerReferences": [
                    {
                        "apiVersion": "v1",
                        "kind": "Node",
                        "name": "k8s-controller-01",
                        "uid": "fe8cecaa-e538-4cf7-bea3-bcabc3faee4a",
                        "controller": true
                    }
                ]
            },
            "spec": {
                "volumes": [
                    {
                        "name": "ca-certs",
                        "hostPath": {
                            "path": "/etc/ssl/certs",
                            "type": "DirectoryOrCreate"
                        }
                    },
                    {
                        "name": "etc-ca-certificates",
                        "hostPath": {
                            "path": "/etc/ca-certificates",
                            "type": "DirectoryOrCreate"
                        }
                    },
                    {
                        "name": "etc-pki",
                        "hostPath": {
                            "path": "/etc/pki",
                            "type": "DirectoryOrCreate"
                        }
                    },
                    {
                        "name": "flexvolume-dir",
                        "hostPath": {
                            "path": "/usr/libexec/kubernetes/kubelet-plugins/volume/exec",
                            "type": "DirectoryOrCreate"
                        }
                    },
                    {
                        "name": "k8s-certs",
                        "hostPath": {
                            "path": "/etc/kubernetes/pki",
                            "type": "DirectoryOrCreate"
                        }
                    },
                    {
                        "name": "kubeconfig",
                        "hostPath": {
                            "path": "/etc/kubernetes/controller-manager.conf",
                            "type": "FileOrCreate"
                        }
                    },
                    {
                        "name": "usr-local-share-ca-certificates",
                        "hostPath": {
                            "path": "/usr/local/share/ca-certificates",
                            "type": "DirectoryOrCreate"
                        }
                    },
                    {
                        "name": "usr-share-ca-certificates",
                        "hostPath": {
                            "path": "/usr/share/ca-certificates",
                            "type": "DirectoryOrCreate"
                        }
                    }
                ],
                "containers": [
                    {
                        "name": "kube-controller-manager",
                        "image": "registry.k8s.io/kube-controller-manager:v1.28.15",
                        "command": [
                            "kube-controller-manager",
                            "--allocate-node-cidrs=true",
                            "--authentication-kubeconfig=/etc/kubernetes/controller-manager.conf",
                            "--authorization-kubeconfig=/etc/kubernetes/controller-manager.conf",
                            "--bind-address=127.0.0.1",
                            "--client-ca-file=/etc/kubernetes/pki/ca.crt",
                            "--cluster-cidr=10.244.0.0/16",
                            "--cluster-name=kubernetes",
                            "--cluster-signing-cert-file=/etc/kubernetes/pki/ca.crt",
                            "--cluster-signing-key-file=/etc/kubernetes/pki/ca.key",
                            "--controllers=*,bootstrapsigner,tokencleaner",
                            "--kubeconfig=/etc/kubernetes/controller-manager.conf",
                            "--leader-elect=true",
                            "--requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt",
                            "--root-ca-file=/etc/kubernetes/pki/ca.crt",
                            "--service-account-private-key-file=/etc/kubernetes/pki/sa.key",
                            "--service-cluster-ip-range=10.96.0.0/12",
                            "--use-service-account-credentials=true"
                        ],
                        "resources": {
                            "requests": {
                                "cpu": "200m"
                            }
                        },
                        "volumeMounts": [
                            {
                                "name": "ca-certs",
                                "readOnly": true,
                                "mountPath": "/etc/ssl/certs"
                            },
                            {
                                "name": "etc-ca-certificates",
                                "readOnly": true,
                                "mountPath": "/etc/ca-certificates"
                            },
                            {
                                "name": "etc-pki",
                                "readOnly": true,
                                "mountPath": "/etc/pki"
                            },
                            {
                                "name": "flexvolume-dir",
                                "mountPath": "/usr/libexec/kubernetes/kubelet-plugins/volume/exec"
                            },
                            {
                                "name": "k8s-certs",
                                "readOnly": true,
                                "mountPath": "/etc/kubernetes/pki"
                            },
                            {
                                "name": "kubeconfig",
                                "readOnly": true,
                                "mountPath": "/etc/kubernetes/controller-manager.conf"
                            },
                            {
                                "name": "usr-local-share-ca-certificates",
                                "readOnly": true,
                                "mountPath": "/usr/local/share/ca-certificates"
                            },
                            {
                                "name": "usr-share-ca-certificates",
                                "readOnly": true,
                                "mountPath": "/usr/share/ca-certificates"
                            }
                        ],
                        "livenessProbe": {
                            "httpGet": {
                                "path": "/healthz",
                                "port": 10257,
                                "host": "127.0.0.1",
                                "scheme": "HTTPS"
                            },
                            "initialDelaySeconds": 10,
                            "timeoutSeconds": 15,
                            "periodSeconds": 10,
                            "successThreshold": 1,
                            "failureThreshold": 8
                        },
                        "startupProbe": {
                            "httpGet": {
                                "path": "/healthz",
                                "port": 10257,
                                "host": "127.0.0.1",
                                "scheme": "HTTPS"
                            },
                            "initialDelaySeconds": 10,
                            "timeoutSeconds": 15,
                            "periodSeconds": 10,
                            "successThreshold": 1,
                            "failureThreshold": 24
                        },
                        "terminationMessagePath": "/dev/termination-log",
                        "terminationMessagePolicy": "File",
                        "imagePullPolicy": "IfNotPresent"
                    }
                ],
                "restartPolicy": "Always",
                "terminationGracePeriodSeconds": 30,
                "dnsPolicy": "ClusterFirst",
                "nodeName": "k8s-controller-01",
                "hostNetwork": true,
                "securityContext": {
                    "seccompProfile": {
                        "type": "RuntimeDefault"
                    }
                },
                "schedulerName": "default-scheduler",
                "tolerations": [
                    {
                        "operator": "Exists",
                        "effect": "NoExecute"
                    }
                ],
                "priorityClassName": "system-node-critical",
                "priority": 2000001000,
                "enableServiceLinks": true,
                "preemptionPolicy": "PreemptLowerPriority"
            },
            "status": {
                "phase": "Running",
                "conditions": [
                    {
                        "type": "Initialized",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:05:58Z"
                    },
                    {
                        "type": "Ready",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:06:12Z"
                    },
                    {
                        "type": "ContainersReady",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:06:12Z"
                    },
                    {
                        "type": "PodScheduled",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:05:58Z"
                    }
                ],
                "hostIP": "192.168.1.105",
                "podIP": "192.168.1.105",
                "podIPs": [
                    {
                        "ip": "192.168.1.105"
                    }
                ],
                "startTime": "2024-10-25T16:05:58Z",
                "containerStatuses": [
                    {
                        "name": "kube-controller-manager",
                        "state": {
                            "running": {
                                "startedAt": "2024-10-25T16:06:00Z"
                            }
                        },
                        "lastState": {
                            "terminated": {
                                "exitCode": 255,
                                "reason": "Unknown",
                                "startedAt": "2024-10-24T21:23:39Z",
                                "finishedAt": "2024-10-25T16:05:57Z",
                                "containerID": "containerd://535872f9f1fa418fd2bf6b198b506c7f47de9beb5a8895373930fc7a9875b6f6"
                            }
                        },
                        "ready": true,
                        "restartCount": 1,
                        "image": "registry.k8s.io/kube-controller-manager:v1.28.15",
                        "imageID": "registry.k8s.io/kube-controller-manager@sha256:dadd2a3784783018a7ee8588d11f787fee4d5424f2cdd6ce89d3ba1844a6c175",
                        "containerID": "containerd://7f3553e68eff4ba7a0cff75104541e4cb70f2973423bfbb30b57830552dd3553",
                        "started": true
                    }
                ],
                "qosClass": "Burstable"
            }
        },
        {
            "metadata": {
                "name": "kube-proxy-p4jmn",
                "generateName": "kube-proxy-",
                "namespace": "kube-system",
                "uid": "83d837fe-eb56-4c66-a379-5add9d532499",
                "resourceVersion": "13522",
                "creationTimestamp": "2024-10-24T21:24:01Z",
                "labels": {
                    "controller-revision-hash": "747c75b954",
                    "k8s-app": "kube-proxy",
                    "pod-template-generation": "1"
                },
                "ownerReferences": [
                    {
                        "apiVersion": "apps/v1",
                        "kind": "DaemonSet",
                        "name": "kube-proxy",
                        "uid": "10011c31-e359-45b5-b841-dcfc37baab96",
                        "controller": true,
                        "blockOwnerDeletion": true
                    }
                ]
            },
            "spec": {
                "volumes": [
                    {
                        "name": "kube-proxy",
                        "configMap": {
                            "name": "kube-proxy",
                            "defaultMode": 420
                        }
                    },
                    {
                        "name": "xtables-lock",
                        "hostPath": {
                            "path": "/run/xtables.lock",
                            "type": "FileOrCreate"
                        }
                    },
                    {
                        "name": "lib-modules",
                        "hostPath": {
                            "path": "/lib/modules",
                            "type": ""
                        }
                    },
                    {
                        "name": "kube-api-access-vghcn",
                        "projected": {
                            "sources": [
                                {
                                    "serviceAccountToken": {
                                        "expirationSeconds": 3607,
                                        "path": "token"
                                    }
                                },
                                {
                                    "configMap": {
                                        "name": "kube-root-ca.crt",
                                        "items": [
                                            {
                                                "key": "ca.crt",
                                                "path": "ca.crt"
                                            }
                                        ]
                                    }
                                },
                                {
                                    "downwardAPI": {
                                        "items": [
                                            {
                                                "path": "namespace",
                                                "fieldRef": {
                                                    "apiVersion": "v1",
                                                    "fieldPath": "metadata.namespace"
                                                }
                                            }
                                        ]
                                    }
                                }
                            ],
                            "defaultMode": 420
                        }
                    }
                ],
                "containers": [
                    {
                        "name": "kube-proxy",
                        "image": "registry.k8s.io/kube-proxy:v1.28.15",
                        "command": [
                            "/usr/local/bin/kube-proxy",
                            "--config=/var/lib/kube-proxy/config.conf",
                            "--hostname-override=$(NODE_NAME)"
                        ],
                        "env": [
                            {
                                "name": "NODE_NAME",
                                "valueFrom": {
                                    "fieldRef": {
                                        "apiVersion": "v1",
                                        "fieldPath": "spec.nodeName"
                                    }
                                }
                            }
                        ],
                        "resources": {},
                        "volumeMounts": [
                            {
                                "name": "kube-proxy",
                                "mountPath": "/var/lib/kube-proxy"
                            },
                            {
                                "name": "xtables-lock",
                                "mountPath": "/run/xtables.lock"
                            },
                            {
                                "name": "lib-modules",
                                "readOnly": true,
                                "mountPath": "/lib/modules"
                            },
                            {
                                "name": "kube-api-access-vghcn",
                                "readOnly": true,
                                "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
                            }
                        ],
                        "terminationMessagePath": "/dev/termination-log",
                        "terminationMessagePolicy": "File",
                        "imagePullPolicy": "IfNotPresent",
                        "securityContext": {
                            "privileged": true
                        }
                    }
                ],
                "restartPolicy": "Always",
                "terminationGracePeriodSeconds": 30,
                "dnsPolicy": "ClusterFirst",
                "nodeSelector": {
                    "kubernetes.io/os": "linux"
                },
                "serviceAccountName": "kube-proxy",
                "serviceAccount": "kube-proxy",
                "nodeName": "k8s-controller-01",
                "hostNetwork": true,
                "securityContext": {},
                "affinity": {
                    "nodeAffinity": {
                        "requiredDuringSchedulingIgnoredDuringExecution": {
                            "nodeSelectorTerms": [
                                {
                                    "matchFields": [
                                        {
                                            "key": "metadata.name",
                                            "operator": "In",
                                            "values": [
                                                "k8s-controller-01"
                                            ]
                                        }
                                    ]
                                }
                            ]
                        }
                    }
                },
                "schedulerName": "default-scheduler",
                "tolerations": [
                    {
                        "operator": "Exists"
                    },
                    {
                        "key": "node.kubernetes.io/not-ready",
                        "operator": "Exists",
                        "effect": "NoExecute"
                    },
                    {
                        "key": "node.kubernetes.io/unreachable",
                        "operator": "Exists",
                        "effect": "NoExecute"
                    },
                    {
                        "key": "node.kubernetes.io/disk-pressure",
                        "operator": "Exists",
                        "effect": "NoSchedule"
                    },
                    {
                        "key": "node.kubernetes.io/memory-pressure",
                        "operator": "Exists",
                        "effect": "NoSchedule"
                    },
                    {
                        "key": "node.kubernetes.io/pid-pressure",
                        "operator": "Exists",
                        "effect": "NoSchedule"
                    },
                    {
                        "key": "node.kubernetes.io/unschedulable",
                        "operator": "Exists",
                        "effect": "NoSchedule"
                    },
                    {
                        "key": "node.kubernetes.io/network-unavailable",
                        "operator": "Exists",
                        "effect": "NoSchedule"
                    }
                ],
                "priorityClassName": "system-node-critical",
                "priority": 2000001000,
                "enableServiceLinks": true,
                "preemptionPolicy": "PreemptLowerPriority"
            },
            "status": {
                "phase": "Running",
                "conditions": [
                    {
                        "type": "Initialized",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-24T21:24:01Z"
                    },
                    {
                        "type": "Ready",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:06:08Z"
                    },
                    {
                        "type": "ContainersReady",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:06:08Z"
                    },
                    {
                        "type": "PodScheduled",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-24T21:24:01Z"
                    }
                ],
                "hostIP": "192.168.1.105",
                "podIP": "192.168.1.105",
                "podIPs": [
                    {
                        "ip": "192.168.1.105"
                    }
                ],
                "startTime": "2024-10-24T21:24:01Z",
                "containerStatuses": [
                    {
                        "name": "kube-proxy",
                        "state": {
                            "running": {
                                "startedAt": "2024-10-25T16:06:07Z"
                            }
                        },
                        "lastState": {
                            "terminated": {
                                "exitCode": 255,
                                "reason": "Unknown",
                                "startedAt": "2024-10-24T21:24:02Z",
                                "finishedAt": "2024-10-25T16:05:57Z",
                                "containerID": "containerd://6864d19d0054be24eaa8c17261ab2a5da758bf771edb93d555cfa79cffa1b98a"
                            }
                        },
                        "ready": true,
                        "restartCount": 1,
                        "image": "registry.k8s.io/kube-proxy:v1.28.15",
                        "imageID": "registry.k8s.io/kube-proxy@sha256:8e039a309ca0dc220e6d4350f78d96d1c4c76dd7444354a3ea6142a890ae8ae5",
                        "containerID": "containerd://68261f5136b984e8935b7876f97886e8d4a5233120a1a62663f23e7a09f28290",
                        "started": true
                    }
                ],
                "qosClass": "BestEffort"
            }
        },
        {
            "metadata": {
                "name": "kube-scheduler-k8s-controller-01",
                "namespace": "kube-system",
                "uid": "67c215bc-f1af-48d2-bac6-1165e0d09307",
                "resourceVersion": "13521",
                "creationTimestamp": "2024-10-24T21:23:46Z",
                "labels": {
                    "component": "kube-scheduler",
                    "tier": "control-plane"
                },
                "annotations": {
                    "kubernetes.io/config.hash": "b7a77facbd4cda1f4e5b81fbe8b8c173",
                    "kubernetes.io/config.mirror": "b7a77facbd4cda1f4e5b81fbe8b8c173",
                    "kubernetes.io/config.seen": "2024-10-24T21:23:36.404728844Z",
                    "kubernetes.io/config.source": "file"
                },
                "ownerReferences": [
                    {
                        "apiVersion": "v1",
                        "kind": "Node",
                        "name": "k8s-controller-01",
                        "uid": "fe8cecaa-e538-4cf7-bea3-bcabc3faee4a",
                        "controller": true
                    }
                ]
            },
            "spec": {
                "volumes": [
                    {
                        "name": "kubeconfig",
                        "hostPath": {
                            "path": "/etc/kubernetes/scheduler.conf",
                            "type": "FileOrCreate"
                        }
                    }
                ],
                "containers": [
                    {
                        "name": "kube-scheduler",
                        "image": "registry.k8s.io/kube-scheduler:v1.28.15",
                        "command": [
                            "kube-scheduler",
                            "--authentication-kubeconfig=/etc/kubernetes/scheduler.conf",
                            "--authorization-kubeconfig=/etc/kubernetes/scheduler.conf",
                            "--bind-address=127.0.0.1",
                            "--kubeconfig=/etc/kubernetes/scheduler.conf",
                            "--leader-elect=true"
                        ],
                        "resources": {
                            "requests": {
                                "cpu": "100m"
                            }
                        },
                        "volumeMounts": [
                            {
                                "name": "kubeconfig",
                                "readOnly": true,
                                "mountPath": "/etc/kubernetes/scheduler.conf"
                            }
                        ],
                        "livenessProbe": {
                            "httpGet": {
                                "path": "/healthz",
                                "port": 10259,
                                "host": "127.0.0.1",
                                "scheme": "HTTPS"
                            },
                            "initialDelaySeconds": 10,
                            "timeoutSeconds": 15,
                            "periodSeconds": 10,
                            "successThreshold": 1,
                            "failureThreshold": 8
                        },
                        "startupProbe": {
                            "httpGet": {
                                "path": "/healthz",
                                "port": 10259,
                                "host": "127.0.0.1",
                                "scheme": "HTTPS"
                            },
                            "initialDelaySeconds": 10,
                            "timeoutSeconds": 15,
                            "periodSeconds": 10,
                            "successThreshold": 1,
                            "failureThreshold": 24
                        },
                        "terminationMessagePath": "/dev/termination-log",
                        "terminationMessagePolicy": "File",
                        "imagePullPolicy": "IfNotPresent"
                    }
                ],
                "restartPolicy": "Always",
                "terminationGracePeriodSeconds": 30,
                "dnsPolicy": "ClusterFirst",
                "nodeName": "k8s-controller-01",
                "hostNetwork": true,
                "securityContext": {
                    "seccompProfile": {
                        "type": "RuntimeDefault"
                    }
                },
                "schedulerName": "default-scheduler",
                "tolerations": [
                    {
                        "operator": "Exists",
                        "effect": "NoExecute"
                    }
                ],
                "priorityClassName": "system-node-critical",
                "priority": 2000001000,
                "enableServiceLinks": true,
                "preemptionPolicy": "PreemptLowerPriority"
            },
            "status": {
                "phase": "Running",
                "conditions": [
                    {
                        "type": "Initialized",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:05:58Z"
                    },
                    {
                        "type": "Ready",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:06:12Z"
                    },
                    {
                        "type": "ContainersReady",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:06:12Z"
                    },
                    {
                        "type": "PodScheduled",
                        "status": "True",
                        "lastProbeTime": null,
                        "lastTransitionTime": "2024-10-25T16:05:58Z"
                    }
                ],
                "hostIP": "192.168.1.105",
                "podIP": "192.168.1.105",
                "podIPs": [
                    {
                        "ip": "192.168.1.105"
                    }
                ],
                "startTime": "2024-10-25T16:05:58Z",
                "containerStatuses": [
                    {
                        "name": "kube-scheduler",
                        "state": {
                            "running": {
                                "startedAt": "2024-10-25T16:06:00Z"
                            }
                        },
                        "lastState": {
                            "terminated": {
                                "exitCode": 255,
                                "reason": "Unknown",
                                "startedAt": "2024-10-24T21:23:39Z",
                                "finishedAt": "2024-10-25T16:05:57Z",
                                "containerID": "containerd://ada0956128384ef7f86e67034d3831e50e77391c94e83e99c118e94fbe7fef7f"
                            }
                        },
                        "ready": true,
                        "restartCount": 1,
                        "image": "registry.k8s.io/kube-scheduler:v1.28.15",
                        "imageID": "registry.k8s.io/kube-scheduler@sha256:82f4a42317450858d3d70fde5b3c0f22153ea155fd053f09865999a4661f2dca",
                        "containerID": "containerd://264b87fc7577336d4fbc954c77a7a9fbac42cc4c493976a901fe97d14275d104",
                        "started": true
                    }
                ],
                "qosClass": "Burstable"
            }
        }
    ]
}
==== START logs for container coredns of pod kube-system/coredns-5dd5756b68-2zrhr ====
==== END logs for container coredns of pod kube-system/coredns-5dd5756b68-2zrhr ====
==== START logs for container coredns of pod kube-system/coredns-5dd5756b68-wcs5x ====
==== END logs for container coredns of pod kube-system/coredns-5dd5756b68-wcs5x ====
==== START logs for container etcd of pod kube-system/etcd-k8s-controller-01 ====
{"level":"warn","ts":"2024-10-25T16:06:01.355710Z","caller":"embed/config.go:687","msg":"Running http and grpc server on single port. This is not recommended for production."}
{"level":"info","ts":"2024-10-25T16:06:01.361747Z","caller":"etcdmain/etcd.go:73","msg":"Running: ","args":["etcd","--advertise-client-urls=https://192.168.1.105:2379","--cert-file=/etc/kubernetes/pki/etcd/server.crt","--client-cert-auth=true","--data-dir=/var/lib/etcd","--experimental-initial-corrupt-check=true","--experimental-watch-progress-notify-interval=5s","--initial-advertise-peer-urls=https://192.168.1.105:2380","--initial-cluster=k8s-controller-01=https://192.168.1.105:2380","--key-file=/etc/kubernetes/pki/etcd/server.key","--listen-client-urls=https://127.0.0.1:2379,https://192.168.1.105:2379","--listen-metrics-urls=http://127.0.0.1:2381","--listen-peer-urls=https://192.168.1.105:2380","--name=k8s-controller-01","--peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt","--peer-client-cert-auth=true","--peer-key-file=/etc/kubernetes/pki/etcd/peer.key","--peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt","--snapshot-count=10000","--trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt"]}
{"level":"info","ts":"2024-10-25T16:06:01.365397Z","caller":"etcdmain/etcd.go:116","msg":"server has been already initialized","data-dir":"/var/lib/etcd","dir-type":"member"}
{"level":"warn","ts":"2024-10-25T16:06:01.365550Z","caller":"embed/config.go:687","msg":"Running http and grpc server on single port. This is not recommended for production."}
{"level":"info","ts":"2024-10-25T16:06:01.365578Z","caller":"embed/etcd.go:128","msg":"configuring peer listeners","listen-peer-urls":["https://192.168.1.105:2380"]}
{"level":"info","ts":"2024-10-25T16:06:01.365724Z","caller":"embed/etcd.go:496","msg":"starting with peer TLS","tls-info":"cert = /etc/kubernetes/pki/etcd/peer.crt, key = /etc/kubernetes/pki/etcd/peer.key, client-cert=, client-key=, trusted-ca = /etc/kubernetes/pki/etcd/ca.crt, client-cert-auth = true, crl-file = ","cipher-suites":[]}
{"level":"info","ts":"2024-10-25T16:06:01.393338Z","caller":"embed/etcd.go:136","msg":"configuring client listeners","listen-client-urls":["https://127.0.0.1:2379","https://192.168.1.105:2379"]}
{"level":"info","ts":"2024-10-25T16:06:01.397888Z","caller":"embed/etcd.go:310","msg":"starting an etcd server","etcd-version":"3.5.15","git-sha":"9a5533382","go-version":"go1.21.12","go-os":"linux","go-arch":"amd64","max-cpu-set":2,"max-cpu-available":2,"member-initialized":true,"name":"k8s-controller-01","data-dir":"/var/lib/etcd","wal-dir":"","wal-dir-dedicated":"","member-dir":"/var/lib/etcd/member","force-new-cluster":false,"heartbeat-interval":"100ms","election-timeout":"1s","initial-election-tick-advance":true,"snapshot-count":10000,"max-wals":5,"max-snapshots":5,"snapshot-catchup-entries":5000,"initial-advertise-peer-urls":["https://192.168.1.105:2380"],"listen-peer-urls":["https://192.168.1.105:2380"],"advertise-client-urls":["https://192.168.1.105:2379"],"listen-client-urls":["https://127.0.0.1:2379","https://192.168.1.105:2379"],"listen-metrics-urls":["http://127.0.0.1:2381"],"cors":["*"],"host-whitelist":["*"],"initial-cluster":"","initial-cluster-state":"new","initial-cluster-token":"","quota-backend-bytes":2147483648,"max-request-bytes":1572864,"max-concurrent-streams":4294967295,"pre-vote":true,"initial-corrupt-check":true,"corrupt-check-time-interval":"0s","compact-check-time-enabled":false,"compact-check-time-interval":"1m0s","auto-compaction-mode":"periodic","auto-compaction-retention":"0s","auto-compaction-interval":"0s","discovery-url":"","discovery-proxy":"","downgrade-check-interval":"5s"}
{"level":"info","ts":"2024-10-25T16:06:01.533298Z","caller":"etcdserver/backend.go:81","msg":"opened backend db","path":"/var/lib/etcd/member/snap/db","took":"133.200662ms"}
{"level":"info","ts":"2024-10-25T16:06:01.971623Z","caller":"etcdserver/server.go:511","msg":"recovered v2 store from snapshot","snapshot-index":10001,"snapshot-size":"7.1 kB"}
{"level":"info","ts":"2024-10-25T16:06:01.971735Z","caller":"etcdserver/server.go:524","msg":"recovered v3 backend from snapshot","backend-size-bytes":1507328,"backend-size":"1.5 MB","backend-size-in-use-bytes":798720,"backend-size-in-use":"799 kB"}
{"level":"info","ts":"2024-10-25T16:06:02.307592Z","caller":"etcdserver/raft.go:530","msg":"restarting local member","cluster-id":"83091f3be7e839ed","local-member-id":"d6b41b608ff76c2","commit-index":15512}
{"level":"info","ts":"2024-10-25T16:06:02.309118Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"d6b41b608ff76c2 switched to configuration voters=(966938795091916482)"}
{"level":"info","ts":"2024-10-25T16:06:02.316800Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"d6b41b608ff76c2 became follower at term 2"}
{"level":"info","ts":"2024-10-25T16:06:02.316958Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"newRaft d6b41b608ff76c2 [peers: [d6b41b608ff76c2], term: 2, commit: 15512, applied: 10001, lastindex: 15512, lastterm: 2]"}
{"level":"info","ts":"2024-10-25T16:06:02.317243Z","caller":"api/capability.go:75","msg":"enabled capabilities for version","cluster-version":"3.5"}
{"level":"info","ts":"2024-10-25T16:06:02.317324Z","caller":"membership/cluster.go:278","msg":"recovered/added member from store","cluster-id":"83091f3be7e839ed","local-member-id":"d6b41b608ff76c2","recovered-remote-peer-id":"d6b41b608ff76c2","recovered-remote-peer-urls":["https://192.168.1.105:2380"]}
{"level":"info","ts":"2024-10-25T16:06:02.317548Z","caller":"membership/cluster.go:287","msg":"set cluster version from store","cluster-version":"3.5"}
{"level":"warn","ts":"2024-10-25T16:06:02.320574Z","caller":"auth/store.go:1241","msg":"simple token is not cryptographically signed"}
{"level":"info","ts":"2024-10-25T16:06:02.323447Z","caller":"mvcc/kvstore.go:341","msg":"restored last compact revision","meta-bucket-name":"meta","meta-bucket-name-key":"finishedCompactRev","restored-compact-revision":12856}
{"level":"info","ts":"2024-10-25T16:06:02.349940Z","caller":"mvcc/kvstore.go:418","msg":"kvstore restored","current-rev":13414}
{"level":"info","ts":"2024-10-25T16:06:02.352977Z","caller":"etcdserver/quota.go:94","msg":"enabled backend quota with default value","quota-name":"v3-applier","quota-size-bytes":2147483648,"quota-size":"2.1 GB"}
{"level":"info","ts":"2024-10-25T16:06:02.358140Z","caller":"etcdserver/corrupt.go:96","msg":"starting initial corruption check","local-member-id":"d6b41b608ff76c2","timeout":"7s"}
{"level":"info","ts":"2024-10-25T16:06:02.358800Z","caller":"etcdserver/corrupt.go:177","msg":"initial corruption checking passed; no corruption","local-member-id":"d6b41b608ff76c2"}
{"level":"info","ts":"2024-10-25T16:06:02.358991Z","caller":"etcdserver/server.go:858","msg":"starting etcd server","local-member-id":"d6b41b608ff76c2","local-server-version":"3.5.15","cluster-id":"83091f3be7e839ed","cluster-version":"3.5"}
{"level":"info","ts":"2024-10-25T16:06:02.366535Z","caller":"etcdserver/server.go:751","msg":"started as single-node; fast-forwarding election ticks","local-member-id":"d6b41b608ff76c2","forward-ticks":9,"forward-duration":"900ms","election-ticks":10,"election-timeout":"1s"}
{"level":"info","ts":"2024-10-25T16:06:02.368195Z","caller":"fileutil/purge.go:50","msg":"started to purge file","dir":"/var/lib/etcd/member/snap","suffix":"snap.db","max":5,"interval":"30s"}
{"level":"info","ts":"2024-10-25T16:06:02.368872Z","caller":"fileutil/purge.go:50","msg":"started to purge file","dir":"/var/lib/etcd/member/snap","suffix":"snap","max":5,"interval":"30s"}
{"level":"info","ts":"2024-10-25T16:06:02.369028Z","caller":"fileutil/purge.go:50","msg":"started to purge file","dir":"/var/lib/etcd/member/wal","suffix":"wal","max":5,"interval":"30s"}
{"level":"info","ts":"2024-10-25T16:06:02.360136Z","caller":"v3rpc/health.go:61","msg":"grpc service status changed","service":"","status":"SERVING"}
{"level":"info","ts":"2024-10-25T16:06:02.373199Z","caller":"embed/etcd.go:728","msg":"starting with client TLS","tls-info":"cert = /etc/kubernetes/pki/etcd/server.crt, key = /etc/kubernetes/pki/etcd/server.key, client-cert=, client-key=, trusted-ca = /etc/kubernetes/pki/etcd/ca.crt, client-cert-auth = true, crl-file = ","cipher-suites":[]}
{"level":"info","ts":"2024-10-25T16:06:02.411808Z","caller":"embed/etcd.go:279","msg":"now serving peer/client/metrics","local-member-id":"d6b41b608ff76c2","initial-advertise-peer-urls":["https://192.168.1.105:2380"],"listen-peer-urls":["https://192.168.1.105:2380"],"advertise-client-urls":["https://192.168.1.105:2379"],"listen-client-urls":["https://127.0.0.1:2379","https://192.168.1.105:2379"],"listen-metrics-urls":["http://127.0.0.1:2381"]}
{"level":"info","ts":"2024-10-25T16:06:02.412270Z","caller":"embed/etcd.go:599","msg":"serving peer traffic","address":"192.168.1.105:2380"}
{"level":"info","ts":"2024-10-25T16:06:02.426636Z","caller":"embed/etcd.go:571","msg":"cmux::serve","address":"192.168.1.105:2380"}
{"level":"info","ts":"2024-10-25T16:06:02.432191Z","caller":"embed/etcd.go:870","msg":"serving metrics","address":"http://127.0.0.1:2381"}
{"level":"info","ts":"2024-10-25T16:06:03.324575Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"d6b41b608ff76c2 is starting a new election at term 2"}
{"level":"info","ts":"2024-10-25T16:06:03.324847Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"d6b41b608ff76c2 became pre-candidate at term 2"}
{"level":"info","ts":"2024-10-25T16:06:03.324931Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"d6b41b608ff76c2 received MsgPreVoteResp from d6b41b608ff76c2 at term 2"}
{"level":"info","ts":"2024-10-25T16:06:03.325139Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"d6b41b608ff76c2 became candidate at term 3"}
{"level":"info","ts":"2024-10-25T16:06:03.325218Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"d6b41b608ff76c2 received MsgVoteResp from d6b41b608ff76c2 at term 3"}
{"level":"info","ts":"2024-10-25T16:06:03.325268Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"d6b41b608ff76c2 became leader at term 3"}
{"level":"info","ts":"2024-10-25T16:06:03.325312Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"raft.node: d6b41b608ff76c2 elected leader d6b41b608ff76c2 at term 3"}
{"level":"info","ts":"2024-10-25T16:06:03.327429Z","caller":"etcdserver/server.go:2118","msg":"published local member to cluster through raft","local-member-id":"d6b41b608ff76c2","local-member-attributes":"{Name:k8s-controller-01 ClientURLs:[https://192.168.1.105:2379]}","request-path":"/0/members/d6b41b608ff76c2/attributes","cluster-id":"83091f3be7e839ed","publish-timeout":"7s"}
{"level":"info","ts":"2024-10-25T16:06:03.328801Z","caller":"embed/serve.go:103","msg":"ready to serve client requests"}
{"level":"info","ts":"2024-10-25T16:06:03.329979Z","caller":"embed/serve.go:103","msg":"ready to serve client requests"}
{"level":"info","ts":"2024-10-25T16:06:03.334165Z","caller":"etcdmain/main.go:44","msg":"notifying init daemon"}
{"level":"info","ts":"2024-10-25T16:06:03.334982Z","caller":"etcdmain/main.go:50","msg":"successfully notified init daemon"}
{"level":"info","ts":"2024-10-25T16:06:03.337303Z","caller":"v3rpc/health.go:61","msg":"grpc service status changed","service":"","status":"SERVING"}
{"level":"info","ts":"2024-10-25T16:06:03.338159Z","caller":"embed/serve.go:250","msg":"serving client traffic securely","traffic":"grpc+http","address":"127.0.0.1:2379"}
{"level":"info","ts":"2024-10-25T16:06:03.337313Z","caller":"v3rpc/health.go:61","msg":"grpc service status changed","service":"","status":"SERVING"}
{"level":"info","ts":"2024-10-25T16:06:03.346259Z","caller":"embed/serve.go:250","msg":"serving client traffic securely","traffic":"grpc+http","address":"192.168.1.105:2379"}
{"level":"warn","ts":"2024-10-25T16:10:21.156792Z","caller":"embed/config_logging.go:170","msg":"rejected connection on client endpoint","remote-addr":"192.168.1.105:52050","server-name":"","error":"tls: first record does not look like a TLS handshake"}
{"level":"warn","ts":"2024-10-25T16:10:22.159292Z","caller":"embed/config_logging.go:170","msg":"rejected connection on client endpoint","remote-addr":"192.168.1.105:52054","server-name":"","error":"tls: first record does not look like a TLS handshake"}
{"level":"warn","ts":"2024-10-25T16:10:23.740857Z","caller":"embed/config_logging.go:170","msg":"rejected connection on client endpoint","remote-addr":"192.168.1.105:52056","server-name":"","error":"tls: first record does not look like a TLS handshake"}
{"level":"info","ts":"2024-10-25T16:16:04.707836Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":13865}
{"level":"info","ts":"2024-10-25T16:16:04.731593Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":13865,"took":"23.531539ms","hash":3181415178,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":921600,"current-db-size-in-use":"922 kB"}
{"level":"info","ts":"2024-10-25T16:16:04.731652Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":3181415178,"revision":13865,"compact-revision":12856}
{"level":"info","ts":"2024-10-25T16:21:04.720722Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":14255}
{"level":"info","ts":"2024-10-25T16:21:04.725758Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":14255,"took":"4.900866ms","hash":2548967288,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":1040384,"current-db-size-in-use":"1.0 MB"}
{"level":"info","ts":"2024-10-25T16:21:04.725814Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":2548967288,"revision":14255,"compact-revision":13865}
{"level":"info","ts":"2024-10-25T16:26:04.733779Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":14645}
{"level":"info","ts":"2024-10-25T16:26:04.739975Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":14645,"took":"5.890036ms","hash":2385143609,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":1032192,"current-db-size-in-use":"1.0 MB"}
{"level":"info","ts":"2024-10-25T16:26:04.740199Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":2385143609,"revision":14645,"compact-revision":14255}
{"level":"info","ts":"2024-10-25T16:31:04.743515Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":15037}
{"level":"info","ts":"2024-10-25T16:31:04.748308Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":15037,"took":"4.185659ms","hash":2130029502,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":1015808,"current-db-size-in-use":"1.0 MB"}
{"level":"info","ts":"2024-10-25T16:31:04.748445Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":2130029502,"revision":15037,"compact-revision":14645}
{"level":"info","ts":"2024-10-25T16:36:04.752826Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":15427}
{"level":"info","ts":"2024-10-25T16:36:04.757811Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":15427,"took":"4.259074ms","hash":2016828784,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":1011712,"current-db-size-in-use":"1.0 MB"}
{"level":"info","ts":"2024-10-25T16:36:04.758026Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":2016828784,"revision":15427,"compact-revision":15037}
{"level":"info","ts":"2024-10-25T16:41:04.767463Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":15817}
{"level":"info","ts":"2024-10-25T16:41:04.773349Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":15817,"took":"5.663367ms","hash":772029803,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":1015808,"current-db-size-in-use":"1.0 MB"}
{"level":"info","ts":"2024-10-25T16:41:04.773425Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":772029803,"revision":15817,"compact-revision":15427}
{"level":"info","ts":"2024-10-25T16:46:04.784461Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":16207}
{"level":"info","ts":"2024-10-25T16:46:04.788799Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":16207,"took":"4.215755ms","hash":3801981196,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":1007616,"current-db-size-in-use":"1.0 MB"}
{"level":"info","ts":"2024-10-25T16:46:04.788857Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":3801981196,"revision":16207,"compact-revision":15817}
{"level":"info","ts":"2024-10-25T16:51:04.799107Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":16597}
{"level":"info","ts":"2024-10-25T16:51:04.803016Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":16597,"took":"3.310343ms","hash":1329446997,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":1028096,"current-db-size-in-use":"1.0 MB"}
{"level":"info","ts":"2024-10-25T16:51:04.803411Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":1329446997,"revision":16597,"compact-revision":16207}
{"level":"info","ts":"2024-10-25T16:54:58.767432Z","caller":"etcdserver/server.go:1451","msg":"triggering snapshot","local-member-id":"d6b41b608ff76c2","local-member-applied-index":20002,"local-member-snapshot-index":10001,"local-member-snapshot-count":10000}
{"level":"info","ts":"2024-10-25T16:54:58.774991Z","caller":"etcdserver/server.go:2471","msg":"saved snapshot","snapshot-index":20002}
{"level":"info","ts":"2024-10-25T16:54:58.775443Z","caller":"etcdserver/server.go:2501","msg":"compacted Raft logs","compact-index":15002}
{"level":"info","ts":"2024-10-25T16:56:04.812810Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":16989}
{"level":"info","ts":"2024-10-25T16:56:04.816554Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":16989,"took":"3.287171ms","hash":672024271,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":1015808,"current-db-size-in-use":"1.0 MB"}
{"level":"info","ts":"2024-10-25T16:56:04.816584Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":672024271,"revision":16989,"compact-revision":16597}
{"level":"info","ts":"2024-10-25T17:01:04.827475Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":17377}
{"level":"info","ts":"2024-10-25T17:01:04.831065Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":17377,"took":"3.397467ms","hash":3923468715,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":1015808,"current-db-size-in-use":"1.0 MB"}
{"level":"info","ts":"2024-10-25T17:01:04.831123Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":3923468715,"revision":17377,"compact-revision":16989}
{"level":"info","ts":"2024-10-25T17:06:04.842529Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":17769}
{"level":"info","ts":"2024-10-25T17:06:04.847116Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":17769,"took":"4.165135ms","hash":2769939704,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":1024000,"current-db-size-in-use":"1.0 MB"}
{"level":"info","ts":"2024-10-25T17:06:04.847215Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":2769939704,"revision":17769,"compact-revision":17377}
{"level":"info","ts":"2024-10-25T17:11:04.854349Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":18159}
{"level":"info","ts":"2024-10-25T17:11:04.866879Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":18159,"took":"11.910794ms","hash":4093110179,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":1007616,"current-db-size-in-use":"1.0 MB"}
{"level":"info","ts":"2024-10-25T17:11:04.866964Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":4093110179,"revision":18159,"compact-revision":17769}
{"level":"info","ts":"2024-10-25T17:16:04.867990Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":18553}
{"level":"info","ts":"2024-10-25T17:16:04.871891Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":18553,"took":"3.74594ms","hash":3340311663,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":1019904,"current-db-size-in-use":"1.0 MB"}
{"level":"info","ts":"2024-10-25T17:16:04.871949Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":3340311663,"revision":18553,"compact-revision":18159}
{"level":"info","ts":"2024-10-25T17:21:04.886268Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":18942}
{"level":"info","ts":"2024-10-25T17:21:04.890252Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":18942,"took":"3.829723ms","hash":3591806357,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":962560,"current-db-size-in-use":"963 kB"}
{"level":"info","ts":"2024-10-25T17:21:04.890323Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":3591806357,"revision":18942,"compact-revision":18553}
{"level":"info","ts":"2024-10-25T17:26:04.902783Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":19332}
{"level":"info","ts":"2024-10-25T17:26:04.908836Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":19332,"took":"5.613306ms","hash":3890640451,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":958464,"current-db-size-in-use":"958 kB"}
{"level":"info","ts":"2024-10-25T17:26:04.908900Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":3890640451,"revision":19332,"compact-revision":18942}
{"level":"info","ts":"2024-10-25T17:31:04.913783Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":19723}
{"level":"info","ts":"2024-10-25T17:31:04.918455Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":19723,"took":"4.517162ms","hash":2677319210,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":950272,"current-db-size-in-use":"950 kB"}
{"level":"info","ts":"2024-10-25T17:31:04.918519Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":2677319210,"revision":19723,"compact-revision":19332}
{"level":"info","ts":"2024-10-25T17:36:04.928937Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":20114}
{"level":"info","ts":"2024-10-25T17:36:04.933857Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":20114,"took":"4.368588ms","hash":175420664,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":946176,"current-db-size-in-use":"946 kB"}
{"level":"info","ts":"2024-10-25T17:36:04.933890Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":175420664,"revision":20114,"compact-revision":19723}
{"level":"info","ts":"2024-10-25T17:41:04.946529Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":20502}
{"level":"info","ts":"2024-10-25T17:41:04.950820Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":20502,"took":"4.150306ms","hash":2551214008,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":966656,"current-db-size-in-use":"967 kB"}
{"level":"info","ts":"2024-10-25T17:41:04.950877Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":2551214008,"revision":20502,"compact-revision":20114}
{"level":"info","ts":"2024-10-25T17:46:04.961321Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":20893}
{"level":"info","ts":"2024-10-25T17:46:04.965233Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":20893,"took":"3.717753ms","hash":2311437647,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":962560,"current-db-size-in-use":"963 kB"}
{"level":"info","ts":"2024-10-25T17:46:04.965391Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":2311437647,"revision":20893,"compact-revision":20502}
{"level":"info","ts":"2024-10-25T17:51:04.976675Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":21284}
{"level":"info","ts":"2024-10-25T17:51:04.981532Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":21284,"took":"4.091363ms","hash":3108019435,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":954368,"current-db-size-in-use":"954 kB"}
{"level":"info","ts":"2024-10-25T17:51:04.981616Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":3108019435,"revision":21284,"compact-revision":20893}
{"level":"info","ts":"2024-10-25T17:56:04.990866Z","caller":"mvcc/index.go:214","msg":"compact tree index","revision":21674}
{"level":"info","ts":"2024-10-25T17:56:04.994913Z","caller":"mvcc/kvstore_compaction.go:69","msg":"finished scheduled compaction","compact-revision":21674,"took":"3.911634ms","hash":1507506766,"current-db-size-bytes":1642496,"current-db-size":"1.6 MB","current-db-size-in-use-bytes":966656,"current-db-size-in-use":"967 kB"}
{"level":"info","ts":"2024-10-25T17:56:04.995230Z","caller":"mvcc/hash.go:137","msg":"storing new hash","hash":1507506766,"revision":21674,"compact-revision":21284}
==== END logs for container etcd of pod kube-system/etcd-k8s-controller-01 ====
==== START logs for container kube-apiserver of pod kube-system/kube-apiserver-k8s-controller-01 ====
I1025 16:06:02.224736       1 options.go:220] external host was not specified, using 192.168.1.105
I1025 16:06:02.237575       1 server.go:148] Version: v1.28.15
I1025 16:06:02.237647       1 server.go:150] "Golang settings" GOGC="" GOMAXPROCS="" GOTRACEBACK=""
I1025 16:06:03.201043       1 shared_informer.go:311] Waiting for caches to sync for node_authorizer
I1025 16:06:03.237813       1 plugins.go:158] Loaded 12 mutating admission controller(s) successfully in the following order: NamespaceLifecycle,LimitRanger,ServiceAccount,NodeRestriction,TaintNodesByCondition,Priority,DefaultTolerationSeconds,DefaultStorageClass,StorageObjectInUseProtection,RuntimeClass,DefaultIngressClass,MutatingAdmissionWebhook.
I1025 16:06:03.238497       1 plugins.go:161] Loaded 13 validating admission controller(s) successfully in the following order: LimitRanger,ServiceAccount,PodSecurity,Priority,PersistentVolumeClaimResize,RuntimeClass,CertificateApproval,CertificateSigning,ClusterTrustBundleAttest,CertificateSubjectRestriction,ValidatingAdmissionPolicy,ValidatingAdmissionWebhook,ResourceQuota.
I1025 16:06:03.239867       1 instance.go:298] Using reconciler: lease
I1025 16:06:03.489309       1 handler.go:275] Adding GroupVersion apiextensions.k8s.io v1 to ResourceManager
W1025 16:06:03.489475       1 genericapiserver.go:744] Skipping API apiextensions.k8s.io/v1beta1 because it has no resources.
I1025 16:06:03.940177       1 handler.go:275] Adding GroupVersion  v1 to ResourceManager
I1025 16:06:03.940830       1 instance.go:709] API group "internal.apiserver.k8s.io" is not enabled, skipping.
I1025 16:06:04.539508       1 instance.go:709] API group "resource.k8s.io" is not enabled, skipping.
I1025 16:06:04.595889       1 handler.go:275] Adding GroupVersion authentication.k8s.io v1 to ResourceManager
W1025 16:06:04.606059       1 genericapiserver.go:744] Skipping API authentication.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.606125       1 genericapiserver.go:744] Skipping API authentication.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.607024       1 handler.go:275] Adding GroupVersion authorization.k8s.io v1 to ResourceManager
W1025 16:06:04.607108       1 genericapiserver.go:744] Skipping API authorization.k8s.io/v1beta1 because it has no resources.
I1025 16:06:04.608131       1 handler.go:275] Adding GroupVersion autoscaling v2 to ResourceManager
I1025 16:06:04.608946       1 handler.go:275] Adding GroupVersion autoscaling v1 to ResourceManager
W1025 16:06:04.609026       1 genericapiserver.go:744] Skipping API autoscaling/v2beta1 because it has no resources.
W1025 16:06:04.609073       1 genericapiserver.go:744] Skipping API autoscaling/v2beta2 because it has no resources.
I1025 16:06:04.610631       1 handler.go:275] Adding GroupVersion batch v1 to ResourceManager
W1025 16:06:04.610724       1 genericapiserver.go:744] Skipping API batch/v1beta1 because it has no resources.
I1025 16:06:04.612555       1 handler.go:275] Adding GroupVersion certificates.k8s.io v1 to ResourceManager
W1025 16:06:04.612682       1 genericapiserver.go:744] Skipping API certificates.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.612773       1 genericapiserver.go:744] Skipping API certificates.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.613581       1 handler.go:275] Adding GroupVersion coordination.k8s.io v1 to ResourceManager
W1025 16:06:04.613671       1 genericapiserver.go:744] Skipping API coordination.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.613760       1 genericapiserver.go:744] Skipping API discovery.k8s.io/v1beta1 because it has no resources.
I1025 16:06:04.614323       1 handler.go:275] Adding GroupVersion discovery.k8s.io v1 to ResourceManager
I1025 16:06:04.615996       1 handler.go:275] Adding GroupVersion networking.k8s.io v1 to ResourceManager
W1025 16:06:04.616151       1 genericapiserver.go:744] Skipping API networking.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.616207       1 genericapiserver.go:744] Skipping API networking.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.616717       1 handler.go:275] Adding GroupVersion node.k8s.io v1 to ResourceManager
W1025 16:06:04.616780       1 genericapiserver.go:744] Skipping API node.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.616827       1 genericapiserver.go:744] Skipping API node.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.617578       1 handler.go:275] Adding GroupVersion policy v1 to ResourceManager
W1025 16:06:04.617637       1 genericapiserver.go:744] Skipping API policy/v1beta1 because it has no resources.
I1025 16:06:04.619330       1 handler.go:275] Adding GroupVersion rbac.authorization.k8s.io v1 to ResourceManager
W1025 16:06:04.619400       1 genericapiserver.go:744] Skipping API rbac.authorization.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.619449       1 genericapiserver.go:744] Skipping API rbac.authorization.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.619913       1 handler.go:275] Adding GroupVersion scheduling.k8s.io v1 to ResourceManager
W1025 16:06:04.619967       1 genericapiserver.go:744] Skipping API scheduling.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.620010       1 genericapiserver.go:744] Skipping API scheduling.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.630213       1 handler.go:275] Adding GroupVersion storage.k8s.io v1 to ResourceManager
W1025 16:06:04.630417       1 genericapiserver.go:744] Skipping API storage.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.630483       1 genericapiserver.go:744] Skipping API storage.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.632629       1 handler.go:275] Adding GroupVersion flowcontrol.apiserver.k8s.io v1beta3 to ResourceManager
I1025 16:06:04.635149       1 handler.go:275] Adding GroupVersion flowcontrol.apiserver.k8s.io v1beta2 to ResourceManager
W1025 16:06:04.635183       1 genericapiserver.go:744] Skipping API flowcontrol.apiserver.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.635194       1 genericapiserver.go:744] Skipping API flowcontrol.apiserver.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.646340       1 handler.go:275] Adding GroupVersion apps v1 to ResourceManager
W1025 16:06:04.646538       1 genericapiserver.go:744] Skipping API apps/v1beta2 because it has no resources.
W1025 16:06:04.646591       1 genericapiserver.go:744] Skipping API apps/v1beta1 because it has no resources.
I1025 16:06:04.648396       1 handler.go:275] Adding GroupVersion admissionregistration.k8s.io v1 to ResourceManager
W1025 16:06:04.648466       1 genericapiserver.go:744] Skipping API admissionregistration.k8s.io/v1beta1 because it has no resources.
W1025 16:06:04.648513       1 genericapiserver.go:744] Skipping API admissionregistration.k8s.io/v1alpha1 because it has no resources.
I1025 16:06:04.649634       1 handler.go:275] Adding GroupVersion events.k8s.io v1 to ResourceManager
W1025 16:06:04.649690       1 genericapiserver.go:744] Skipping API events.k8s.io/v1beta1 because it has no resources.
I1025 16:06:04.699657       1 handler.go:275] Adding GroupVersion apiregistration.k8s.io v1 to ResourceManager
W1025 16:06:04.699763       1 genericapiserver.go:744] Skipping API apiregistration.k8s.io/v1beta1 because it has no resources.
I1025 16:06:05.727943       1 dynamic_cafile_content.go:157] "Starting controller" name="request-header::/etc/kubernetes/pki/front-proxy-ca.crt"
I1025 16:06:05.729162       1 secure_serving.go:213] Serving securely on [::]:6443
I1025 16:06:05.729525       1 dynamic_cafile_content.go:157] "Starting controller" name="client-ca-bundle::/etc/kubernetes/pki/ca.crt"
I1025 16:06:05.731651       1 dynamic_serving_content.go:132] "Starting controller" name="aggregator-proxy-cert::/etc/kubernetes/pki/front-proxy-client.crt::/etc/kubernetes/pki/front-proxy-client.key"
I1025 16:06:05.731813       1 available_controller.go:423] Starting AvailableConditionController
I1025 16:06:05.731930       1 cache.go:32] Waiting for caches to sync for AvailableConditionController controller
I1025 16:06:05.732069       1 customresource_discovery_controller.go:289] Starting DiscoveryController
I1025 16:06:05.732221       1 gc_controller.go:78] Starting apiserver lease garbage collector
I1025 16:06:05.732574       1 apf_controller.go:374] Starting API Priority and Fairness config controller
I1025 16:06:05.732595       1 controller.go:80] Starting OpenAPI V3 AggregationController
I1025 16:06:05.732612       1 aggregator.go:164] waiting for initial CRD sync...
I1025 16:06:05.734146       1 controller.go:116] Starting legacy_token_tracking_controller
I1025 16:06:05.734272       1 shared_informer.go:311] Waiting for caches to sync for configmaps
I1025 16:06:05.734341       1 handler_discovery.go:412] Starting ResourceDiscoveryManager
I1025 16:06:05.734542       1 controller.go:78] Starting OpenAPI AggregationController
I1025 16:06:05.735344       1 cluster_authentication_trust_controller.go:440] Starting cluster_authentication_trust_controller controller
I1025 16:06:05.735935       1 shared_informer.go:311] Waiting for caches to sync for cluster_authentication_trust_controller
I1025 16:06:05.736269       1 gc_controller.go:78] Starting apiserver lease garbage collector
I1025 16:06:05.736883       1 controller.go:134] Starting OpenAPI controller
I1025 16:06:05.737178       1 controller.go:85] Starting OpenAPI V3 controller
I1025 16:06:05.737265       1 naming_controller.go:291] Starting NamingConditionController
I1025 16:06:05.737335       1 establishing_controller.go:76] Starting EstablishingController
I1025 16:06:05.737418       1 nonstructuralschema_controller.go:192] Starting NonStructuralSchemaConditionController
I1025 16:06:05.737619       1 apiapproval_controller.go:186] Starting KubernetesAPIApprovalPolicyConformantConditionController
I1025 16:06:05.737771       1 crd_finalizer.go:266] Starting CRDFinalizer
I1025 16:06:05.738407       1 system_namespaces_controller.go:67] Starting system namespaces controller
I1025 16:06:05.738647       1 apiservice_controller.go:97] Starting APIServiceRegistrationController
I1025 16:06:05.738776       1 cache.go:32] Waiting for caches to sync for APIServiceRegistrationController controller
I1025 16:06:05.747355       1 crdregistration_controller.go:111] Starting crd-autoregister controller
I1025 16:06:05.747380       1 shared_informer.go:311] Waiting for caches to sync for crd-autoregister
I1025 16:06:05.734694       1 dynamic_serving_content.go:132] "Starting controller" name="serving-cert::/etc/kubernetes/pki/apiserver.crt::/etc/kubernetes/pki/apiserver.key"
I1025 16:06:05.747750       1 dynamic_cafile_content.go:157] "Starting controller" name="client-ca-bundle::/etc/kubernetes/pki/ca.crt"
I1025 16:06:05.747912       1 dynamic_cafile_content.go:157] "Starting controller" name="request-header::/etc/kubernetes/pki/front-proxy-ca.crt"
I1025 16:06:05.734707       1 tlsconfig.go:240] "Starting DynamicServingCertificateController"
I1025 16:06:05.898818       1 controller.go:624] quota admission added evaluator for: leases.coordination.k8s.io
I1025 16:06:05.908457       1 shared_informer.go:318] Caches are synced for node_authorizer
I1025 16:06:05.932713       1 apf_controller.go:379] Running API Priority and Fairness config worker
I1025 16:06:05.933015       1 apf_controller.go:382] Running API Priority and Fairness periodic rebalancing process
I1025 16:06:05.934075       1 cache.go:39] Caches are synced for AvailableConditionController controller
I1025 16:06:05.934983       1 shared_informer.go:318] Caches are synced for configmaps
I1025 16:06:05.938958       1 cache.go:39] Caches are synced for APIServiceRegistrationController controller
I1025 16:06:05.945551       1 shared_informer.go:318] Caches are synced for cluster_authentication_trust_controller
I1025 16:06:05.951818       1 shared_informer.go:318] Caches are synced for crd-autoregister
I1025 16:06:05.952359       1 aggregator.go:166] initial CRD sync complete...
I1025 16:06:05.952516       1 autoregister_controller.go:141] Starting autoregister controller
I1025 16:06:05.952599       1 cache.go:32] Waiting for caches to sync for autoregister controller
I1025 16:06:05.952668       1 cache.go:39] Caches are synced for autoregister controller
E1025 16:06:06.013803       1 controller.go:97] Error removing old endpoints from kubernetes service: no API server IP addresses were listed in storage, refusing to erase all endpoints for the kubernetes Service
I1025 16:06:06.741535       1 storage_scheduling.go:111] all system priority classes are created successfully or already exist.
==== END logs for container kube-apiserver of pod kube-system/kube-apiserver-k8s-controller-01 ====
==== START logs for container kube-controller-manager of pod kube-system/kube-controller-manager-k8s-controller-01 ====
I1025 16:06:03.138991       1 serving.go:348] Generated self-signed cert in-memory
I1025 16:06:04.026436       1 controllermanager.go:189] "Starting" version="v1.28.15"
I1025 16:06:04.026493       1 controllermanager.go:191] "Golang settings" GOGC="" GOMAXPROCS="" GOTRACEBACK=""
I1025 16:06:04.038415       1 secure_serving.go:213] Serving securely on 127.0.0.1:10257
I1025 16:06:04.042711       1 tlsconfig.go:240] "Starting DynamicServingCertificateController"
I1025 16:06:04.042885       1 dynamic_cafile_content.go:157] "Starting controller" name="request-header::/etc/kubernetes/pki/front-proxy-ca.crt"
I1025 16:06:04.043346       1 dynamic_cafile_content.go:157] "Starting controller" name="client-ca-bundle::/etc/kubernetes/pki/ca.crt"
I1025 16:06:04.049915       1 leaderelection.go:250] attempting to acquire leader lease kube-system/kube-controller-manager...
E1025 16:06:05.795853       1 leaderelection.go:332] error retrieving resource lock kube-system/kube-controller-manager: leases.coordination.k8s.io "kube-controller-manager" is forbidden: User "system:kube-controller-manager" cannot get resource "leases" in API group "coordination.k8s.io" in the namespace "kube-system"
I1025 16:06:25.810048       1 leaderelection.go:260] successfully acquired lease kube-system/kube-controller-manager
I1025 16:06:25.812390       1 event.go:307] "Event occurred" object="kube-system/kube-controller-manager" fieldPath="" kind="Lease" apiVersion="coordination.k8s.io/v1" type="Normal" reason="LeaderElection" message="k8s-controller-01_4df8127c-ac19-462b-bf57-be6656e61d6a became leader"
I1025 16:06:25.837945       1 shared_informer.go:311] Waiting for caches to sync for tokens
I1025 16:06:25.847082       1 controllermanager.go:642] "Started controller" controller="persistentvolume-attach-detach-controller"
I1025 16:06:25.851871       1 attach_detach_controller.go:337] "Starting attach detach controller"
I1025 16:06:25.851922       1 shared_informer.go:311] Waiting for caches to sync for attach detach
I1025 16:06:25.853943       1 controllermanager.go:642] "Started controller" controller="statefulset-controller"
I1025 16:06:25.856667       1 stateful_set.go:163] "Starting stateful set controller"
I1025 16:06:25.856720       1 shared_informer.go:311] Waiting for caches to sync for stateful set
I1025 16:06:25.860267       1 controllermanager.go:642] "Started controller" controller="cronjob-controller"
I1025 16:06:25.861616       1 cronjob_controllerv2.go:139] "Starting cronjob controller v2"
I1025 16:06:25.861643       1 shared_informer.go:311] Waiting for caches to sync for cronjob
I1025 16:06:25.866610       1 node_lifecycle_controller.go:431] "Controller will reconcile labels"
I1025 16:06:25.866968       1 controllermanager.go:642] "Started controller" controller="node-lifecycle-controller"
I1025 16:06:25.867394       1 core.go:228] "Warning: configure-cloud-routes is set, but no cloud provider specified. Will not configure cloud provider routes."
I1025 16:06:25.867518       1 controllermanager.go:620] "Warning: skipping controller" controller="node-route-controller"
I1025 16:06:25.867168       1 node_lifecycle_controller.go:465] "Sending events to api server"
I1025 16:06:25.867683       1 node_lifecycle_controller.go:476] "Starting node controller"
I1025 16:06:25.867887       1 shared_informer.go:311] Waiting for caches to sync for taint
I1025 16:06:25.871661       1 controllermanager.go:642] "Started controller" controller="endpoints-controller"
I1025 16:06:25.871842       1 endpoints_controller.go:177] "Starting endpoint controller"
I1025 16:06:25.871921       1 shared_informer.go:311] Waiting for caches to sync for endpoint
I1025 16:06:25.876218       1 controllermanager.go:642] "Started controller" controller="replicationcontroller-controller"
I1025 16:06:25.876472       1 replica_set.go:214] "Starting controller" name="replicationcontroller"
I1025 16:06:25.876483       1 shared_informer.go:311] Waiting for caches to sync for ReplicationController
I1025 16:06:25.889007       1 garbagecollector.go:155] "Starting controller" controller="garbagecollector"
I1025 16:06:25.889724       1 shared_informer.go:311] Waiting for caches to sync for garbage collector
I1025 16:06:25.889785       1 graph_builder.go:294] "Running" component="GraphBuilder"
I1025 16:06:25.889923       1 controllermanager.go:642] "Started controller" controller="garbage-collector-controller"
I1025 16:06:25.894156       1 controllermanager.go:642] "Started controller" controller="ttl-after-finished-controller"
I1025 16:06:25.896244       1 ttlafterfinished_controller.go:109] "Starting TTL after finished controller"
I1025 16:06:25.896947       1 shared_informer.go:311] Waiting for caches to sync for TTL after finished
I1025 16:06:25.904937       1 controllermanager.go:642] "Started controller" controller="pod-garbage-collector-controller"
I1025 16:06:25.909902       1 gc_controller.go:101] "Starting GC controller"
I1025 16:06:25.910095       1 shared_informer.go:311] Waiting for caches to sync for GC
I1025 16:06:25.934173       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="replicasets.apps"
I1025 16:06:25.934539       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="horizontalpodautoscalers.autoscaling"
I1025 16:06:25.934661       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="csistoragecapacities.storage.k8s.io"
I1025 16:06:25.935260       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="controllerrevisions.apps"
I1025 16:06:25.935320       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="statefulsets.apps"
I1025 16:06:25.935602       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="limitranges"
I1025 16:06:25.937017       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="rolebindings.rbac.authorization.k8s.io"
I1025 16:06:25.937077       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="leases.coordination.k8s.io"
I1025 16:06:25.937103       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="endpointslices.discovery.k8s.io"
I1025 16:06:25.937608       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="podtemplates"
I1025 16:06:25.937679       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="jobs.batch"
I1025 16:06:25.937907       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="poddisruptionbudgets.policy"
I1025 16:06:25.937970       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="endpoints"
I1025 16:06:25.937992       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="deployments.apps"
W1025 16:06:25.938001       1 shared_informer.go:593] resyncPeriod 23h1m48.454890448s is smaller than resyncCheckPeriod 23h4m48.051464933s and the informer has already started. Changing it to 23h4m48.051464933s
I1025 16:06:25.938084       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="networkpolicies.networking.k8s.io"
I1025 16:06:25.938461       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="ingresses.networking.k8s.io"
I1025 16:06:25.938421       1 shared_informer.go:318] Caches are synced for tokens
I1025 16:06:25.938494       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="roles.rbac.authorization.k8s.io"
I1025 16:06:25.938540       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="serviceaccounts"
I1025 16:06:25.938553       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="daemonsets.apps"
I1025 16:06:25.938565       1 resource_quota_monitor.go:224] "QuotaMonitor created object count evaluator" resource="cronjobs.batch"
I1025 16:06:25.938597       1 controllermanager.go:642] "Started controller" controller="resourcequota-controller"
I1025 16:06:25.938656       1 resource_quota_controller.go:294] "Starting resource quota controller"
I1025 16:06:25.938663       1 shared_informer.go:311] Waiting for caches to sync for resource quota
I1025 16:06:25.938673       1 resource_quota_monitor.go:305] "QuotaMonitor running"
I1025 16:06:25.941789       1 controllermanager.go:642] "Started controller" controller="token-cleaner-controller"
I1025 16:06:25.944030       1 tokencleaner.go:112] "Starting token cleaner controller"
I1025 16:06:25.944658       1 shared_informer.go:311] Waiting for caches to sync for token_cleaner
I1025 16:06:25.945639       1 shared_informer.go:318] Caches are synced for token_cleaner
I1025 16:06:37.258446       1 range_allocator.go:111] "No Secondary Service CIDR provided. Skipping filtering out secondary service addresses"
I1025 16:06:37.258500       1 controllermanager.go:642] "Started controller" controller="node-ipam-controller"
I1025 16:06:37.258668       1 node_ipam_controller.go:162] "Starting ipam controller"
I1025 16:06:37.258679       1 shared_informer.go:311] Waiting for caches to sync for node
I1025 16:06:37.263004       1 controllermanager.go:642] "Started controller" controller="endpointslice-controller"
I1025 16:06:37.264070       1 endpointslice_controller.go:273] "Starting endpoint slice controller"
I1025 16:06:37.264167       1 shared_informer.go:311] Waiting for caches to sync for endpoint_slice
I1025 16:06:37.277248       1 controllermanager.go:642] "Started controller" controller="namespace-controller"
I1025 16:06:37.278980       1 namespace_controller.go:197] "Starting namespace controller"
I1025 16:06:37.279514       1 shared_informer.go:311] Waiting for caches to sync for namespace
I1025 16:06:37.280086       1 controllermanager.go:642] "Started controller" controller="certificatesigningrequest-approving-controller"
I1025 16:06:37.281875       1 certificate_controller.go:115] "Starting certificate controller" name="csrapproving"
I1025 16:06:37.283604       1 shared_informer.go:311] Waiting for caches to sync for certificate-csrapproving
I1025 16:06:37.286193       1 controllermanager.go:642] "Started controller" controller="bootstrap-signer-controller"
I1025 16:06:37.286517       1 shared_informer.go:311] Waiting for caches to sync for bootstrap_signer
I1025 16:06:37.289318       1 controllermanager.go:642] "Started controller" controller="persistentvolume-expander-controller"
I1025 16:06:37.290567       1 expand_controller.go:328] "Starting expand controller"
I1025 16:06:37.290586       1 shared_informer.go:311] Waiting for caches to sync for expand
I1025 16:06:37.313616       1 controllermanager.go:642] "Started controller" controller="persistentvolumeclaim-protection-controller"
I1025 16:06:37.314116       1 pvc_protection_controller.go:102] "Starting PVC protection controller"
I1025 16:06:37.314162       1 shared_informer.go:311] Waiting for caches to sync for PVC protection
I1025 16:06:37.320590       1 controllermanager.go:642] "Started controller" controller="serviceaccount-controller"
I1025 16:06:37.320837       1 serviceaccounts_controller.go:111] "Starting service account controller"
I1025 16:06:37.322520       1 shared_informer.go:311] Waiting for caches to sync for service account
I1025 16:06:37.328978       1 controllermanager.go:642] "Started controller" controller="horizontal-pod-autoscaler-controller"
I1025 16:06:37.333146       1 controllermanager.go:642] "Started controller" controller="certificatesigningrequest-cleaner-controller"
I1025 16:06:37.333402       1 horizontal.go:200] "Starting HPA controller"
I1025 16:06:37.334742       1 shared_informer.go:311] Waiting for caches to sync for HPA
I1025 16:06:37.333539       1 cleaner.go:83] "Starting CSR cleaner controller"
E1025 16:06:37.338313       1 core.go:92] "Failed to start service controller" err="WARNING: no cloud provider provided, services of type LoadBalancer will fail"
I1025 16:06:37.340138       1 controllermanager.go:620] "Warning: skipping controller" controller="service-lb-controller"
I1025 16:06:37.345185       1 controllermanager.go:642] "Started controller" controller="job-controller"
I1025 16:06:37.347834       1 job_controller.go:226] "Starting job controller"
I1025 16:06:37.348506       1 shared_informer.go:311] Waiting for caches to sync for job
I1025 16:06:37.352941       1 controllermanager.go:642] "Started controller" controller="persistentvolume-binder-controller"
I1025 16:06:37.354851       1 pv_controller_base.go:319] "Starting persistent volume controller"
I1025 16:06:37.354998       1 shared_informer.go:311] Waiting for caches to sync for persistent volume
I1025 16:06:37.356443       1 controllermanager.go:642] "Started controller" controller="root-ca-certificate-publisher-controller"
I1025 16:06:37.356913       1 publisher.go:102] "Starting root CA cert publisher controller"
I1025 16:06:37.356928       1 shared_informer.go:311] Waiting for caches to sync for crt configmap
I1025 16:06:37.359138       1 controllermanager.go:642] "Started controller" controller="persistentvolume-protection-controller"
I1025 16:06:37.361465       1 pv_protection_controller.go:78] "Starting PV protection controller"
I1025 16:06:37.361948       1 shared_informer.go:311] Waiting for caches to sync for PV protection
I1025 16:06:37.363742       1 controllermanager.go:642] "Started controller" controller="ephemeral-volume-controller"
I1025 16:06:37.365018       1 controller.go:169] "Starting ephemeral volume controller"
I1025 16:06:37.365095       1 shared_informer.go:311] Waiting for caches to sync for ephemeral
I1025 16:06:37.366484       1 controllermanager.go:642] "Started controller" controller="endpointslice-mirroring-controller"
I1025 16:06:37.366757       1 endpointslicemirroring_controller.go:223] "Starting EndpointSliceMirroring controller"
I1025 16:06:37.367745       1 shared_informer.go:311] Waiting for caches to sync for endpoint_slice_mirroring
I1025 16:06:37.369264       1 controllermanager.go:642] "Started controller" controller="deployment-controller"
I1025 16:06:37.369447       1 deployment_controller.go:168] "Starting controller" controller="deployment"
I1025 16:06:37.369456       1 shared_informer.go:311] Waiting for caches to sync for deployment
I1025 16:06:37.373925       1 controllermanager.go:642] "Started controller" controller="ttl-controller"
I1025 16:06:37.374353       1 ttl_controller.go:124] "Starting TTL controller"
I1025 16:06:37.375271       1 shared_informer.go:311] Waiting for caches to sync for TTL
I1025 16:06:37.378745       1 controllermanager.go:642] "Started controller" controller="clusterrole-aggregation-controller"
I1025 16:06:37.379280       1 clusterroleaggregation_controller.go:189] "Starting ClusterRoleAggregator controller"
I1025 16:06:37.380443       1 shared_informer.go:311] Waiting for caches to sync for ClusterRoleAggregator
E1025 16:06:37.382471       1 core.go:213] "Failed to start cloud node lifecycle controller" err="no cloud provider provided"
I1025 16:06:37.382492       1 controllermanager.go:620] "Warning: skipping controller" controller="cloud-node-lifecycle-controller"
I1025 16:06:37.385069       1 controllermanager.go:642] "Started controller" controller="daemonset-controller"
I1025 16:06:37.385416       1 daemon_controller.go:291] "Starting daemon sets controller"
I1025 16:06:37.386438       1 shared_informer.go:311] Waiting for caches to sync for daemon sets
I1025 16:06:37.388049       1 controllermanager.go:642] "Started controller" controller="replicaset-controller"
I1025 16:06:37.389760       1 replica_set.go:214] "Starting controller" name="replicaset"
I1025 16:06:37.389783       1 shared_informer.go:311] Waiting for caches to sync for ReplicaSet
I1025 16:06:37.393403       1 controllermanager.go:642] "Started controller" controller="disruption-controller"
I1025 16:06:37.393710       1 disruption.go:433] "Sending events to api server."
I1025 16:06:37.393953       1 disruption.go:444] "Starting disruption controller"
I1025 16:06:37.394644       1 shared_informer.go:311] Waiting for caches to sync for disruption
I1025 16:06:37.399113       1 controllermanager.go:642] "Started controller" controller="certificatesigningrequest-signing-controller"
I1025 16:06:37.399670       1 certificate_controller.go:115] "Starting certificate controller" name="csrsigning-kubelet-serving"
I1025 16:06:37.402306       1 shared_informer.go:311] Waiting for caches to sync for certificate-csrsigning-kubelet-serving
I1025 16:06:37.399688       1 dynamic_serving_content.go:132] "Starting controller" name="csr-controller::/etc/kubernetes/pki/ca.crt::/etc/kubernetes/pki/ca.key"
I1025 16:06:37.399732       1 certificate_controller.go:115] "Starting certificate controller" name="csrsigning-kubelet-client"
I1025 16:06:37.402601       1 shared_informer.go:311] Waiting for caches to sync for certificate-csrsigning-kubelet-client
I1025 16:06:37.399745       1 dynamic_serving_content.go:132] "Starting controller" name="csr-controller::/etc/kubernetes/pki/ca.crt::/etc/kubernetes/pki/ca.key"
I1025 16:06:37.399775       1 certificate_controller.go:115] "Starting certificate controller" name="csrsigning-kube-apiserver-client"
I1025 16:06:37.402998       1 shared_informer.go:311] Waiting for caches to sync for certificate-csrsigning-kube-apiserver-client
I1025 16:06:37.399792       1 dynamic_serving_content.go:132] "Starting controller" name="csr-controller::/etc/kubernetes/pki/ca.crt::/etc/kubernetes/pki/ca.key"
I1025 16:06:37.400182       1 certificate_controller.go:115] "Starting certificate controller" name="csrsigning-legacy-unknown"
I1025 16:06:37.403482       1 shared_informer.go:311] Waiting for caches to sync for certificate-csrsigning-legacy-unknown
I1025 16:06:37.400193       1 dynamic_serving_content.go:132] "Starting controller" name="csr-controller::/etc/kubernetes/pki/ca.crt::/etc/kubernetes/pki/ca.key"
I1025 16:06:37.415571       1 shared_informer.go:311] Waiting for caches to sync for resource quota
I1025 16:06:37.468946       1 shared_informer.go:318] Caches are synced for endpoint_slice_mirroring
I1025 16:06:37.477955       1 actual_state_of_world.go:547] "Failed to update statusUpdateNeeded field in actual state of world" err="Failed to set statusUpdateNeeded to needed true, because nodeName=\"k8s-controller-01\" does not exist"
I1025 16:06:37.478248       1 shared_informer.go:318] Caches are synced for TTL
I1025 16:06:37.484592       1 shared_informer.go:318] Caches are synced for certificate-csrapproving
I1025 16:06:37.488373       1 shared_informer.go:318] Caches are synced for bootstrap_signer
I1025 16:06:37.491342       1 shared_informer.go:318] Caches are synced for TTL after finished
I1025 16:06:37.491555       1 shared_informer.go:318] Caches are synced for namespace
I1025 16:06:37.490838       1 shared_informer.go:318] Caches are synced for expand
I1025 16:06:37.496886       1 shared_informer.go:311] Waiting for caches to sync for garbage collector
I1025 16:06:37.503124       1 shared_informer.go:318] Caches are synced for certificate-csrsigning-kube-apiserver-client
I1025 16:06:37.503497       1 shared_informer.go:318] Caches are synced for GC
I1025 16:06:37.503859       1 shared_informer.go:318] Caches are synced for certificate-csrsigning-legacy-unknown
I1025 16:06:37.503940       1 shared_informer.go:318] Caches are synced for certificate-csrsigning-kubelet-serving
I1025 16:06:37.504017       1 shared_informer.go:318] Caches are synced for certificate-csrsigning-kubelet-client
I1025 16:06:37.514839       1 shared_informer.go:318] Caches are synced for PVC protection
I1025 16:06:37.524893       1 shared_informer.go:318] Caches are synced for service account
I1025 16:06:37.534903       1 shared_informer.go:318] Caches are synced for HPA
I1025 16:06:37.545836       1 shared_informer.go:318] Caches are synced for stateful set
I1025 16:06:37.549711       1 shared_informer.go:318] Caches are synced for job
I1025 16:06:37.550897       1 shared_informer.go:318] Caches are synced for cronjob
I1025 16:06:37.555815       1 shared_informer.go:318] Caches are synced for persistent volume
I1025 16:06:37.558589       1 shared_informer.go:318] Caches are synced for taint
I1025 16:06:37.558966       1 shared_informer.go:318] Caches are synced for crt configmap
I1025 16:06:37.559120       1 shared_informer.go:318] Caches are synced for node
I1025 16:06:37.559170       1 range_allocator.go:174] "Sending events to api server"
I1025 16:06:37.559203       1 range_allocator.go:178] "Starting range CIDR allocator"
I1025 16:06:37.559207       1 shared_informer.go:311] Waiting for caches to sync for cidrallocator
I1025 16:06:37.559211       1 shared_informer.go:318] Caches are synced for cidrallocator
I1025 16:06:37.559888       1 node_lifecycle_controller.go:1225] "Initializing eviction metric for zone" zone=""
I1025 16:06:37.560108       1 node_lifecycle_controller.go:877] "Missing timestamp for Node. Assuming now as a timestamp" node="k8s-controller-01"
I1025 16:06:37.561200       1 node_lifecycle_controller.go:1029] "Controller detected that all Nodes are not-Ready. Entering master disruption mode"
I1025 16:06:37.561318       1 taint_manager.go:205] "Starting NoExecuteTaintManager"
I1025 16:06:37.561377       1 shared_informer.go:318] Caches are synced for endpoint
I1025 16:06:37.561418       1 taint_manager.go:210] "Sending events to api server"
I1025 16:06:37.562490       1 shared_informer.go:318] Caches are synced for PV protection
I1025 16:06:37.563248       1 event.go:307] "Event occurred" object="k8s-controller-01" fieldPath="" kind="Node" apiVersion="v1" type="Normal" reason="RegisteredNode" message="Node k8s-controller-01 event: Registered Node k8s-controller-01 in Controller"
I1025 16:06:37.567227       1 shared_informer.go:318] Caches are synced for ReplicationController
I1025 16:06:37.567766       1 shared_informer.go:318] Caches are synced for endpoint_slice
I1025 16:06:37.567804       1 shared_informer.go:318] Caches are synced for ephemeral
I1025 16:06:37.578573       1 shared_informer.go:318] Caches are synced for deployment
I1025 16:06:37.581681       1 shared_informer.go:318] Caches are synced for ClusterRoleAggregator
I1025 16:06:37.587726       1 shared_informer.go:318] Caches are synced for daemon sets
I1025 16:06:37.615381       1 shared_informer.go:318] Caches are synced for disruption
I1025 16:06:37.615567       1 event.go:307] "Event occurred" object="kube-system/kube-proxy-p4jmn" fieldPath="" kind="Pod" apiVersion="v1" type="Warning" reason="NodeNotReady" message="Node is not ready"
I1025 16:06:37.617245       1 shared_informer.go:318] Caches are synced for ReplicaSet
I1025 16:06:37.622616       1 replica_set.go:676] "Finished syncing" kind="ReplicaSet" key="kube-system/coredns-5dd5756b68" duration="5.206149ms"
I1025 16:06:37.628047       1 shared_informer.go:318] Caches are synced for resource quota
I1025 16:06:37.628411       1 event.go:307] "Event occurred" object="kube-system/etcd-k8s-controller-01" fieldPath="" kind="Pod" apiVersion="v1" type="Warning" reason="NodeNotReady" message="Node is not ready"
I1025 16:06:37.633141       1 event.go:307] "Event occurred" object="kube-system/kube-apiserver-k8s-controller-01" fieldPath="" kind="Pod" apiVersion="v1" type="Warning" reason="NodeNotReady" message="Node is not ready"
I1025 16:06:37.631797       1 shared_informer.go:318] Caches are synced for resource quota
I1025 16:06:37.633750       1 event.go:307] "Event occurred" object="kube-system/kube-controller-manager-k8s-controller-01" fieldPath="" kind="Pod" apiVersion="v1" type="Warning" reason="NodeNotReady" message="Node is not ready"
I1025 16:06:37.646992       1 shared_informer.go:318] Caches are synced for attach detach
I1025 16:06:37.667078       1 event.go:307] "Event occurred" object="kube-system/kube-scheduler-k8s-controller-01" fieldPath="" kind="Pod" apiVersion="v1" type="Warning" reason="NodeNotReady" message="Node is not ready"
I1025 16:06:38.080171       1 shared_informer.go:318] Caches are synced for garbage collector
I1025 16:06:38.080232       1 garbagecollector.go:166] "All resource monitors have synced. Proceeding to collect garbage"
I1025 16:06:38.099046       1 shared_informer.go:318] Caches are synced for garbage collector
==== END logs for container kube-controller-manager of pod kube-system/kube-controller-manager-k8s-controller-01 ====
==== START logs for container kube-proxy of pod kube-system/kube-proxy-p4jmn ====
I1025 16:06:08.409876       1 server_others.go:69] "Using iptables proxy"
I1025 16:06:08.463579       1 node.go:141] Successfully retrieved node IP: 192.168.1.105
I1025 16:06:08.470852       1 conntrack.go:100] "Set sysctl" entry="net/netfilter/nf_conntrack_max" value=131072
I1025 16:06:08.470954       1 conntrack.go:52] "Setting nf_conntrack_max" nfConntrackMax=131072
I1025 16:06:08.471656       1 conntrack.go:100] "Set sysctl" entry="net/netfilter/nf_conntrack_tcp_timeout_close_wait" value=3600
I1025 16:06:08.574230       1 server.go:632] "kube-proxy running in dual-stack mode" primary ipFamily="IPv4"
I1025 16:06:08.585503       1 server_others.go:152] "Using iptables Proxier"
I1025 16:06:08.585578       1 server_others.go:421] "Detect-local-mode set to ClusterCIDR, but no cluster CIDR for family" ipFamily="IPv6"
I1025 16:06:08.585630       1 server_others.go:438] "Defaulting to no-op detect-local"
I1025 16:06:08.586691       1 proxier.go:250] "Setting route_localnet=1 to allow node-ports on localhost; to change this either disable iptables.localhostNodePorts (--iptables-localhost-nodeports) or set nodePortAddresses (--nodeport-addresses) to filter loopback addresses"
I1025 16:06:08.591636       1 server.go:846] "Version info" version="v1.28.15"
I1025 16:06:08.591719       1 server.go:848] "Golang settings" GOGC="" GOMAXPROCS="" GOTRACEBACK=""
I1025 16:06:08.600326       1 config.go:188] "Starting service config controller"
I1025 16:06:08.602621       1 shared_informer.go:311] Waiting for caches to sync for service config
I1025 16:06:08.602705       1 config.go:97] "Starting endpoint slice config controller"
I1025 16:06:08.602714       1 shared_informer.go:311] Waiting for caches to sync for endpoint slice config
I1025 16:06:08.605895       1 config.go:315] "Starting node config controller"
I1025 16:06:08.605936       1 shared_informer.go:311] Waiting for caches to sync for node config
I1025 16:06:08.702938       1 shared_informer.go:318] Caches are synced for endpoint slice config
I1025 16:06:08.703053       1 shared_informer.go:318] Caches are synced for service config
I1025 16:06:08.706363       1 shared_informer.go:318] Caches are synced for node config
==== END logs for container kube-proxy of pod kube-system/kube-proxy-p4jmn ====
==== START logs for container kube-scheduler of pod kube-system/kube-scheduler-k8s-controller-01 ====
I1025 16:06:03.130932       1 serving.go:348] Generated self-signed cert in-memory
W1025 16:06:05.851355       1 requestheader_controller.go:193] Unable to get configmap/extension-apiserver-authentication in kube-system.  Usually fixed by 'kubectl create rolebinding -n kube-system ROLEBINDING_NAME --role=extension-apiserver-authentication-reader --serviceaccount=YOUR_NS:YOUR_SA'
W1025 16:06:05.851591       1 authentication.go:368] Error looking up in-cluster authentication configuration: configmaps "extension-apiserver-authentication" is forbidden: User "system:kube-scheduler" cannot get resource "configmaps" in API group "" in the namespace "kube-system"
W1025 16:06:05.851661       1 authentication.go:369] Continuing without authentication configuration. This may treat all requests as anonymous.
W1025 16:06:05.851708       1 authentication.go:370] To require authentication configuration lookup to succeed, set --authentication-tolerate-lookup-failure=false
I1025 16:06:05.893712       1 server.go:154] "Starting Kubernetes Scheduler" version="v1.28.15"
I1025 16:06:05.893774       1 server.go:156] "Golang settings" GOGC="" GOMAXPROCS="" GOTRACEBACK=""
I1025 16:06:05.895322       1 secure_serving.go:213] Serving securely on 127.0.0.1:10259
I1025 16:06:05.895454       1 configmap_cafile_content.go:202] "Starting controller" name="client-ca::kube-system::extension-apiserver-authentication::client-ca-file"
I1025 16:06:05.895507       1 shared_informer.go:311] Waiting for caches to sync for client-ca::kube-system::extension-apiserver-authentication::client-ca-file
I1025 16:06:05.895526       1 tlsconfig.go:240] "Starting DynamicServingCertificateController"
I1025 16:06:06.000230       1 shared_informer.go:318] Caches are synced for client-ca::kube-system::extension-apiserver-authentication::client-ca-file
I1025 16:06:06.004601       1 leaderelection.go:250] attempting to acquire leader lease kube-system/kube-scheduler...
I1025 16:06:21.772270       1 leaderelection.go:260] successfully acquired lease kube-system/kube-scheduler
==== END logs for container kube-scheduler of pod kube-system/kube-scheduler-k8s-controller-01 ====
{
    "kind": "EventList",
    "apiVersion": "v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": []
}
{
    "kind": "ReplicationControllerList",
    "apiVersion": "v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": []
}
{
    "kind": "ServiceList",
    "apiVersion": "v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": [
        {
            "metadata": {
                "name": "kubernetes",
                "namespace": "default",
                "uid": "cec18cba-740a-40ff-818e-b13cafdbfaa6",
                "resourceVersion": "231",
                "creationTimestamp": "2024-10-24T21:23:45Z",
                "labels": {
                    "component": "apiserver",
                    "provider": "kubernetes"
                }
            },
            "spec": {
                "ports": [
                    {
                        "name": "https",
                        "protocol": "TCP",
                        "port": 443,
                        "targetPort": 6443
                    }
                ],
                "clusterIP": "10.96.0.1",
                "clusterIPs": [
                    "10.96.0.1"
                ],
                "type": "ClusterIP",
                "sessionAffinity": "None",
                "ipFamilies": [
                    "IPv4"
                ],
                "ipFamilyPolicy": "SingleStack",
                "internalTrafficPolicy": "Cluster"
            },
            "status": {
                "loadBalancer": {}
            }
        }
    ]
}
{
    "kind": "DaemonSetList",
    "apiVersion": "apps/v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": []
}
{
    "kind": "DeploymentList",
    "apiVersion": "apps/v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": []
}
{
    "kind": "ReplicaSetList",
    "apiVersion": "apps/v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": []
}
{
    "kind": "PodList",
    "apiVersion": "v1",
    "metadata": {
        "resourceVersion": "22127"
    },
    "items": []
}
sre@k8s-controller-01:~$ 

