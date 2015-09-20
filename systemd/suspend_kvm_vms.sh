#!/bin/bash
vms=$(virsh list | awk '{print $1}' | grep -Eo '[0-9]*' | tr '\n' ' ')
echo "$vms" > /tmp/vms
for vm in $vms; do
  virsh suspend "$vm"
done
