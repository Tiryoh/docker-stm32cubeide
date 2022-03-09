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
docker build -t tiryoh/stm32cubeide:$VERSION -f Dockerfile . --build-arg ZIP_FILE_NAME=$FILE_NAME --build-arg VERSION=$VERSION