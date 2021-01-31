#!/bin/bash
set -eu

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# build docker images
cd ${SRC_DIR}/base
docker build -t tiryoh/stm32cubeide:1.5.1 -f Dockerfile .