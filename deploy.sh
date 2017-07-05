#!/bin/bash
# deploys to digital ocean

eval $(docker-machine env do-docker)

name=${PWD##*/}
image=$name:dev
container=$name

if docker container ls -a | grep $container; then
  echo "found container $container"
  docker stop $container
  docker rm $container
else
  echo "no container $container"
fi

if docker images --format "{{.Repository}}:{{.Tag}}" | grep $image; then
  echo "found image $image"
  docker rmi $image
else
  echo "no image $image"
fi

docker build -t $image .
docker run -d -p 80:3000 --name $container $image
docker ps