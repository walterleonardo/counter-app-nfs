# counter-app

Its a simple counter app which logs and increments the count from a file. Repository includes Dockerfile and respective kubernetes manifest.

This repo is used in [Medium Blog: K8s Deployment vs Statefulset vs Daemonset](https://medium.com/stakater/k8s-deployments-vs-statefulsets-vs-daemonsets-60582f0c62d4).

The image is already pushed at `docker.io/kahootali/counter`. You can use that or build and run the app yourself using the following commands.

## Build

You can build the image by `docker build -t counter .`

## Run

You can build the image by `docker run -it counter`

## Deploy on Kubernetes

You can deploy on kubernetes using the manifests present in `kubernetes` folder. I have used Persistent Volumes so that when scaling replicas of Deployments or Statefulsets, you can easily see the difference.

## NFS

sudo apt-get update
sudo apt-get install nfs-common nfs-kernel-server -y

sudo mkdir -p /data/nfs1
sudo chown nobody:nogroup /data/nfs1
sudo chmod g+rwxs /data/nfs1

## limit access to clients in 192.168/16 network

$ echo -e "/data/nfs1\t192.168.0.0/16(rw,sync,no_subtree_check,no_root_squash)" | sudo tee -a /etc/exports

$ sudo exportfs -av 
/data/nfs1 192.168.0.0/16

## restart and show logs

sudo systemctl restart nfs-kernel-server
sudo systemctl status nfs-kernel-server

New registry for docker.

kubectl create secret docker-registry regcred --docker-server=registry.walii.es --docker-username=walterleonardo --docker-password="password" --docker-email=email@email.com