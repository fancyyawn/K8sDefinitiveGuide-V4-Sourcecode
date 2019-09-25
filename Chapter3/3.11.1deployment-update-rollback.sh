#!/usr/bin/env bash

# update
kubectl set image deployment/nginx-deployment nginx=nginx:1.9.1
kubectl rollout status deployment/nginx-deployment
kubectl describe deployment/nginx-deployment
kubectl get rs

# rollback
kubectl rollout history deployment/nginx-deployment --revision=3
kubectl rollout undo deployment/nginx-deployment
kubectl rollout undo deployment/nginx-deployment --to-revision=2


# pause and resume
kubectl rollout pause deployment/nginx-deployment
kubectl set image deploy/nginx-deployment nginx=nginx:1.9.1
kubectl rollout history deploy/nginx-deployment
kubectl set resources deployment nginx-deployment -c=nginx --limits=cpu=50m,memory=128Mi
kubectl describe deployment/nginx-deployment
kubectl rollout resume deploy nginx-deployment
