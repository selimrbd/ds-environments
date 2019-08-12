# Docker Data Science Environment (WIP)

Off-the-shelf development environments for data science using Docker.
- **basic:** Basic python tools for data science (pandas, scikit-learn, jupyter notebooks...)
- **deep:** Basic DS environment + deep learning tools and frameworks with GPU compatibility

## Motivation

Having to re-install your data science environment on a new machine can be painful and time-consuming. It can also be challenging to share a notebook with colleagues that might not have all the dependencies necessary to make it run. It's especially true for deep learning frameworks that require many system dependencies such as CUDA, CudNN, etc.. By encapsulating your development environment in a Docker image, you make it portable and transparent. Easy to redeploy and share !

## Prerequisites

Install Docker >=19.03. For that you can run
```
./install_docker.sh
```

## Get Image from Docker Hub

## Build the image

Open build.sh and modify:
- `PATH_HOST_WD` to the working directory  on your local machine
- `JUPYTER_NOTEBOOK_PORT_ON_HOST` if you want jupyter to be exposed on your host on another port than 8888

Then run the script
```
./build.sh
```

## Run the image

```
docker run \
  -it \
  -p 8888:8888 \
  --rm --name container_name \
  --mount type=bind,source="path_host_wd",target="/root/ds-env-data" \
  ds-env:basic
```

Alternatively if you have built the Docker Image locally, simply do
```
./run.sh
```

**NOTE: The default password for the jupyter notebook is 'ds'**

## Modify the image

You will probably want to modify the environment (install new python libraries, etc.). But once the container is stopped, all changes to the environment will be lost.. To save your modified environment, you have two options.

### Use Dockerfile (recommended)

Add the instructions to the Dockerfile and rebuild the image. This has the advantage of being reproducible and transparent

### Commit current state to a new image

Alternatively you can commit the current container to a new image:
```
docker commit -m "What you did to the image" -a "Author Name" container_id repository/new_image_name
```
This is quicker than modifying the Dockerfile but lacks reproducibility.


