#! /bin/bash
PATH_HOST_WD=~/datascience/notebooks
JUPYTER_NOTEBOOK_PORT_ON_HOST=8888
JUPYTER_NOTEBOOK_PASSWORD=sha1:d26c6e60d44c:03ef6d6d1abf65204396087cf141c7dfe460b4b8
IMAGE_NAME=ds-env:basic
CONTAINER_NAME=ds-env-basic
PATH_DOCKER_WD="/root/ds-env-data"

sed -i "s@__PATH_DOCKER_WD__@$PATH_DOCKER_WD@g" Dockerfile
sed -i "s@__JUPYTER_NOTEBOOK_PASSWORD__@$JUPYTER_NOTEBOOK_PASSWORD@g" Dockerfile
sed -i "s@__JUPYTER_NOTEBOOK_PORT_ON_HOST__@$JUPYTER_NOTEBOOK_PORT_ON_HOST@g" run.sh
sed -i "s@__PATH_HOST_WD__@$PATH_HOST_WD@g" run.sh
sed -i "s@__PATH_DOCKER_WD__@$PATH_DOCKER_WD@g" run.sh
sed -i "s@__IMAGE_NAME__@$IMAGE_NAME@g" run.sh
sed -i "s@__CONTAINER_NAME__@$CONTAINER_NAME@g" run.sh

docker build -t $IMAGE_NAME .
