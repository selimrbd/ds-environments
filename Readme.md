# Docker Data Science Environment (WIP)

Off-the-shelf development environments for data science using Docker.
- **basic:** Basic python tools for data science (pandas, scikit-learn, jupyter notebooks...)
- **deep:** Basic DS environment + deep learning tools and frameworks with GPU compatibility

## Motivation

Having to re-install your data science environment on a new machine can be painful and time-consuming. It can also be challenging to share a notebook with colleagues that might not have all the dependencies necessary to make it run. It's especially true for deep learning frameworks that require many system dependencies such as CUDA, CudNN, etc.. By encapsulating your development environment in a Docker image, you make it portable and transparent. Easy to redeploy and share !


## Build and run the images

### Prerequisites

1/ Install Docker >=19.03. Run:
```
./utils/setup_docker.sh
```

2/ For the **deep** version: you also need to install an **NVIDIA Driver**. Run
```
./utils/setup_nvidia.sh
```

### Build the image

For the image of your choice run:
```
./build.sh
```

This will automatically build the docker image using the same username as the host machine (thus avoiding any permission problems when creating a file with jupyter). **Note:** you can modify some parameters  (jupyter port, working directory, ...) by modifying the corresponding variables in **build.sh**.

### Run the image

```
./run.sh
```
Will launch a container and jupyter notebook (default port: 8888, default password: `ds-env`)


## Configuration

### jupyter notebook

Modify the jupyter notebook configuration by copying your custom **.jupyter** folder into **config/** and re-building the docker image.

### python libraries

All python libraries are listed in **config/requirements.txt**. If you want to install new python libraries, run in a jupyter notebook cell:
```
! pip install name_of_package
```
To persist these changes:
* run a pip freeze command to create a new requirements.txt file
* transfer it to your mounted directory in the container (default: `/home/username/mounted_directory`)
* on the host machine, move this new requirements.txt to the config/ folder
* rebuild the image

Alternatively you can commit the current container to a new image:
```
docker commit -m "What you did to the image" -a "Author Name" container_id new_image_name
```
This is quicker but lacks reproducibility.
