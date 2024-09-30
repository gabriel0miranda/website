#!/bin/bash

echo -en "Initializing website..." && \
docker build -t website:2.0.0 . 1> /tmp/dockerbuildwebsite && \
echo "Initialized!" && \
docker run --rm -p 8123:8080 website:2.0.0 || \
echo "Failed to initialize!" && cat /tmp/dockerbuildwebsite
