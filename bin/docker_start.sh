#!/usr/bin/env bash

# Build container 
docker build -t ml-workspace:latest ./
# Start container
docker run -d --rm -p 8080:8080 -v $(PWD):/home/jupyter ml-workspace:latest
# Tag container
docker tag ml-workspace:latest gcr.io/ml-workspace-99a/ml-workspace
# Push container to container registry
docker push gcr.io/ml-workspace-99a/ml-workspace