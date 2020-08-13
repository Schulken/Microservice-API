#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath='schulken/msapi'

# Step 2
# Run the Docker Hub container with kubernetes
# kubectl run --image=$dockerpath msapi --port=80
kubectl run msapi\
    --image=$dockerpath\
    --port=80 --labels app=msapi

sleep 1m

# Step 3:
# List kubernetes pods
kubectl get pods --all-namespaces

# Step 4:
# Forward the container port to a host
kubectl port-forward msapi 8000:80
