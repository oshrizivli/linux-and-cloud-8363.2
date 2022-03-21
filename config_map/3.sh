#! /bin/bash

# Create an nginx pod and load environment values from the above configmapkeyvalcfgmap
kubectl apply -f 3.yaml

# wait until pod is running to exec 
kubectl wait --for=condition=Ready pod/nginx

# exec into the pod and verify the environment variables
kubectl exec -it nginx env

# delete the pod
kubectl delete -f 3.yaml
