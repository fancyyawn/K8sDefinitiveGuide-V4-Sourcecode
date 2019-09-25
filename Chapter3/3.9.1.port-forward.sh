#!/usr/bin/env bash

kubectl port-forward $(kubectl get pod -l app=nginx -o jsonpath='{.items[0].metadata.name}') 3002:80 &

