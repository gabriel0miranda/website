#!/bin/bash

echo -en "Initializing website." && \
simplesites site/ 1> /dev/null && \
echo -en "." && \
docker build -t website:2.0.0 . 1> /dev/null && \
echo "." && \
echo "Initialized!" && \
docker run --rm -p 8123:8080 website:2.0.0 || \
echo "Failed to initialize!"
