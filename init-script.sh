#!/bin/bash

echo -en "Initializing website..." && \
lua scripts/generate-list.lua site/public/logs/index.html site/public/logs/entries
podman build -t website:2.0.0 . 1> /tmp/dockerbuildwebsite && \
echo "Initialized!" && \
podman run --rm -p 8081:8080 website:2.0.0 || \
echo "Failed to initialize!" && cat /tmp/dockerbuildwebsite
