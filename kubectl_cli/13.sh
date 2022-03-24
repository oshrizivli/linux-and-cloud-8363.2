#! /bin/bash

# apply yaml
kubectl apply -f 13.yaml

NGINX_DEPLOY="nginx-deploy"

# Record the version
pod_image=$(kubectl describe $(kubectl get pods -o=name | grep $NGINX_DEPLOY) | grep "Image:")
echo "$NGINX_DEPLOY currently using $pod_image"

# upgrade the deployment to version 1.17 using rolling update
kubectl set image deployments/$NGINX_DEPLOY $NGINX_DEPLOY=nginx:1.17 

while kubectl get pods | grep ContainerCreating; do
  sleep 1
done

# ecord the changes for the image upgrade
pod_image=$(kubectl describe $(kubectl get pods -o=name | grep $NGINX_DEPLOY) | grep "Image:")
echo "$NGINX_DEPLOY currently using $pod_image"

kubectl rollout status deployments/$NGINX_DEPLOY
