#! /bin/bash

## remove dangling images
#docker rmi -f $(docker images -f “dangling=true” -q)

## remove stopped ontainers, dangling images etc.
docker system prune
