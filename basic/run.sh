#! /bin/bash
path_wd=~/datascience/notebooks
container_name=ds-env-basic

docker run \
  -d \
  -p 8888:8888 \
  --rm --name $container_name \
  --mount type=bind,source="$path_wd",target=/home/ds1 \
  ds-env:basic
