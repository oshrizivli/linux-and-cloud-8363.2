#! /bin/bash

# first, lets checks nodes taints status
kubectl get nodes -o=custom-columns=NAME:.metadata.name,TAINTS:.spec.taints

# This will remove the node-role.kubernetes.io/master taint from any nodes that have it
kubectl taint nodes --all node-role.kubernetes.io/master-

# apply yaml
kubectl apply -f 08.yaml

# check that our pod was created on the master node
kubectl get pods -owide
