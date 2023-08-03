#!/bin/bash

set -x

helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner

helm repo list

helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server=10.38.70.127 --set nfs.path=/var/nfs/general
helm delete nfs-subdir-external-provisioner 