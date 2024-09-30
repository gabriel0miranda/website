#!/bin/bash

<<<<<<< HEAD
echo -en "Initializing website..." && \
docker build -t website:2.0.0 . 1> /tmp/dockerbuildwebsite && \
=======
echo -en "Initializing website." && \
cd site && luapress && cd ../ 1> /dev/null && \
echo -en "." && \
docker build -t website:2.0.0 . 1> /dev/null && \
echo "." && \
>>>>>>> 66e907834d4cb644ed238046f302a9107cdf2ec7
echo "Initialized!" && \
docker run --rm -p 8123:8080 website:2.0.0 || \
echo "Failed to initialize!" && cat /tmp/dockerbuildwebsite
