#!/bin/bash

set -x
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner

helm repo list
# by default, NFS diretories get renamed to 'archived-<subdir>', override with storageClass.onDelete
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server=178.18.250.147 --set nfs.path=/data/nfs1 --set storageClass.onDelete=delete

kubectl get storageclass nfs-client