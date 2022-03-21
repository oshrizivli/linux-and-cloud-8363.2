#! /bin/bash

# Create a configmap named keyvalcfgmap and read data from the file config.txt
kubectl create configmap keyvalcfgmap --from-env-file=config.txt

# verify that configmap is created correctly
kubectl get cm keyvalcfgmap -o yaml
