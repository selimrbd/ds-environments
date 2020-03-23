#! /bin/bash
PATH_HOST_WD=~
JUPYTER_NOTEBOOK_PORT_ON_HOST=8888

USER_NAME=$USER
USER_ID=$(id -u $USER_NAME)
GROUP_NAME=$(id -g -n $USER_NAME)
GROUP_ID=$(id -g $GROUP_NAME)

IMAGE_NAME="ds-env:base"
CONTAINER_NAME="ds-env"
#PATH_CONTAINER_MOUNTPOINT="/home/$USER_NAME"
PATH_CONTAINER_MOUNTPOINT="/home/$USER_NAME/mounted_directory"


sed -i "s@__JUPYTER_NOTEBOOK_PORT_ON_HOST__@$JUPYTER_NOTEBOOK_PORT_ON_HOST@g" run.sh
sed -i "s@__PATH_HOST_WD__@$PATH_HOST_WD@g" run.sh
sed -i "s@__PATH_CONTAINER_MOUNTPOINT__@$PATH_CONTAINER_MOUNTPOINT@g" run.sh
sed -i "s@__IMAGE_NAME__@$IMAGE_NAME@g" run.sh
sed -i "s@__CONTAINER_NAME__@$CONTAINER_NAME@g" run.sh
sed -i "s@__USER_ID__@$USER_ID@g" run.sh
sed -i "s@__GROUP_ID__@$GROUP_ID@g" run.sh

sed -i "s@__PATH_CONTAINER_MOUNTPOINT__@$PATH_CONTAINER_MOUNTPOINT@g" Dockerfile
sed -i "s@__PATH_DOCKER_WD__@$PATH_DOCKER_WD@g" Dockerfile
sed -i "s@__JUPYTER_NOTEBOOK_PASSWORD__@$JUPYTER_NOTEBOOK_PASSWORD@g" Dockerfile
sed -i "s@__USER_NAME__@$USER_NAME@g" Dockerfile
sed -i "s@__USER_ID__@$USER_ID@g" Dockerfile
sed -i "s@__GROUP_NAME__@$GROUP_NAME@g" Dockerfile
sed -i "s@__GROUP_ID__@$GROUP_ID@g" Dockerfile

docker build -t $IMAGE_NAME .
