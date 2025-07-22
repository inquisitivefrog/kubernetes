#!/bin/bash

systemctl stop kubelet
systemctl stop kube-proxy
systemctl stop kube-apiserver
systemctl stop kube-controller-manager
systemctl stop kube-scheduler

kill $(pgrep kube-apiserver)
kill $(pgrep kube-controller-manager)
kill $(pgrep kube-scheduler)
kill $(pgrep etcd)
kill $(pgrep kubelet)

rm -rf /etc/kubernetes/manifests/*.yaml
rm -rf /var/lib/etcd

kubeadm reset

rm -rf /etc/cni/net.d
