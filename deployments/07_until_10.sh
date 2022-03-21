#! /bin/bash

WEBAPP_DEPLOY="webapp"

echo "--------- quetion 7 ---------"

# Update the deployment with the image version 1.17.4
kubectl set image deployments/$WEBAPP_DEPLOY nginx=nginx:1.17.4

# verify
deploy_image=$(kubectl describe deployment $WEBAPP_DEPLOY | grep Image:)
echo "$WEBAPP_DEPLOY currently using $deploy_image"

echo "--------- quetion 8 ---------"

# Check the rollout history
kubectl rollout history deploy $WEBAPP_DEPLOY

# make sure everything is ok after the update
kubectl get deploy,pods

echo "--------- quetion 9 ---------"
# Undo the deployment to the previous version 1.17.1
kubectl rollout undo deployments/$WEBAPP_DEPLOY

#  verify Image has the  previousversion
deploy_image=$(kubectl describe deployment $WEBAPP_DEPLOY | grep Image:)
echo "$WEBAPP_DEPLOY currently using $deploy_image"

echo "--------- quetion 10A ---------"
# Update the deployment with the wrong image version 1.100
kubectl set image deployments/$WEBAPP_DEPLOY nginx=nginx:1.100

# verify
deploy_image=$(kubectl describe deployment $WEBAPP_DEPLOY | grep Image:)
echo "$WEBAPP_DEPLOY currently using $deploy_image"

# however
kubectl get deploy,pods 
kubectl get deploy,pods | grep ImagePullBackOff

echo "--------- quetion 10B ---------"
# Undo the deployment with the previous version
kubectl rollout undo deployments/$WEBAPP_DEPLOY

#  verify everything is ok
deploy_image=$(kubectl describe deployment $WEBAPP_DEPLOY | grep Image:)
echo "$WEBAPP_DEPLOY currently using $deploy_image"
kubectl get deploy,pods

echo "--------- quetion 10C, 10D ---------"
# check the history of the specific revision of that deployment
kubectl rollout history deploy webapp --revision=7		# revision 7 doesn't exists!!!!!!

echo "--------- quetion 10E ---------"
# update the deployment with the image version latest
kubectl set image deployments/$WEBAPP_DEPLOY nginx=nginx

# check the history
kubectl rollout history deploy $WEBAPP_DEPLOY

# verify nothing is going on
kubectl get deploy,pods
deploy_image=$(kubectl describe deployment $WEBAPP_DEPLOY | grep Image:)
echo "$WEBAPP_DEPLOY currently using $deploy_image"


