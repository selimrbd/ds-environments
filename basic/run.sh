#! /bin/bash
docker run \
  -it \
  -p 8888:__JUPYTER_NOTEBOOK_PORT_ON_HOST__ \
  --rm --name __CONTAINER_NAME__ \
  --mount type=bind,source="__PATH_HOST_WD__",target="__PATH_DOCKER_WD__" \
  __IMAGE_NAME__
