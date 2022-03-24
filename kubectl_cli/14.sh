#! /bin/bash

kubectl apply -f 14.yaml

# Test that you are able to look up the service and pod names from within the cluster
kubectl run test-ns --image=busybox:1.28 --rm -it --restart=Never -- nslookup nginx-resolver-service
