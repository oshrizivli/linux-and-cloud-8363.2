#! /bin/bash

# This will remove the node-role.kubernetes.io/master taint from any nodes that have it
kubectl taint nodes --all node-role.kubernetes.io/master-

# apply yaml
kubectl apply -f 08.yaml

