#!/bin/bash
set -eu

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# build docker images
cd ${SRC_DIR}/base
# インストーラ（zipファイル）名を取得
FILE_NAME=$(basename installer/*.zip .zip)
if [ "$FILE_NAME" == "" ]; then
  echo "ファイルが存在しません"
  exit 0
fi
VERSION=${FILE_NAME: -5}

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
    --build-arg VERSION=${VERSION} \
    -f Dockerfile .
