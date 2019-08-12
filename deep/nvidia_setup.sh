#! /bin/bash

## install nvidia-docker: https://github.com/NVIDIA/nvidia-docker#ubuntu-16041804-debian-jessiestretch
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

## install nvidia driver: https://tecadmin.net/install-latest-nvidia-drivers-ubuntu/
sudo apt-get purge nvidia*
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
# sudo apt install ubuntu-drivers-common
# ubuntu-drivers devices | grep "nvidia-driver" ## see all drivers available
sudo apt install nvidia-driver-430
