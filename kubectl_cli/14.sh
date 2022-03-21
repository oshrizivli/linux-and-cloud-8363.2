#! /bin/bash

kubectl apply -f 14.yaml

kubectl run test-ns --image=busybox:1.28 --rm -it --restart=Never -- nslookup nginx-resolver-service
