#!/bin/bash

if [ $(whoami) != 'root' ]; then
  echo "Usage: sudo $0"

  else 
      for chain in DOCKER DOCKER-ISOLATION-STAGE-1 DOCKER-ISOLATION-STAGE-2  DOCKER-USER
      do
          echo Deleting Chain $chain
          iptables -X $chain
      done

      for chain in KUBE-EXTERNAL-SERVICES KUBE-FIREWALL KUBE-FORWARD KUBE-KUBELET-CANARY KUBE-NODEPORTS KUBE-PROXY-CANARY KUBE-PROXY-FIREWALL KUBE-SERVICES
      do
          echo Deleting Chain $chain
          iptables -X $chain
      done
fi

