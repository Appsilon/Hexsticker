#!/bin/bash

source config.sh
docker run -p 8787:8787 -v `pwd`:/mnt --dns=8.8.8.8 $_R_PROJECT_DOCKER_IMAGE_NAME
