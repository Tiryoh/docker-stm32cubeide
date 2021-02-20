#!/bin/bash
set -eu

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# get parameter from system
DOCKER_USER=${USER:-$(id -un)}
DOCKER_GROUP=`id -gn`
DOCKER_UID=${UID:-$(id -u)}
DOCKER_GID=${GID:-$(id -g)}

# build docker images
cd ${SRC_DIR}/gui
docker build -t ${DOCKER_USER}/stm32cubeide-gui \
    --build-arg USER=${DOCKER_USER} \
    --build-arg UID=${DOCKER_UID} \
    --build-arg GROUP=${DOCKER_GROUP} \
    --build-arg GID=${DOCKER_GID} \
    -f Dockerfile .
