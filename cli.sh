#!/bin/bash

abort() {
  printf "%s " "$@" >&2
  exit 1
}

usage="Usage: cli.sh (start|build|push|init|init-datax) <version>"

if [ $# -le 0 ]; then
  abort $usage
fi

BIN_DIR=`dirname $0`
BIN_DIR=`cd "$BIN_DIR"; pwd`

source $BIN_DIR/.env

command=$1
shift
version=${1:-$DOLPHINSCHEDULER_VERSION}
shift

COMPOSE_COMMAND="docker-compose"
OS=$(uname)
if [[ "$OS" == "Linux" ]]; then
  COMPOSE_COMMAND="docker compose"
elif [[ "$OS" == "Darwin" ]]; then
  COMPOSE_COMMAND="docker-compose"
else
  abort "Only supported on macOS and Linux."
fi

IMAGE_NAME=yugasun/dolphinscheduler-standalone-server:$DOLPHINSCHEDULER_VERSION

case $command in
  # ./cli.sh init
  (init)
    echo "Download latest dolphinscheduler..."
    FILE_NAME=apache-dolphinscheduler-$version-bin.tar.gz
    wget -O $BIN_DIR/build/$FILE_NAME https://dlcdn.apache.org/dolphinscheduler/$version/$FILE_NAME
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
    docker build --build-arg VERSION=$version --tag $IMAGE_NAME .
    ;;

  (push)
    echo "Build and push docker image to docker.io..."
    BUILDX_NAME=multiarch
    docker buildx ls|grep $BUILDX_NAME > /dev/null || docker buildx create --name $BUILDX_NAME
    docker buildx use multiarch
    docker buildx inspect multiarch --bootstrap
    docker buildx build --build-arg VERSION=$version --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag $IMAGE_NAME .
    ;;
    
  (start)
    echo "Starting compose services..."
    NET_NAME=etl
    docker network ls|grep $NET_NAME > /dev/null || docker network create --driver bridge $NET_NAME
    $COMPOSE_COMMAND up -d
    ;;

  (stop)
    echo "Stoping compose services..."
    $COMPOSE_COMMAND down
    ;;

  (*)
    abort $usage
    ;;
esac