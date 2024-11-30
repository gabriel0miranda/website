#!/bin/bash

echo -en "Initializing website..." && \
lua scripts/generate-list.lua site/public/logs/index.html site/public/logs/entries
docker build -t website:2.0.0 . 1> /tmp/dockerbuildwebsite && \
echo "Initialized!" && \
docker run --rm -p 8080:8080 website:2.0.0 || \
echo "Failed to initialize!" && cat /tmp/dockerbuildwebsite
