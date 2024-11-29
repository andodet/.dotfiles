#!/bin/sh

# For some reason, torch can't find CUDA after the system comes up again from suspend. Re-initializing kernel modules is usually enough
# to solve the issue.
sudo rmmod nvidia_uvm
sudo modprobe nvidia_uvm
echo "[DONE] Reset nvidia modprobes"

