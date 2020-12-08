#!/bin/sh

source ./config

# compiler image
docker build -t ${CHALL_NAME}_builder -f Dockerfile.build --build-arg UBUNTU_VERSION=${UBUNTU_VERSION} .
chcon -Rt svirt_sandbox_file_t $(pwd)
docker run --volume=$(pwd):/app -t ${CHALL_NAME}_builder

# copy files to public
#rm -rf ../public/*
#cp -ar ./dist/* ../public
