#!/bin/bash

if [ $(whoami) != 'root' ]; then
  echo "Usage: sudo $0"

  else 
      for chain in WEAVE-NPC-INGRESS WEAVE-NPC-EGRESS-DEFAULT WEAVE-NPC-EGRESS-CUSTOM WEAVE-NPC-EGRESS-ACCEPT WEAVE-NPC-EGRESS WEAVE-NPC-DEFAULT WEAVE-NPC WEAVE-CANARY
      do
          echo Deleting Chain $chain
          iptables -X $chain
      done
fi

