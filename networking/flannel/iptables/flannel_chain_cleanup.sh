#!/bin/bash

if [ $(whoami) != 'root' ]; then
  echo "Usage: sudo $0"

  else 
      for chain in FLANNEL-FWD
      do
          echo Deleting Chain $chain
          iptables -X $chain
      done
fi

