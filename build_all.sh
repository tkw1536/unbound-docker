#!/bin/bash
set -e

IMAGE_NAME=ghcr.io/tkw1536/unbound
PLATFORM=linux/amd64,linux/arm64
while IFS= read -r TAG; do
    cd "$TAG"
    docker buildx build -t "$IMAGE_NAME:$TAG" --platform $PLATFORM .
    cd ..
done << EOF
1.10.0
1.10.1
1.11.0
1.12.0
1.13.0
1.13.1
1.13.2
1.14.0
1.15.0
1.16.0
1.16.1
1.16.2
1.16.3
1.17.0
1.17.1
1.6.8
1.7.3
1.8.1
1.8.2
1.8.3
1.9.0
1.9.1
1.9.2
1.9.3
1.9.4
1.9.5
1.9.6
EOF