#!/bin/sh

source ./config

# deploy image
docker build -t ${CHALL_NAME} -f Dockerfile --build-arg UBUNTU_VERSION=${UBUNTU_VERSION} .
#docker run -p${OUTPORT}:2000 -d ${CHALL_NAME}
