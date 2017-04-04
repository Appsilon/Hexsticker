#!/bin/bash

DOCKER_FILES_DIR=docker

pull_or_build_and_push() {
    docker pull $IMAGE_NAME || (docker build -t $IMAGE_NAME -f $DOCKERFILE . && docker push $IMAGE_NAME)
}

docker_build() {
    docker build -t $IMAGE_NAME -f $DOCKERFILE $DOCKER_FILES_DIR
}

source config.sh
IMAGE_NAME=$_R_PROJECT_DOCKER_IMAGE_NAME DOCKERFILE=$DOCKER_FILES_DIR/Dockerfile-rstudio docker_build
