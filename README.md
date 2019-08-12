# Docker Data Science Environment (WIP)

Off-the-shelf development environments for data science using Docker.
- **basic:** Basic python tools for data science (pandas, scikit-learn, jupyter notebooks...)
- **deep:** Basic DS environment + deep learning tools and frameworks with GPU compatibility


## Get Image from Docker Hub

## Build the image

```
./build.sh
```

## Run the image

```
./run.sh
```

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


