#!/bin/bash

abort() {
  printf "%s " "$@" >&2
  exit 1
}

usage="Usage: cli.sh (start|build|push|init|init-datax) <version>"

if [ $# -le 0 ]; then
  abort $usage
fi

command=$1
shift
version=$1
shift

BIN_DIR=`dirname $0`
BIN_DIR=`cd "$BIN_DIR"; pwd`

source $BIN_DIR/.env

COMPOSE_COMMAND="docker-compose"
OS=$(uname)
if [[ "$OS" == "Linux" ]]; then
  COMPOSE_COMMAND="docker compose"
elif [[ "$OS" == "Darwin" ]]; then
  COMPOSE_COMMAND="docker-compose"
else
  abort "Only supported on macOS and Linux."
fi

case $command in
  # ./cli.sh download 3.1.4
  (init)
    echo "Download latest dolphinscheduler..."
    FILE_NAME=apache-dolphinscheduler-$version-bin.tar.gz
    wget -O $BIN_DIR/build https://dlcdn.apache.org/dolphinscheduler/$version/$FILE_NAME
    echo "Unzipping $FILE_NAME"
    tar -xzf $BIN_DIR/build/$FILE_NAME -C $BIN_DIR/build
    ;;

  (init-datax)
    echo "Installing DataX..."
    FILE_NAME=datax.tar.gz
    wget -O $BIN_DIR/build https://datax-opensource.oss-cn-hangzhou.aliyuncs.com/202210/$FILE_NAME
    echo "Unzipping $FILE_NAME"
    tar -xzf $BIN_DIR/build/$FILE_NAME -C $BIN_DIR/soft
    ;;

  (build)
    echo "Building docker image locally..."
    docker build --tag yugasun/dolphinscheduler-standalone-server .
    ;;

  (push)
    echo "Build and push docker image to docker.io..."
    # docker buildx create --name multiarch
    # docker buildx use multiarch
    # docker buildx inspect multiarch --bootstrap
    docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag yugasun/dolphinscheduler-standalone-server .
    ;;
    
  (start)
    echo "Starting compose services..."
    NET_NAME=etl
    docker network ls|grep $NET_NAME > /dev/null || docker network create --driver bridge $NET_NAME
    $COMPOSE_COMMAND up -d
    ;;

  (*)
    abort $usage
    ;;
esac