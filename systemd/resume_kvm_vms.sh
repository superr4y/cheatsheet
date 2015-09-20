#!/bin/bash
vms=$(cat /tmp/vms)
for vm in $vms; do
  virsh resume $vm
done
rm /tmp/vms

