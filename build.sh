#!/bin/sh

echo "Building container image..."
docker build . -t ashesfall/analytics-portal:latest --network=host

# echo "Pushing container image..."
# docker push ashesfall/analytics-portal:latest