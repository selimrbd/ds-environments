FROM tensorflow/tensorflow:latest-gpu-py3-jupyter
MAINTAINER Selim Raboudi (selim.raboudi@gmail.com)


## create user with same name/id as the host
RUN groupadd -g __GROUP_ID__ __GROUP_NAME__ &&\
    useradd -l -u __USER_ID__ -g __GROUP_NAME__ __USER_NAME__ &&\
    usermod -aG sudo __USER_NAME__ &&\
    install -d -m 0755 -o __USER_NAME__ -g __GROUP_NAME__ /home/__USER_NAME__

RUN chown -R __USER_NAME__:__GROUP_NAME__ /usr/local/lib/python3.6

## create the default mount point
RUN runuser -l __USER_NAME__ -c "if ! test -d __PATH_CONTAINER_MOUNTPOINT__ ; then mkdir __PATH_CONTAINER_MOUNTPOINT__ ; fi"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install git -y

# define base python environment
RUN conda create -n basic
RUN pip install --upgrade pip
ADD ./config/basic.yml /tmp/basic.yml
RUN conda env create -f /tmp/basic.yml
RUN echo "source activate $(head -1 /tmp/basic.yml | cut -d' ' -f2)" > ~/.bashrc
ENV PATH /opt/conda/envs/$(head -1 /tmp/basic.yml | cut -d' ' -f2)/bin:$PATH

#RUN pip install -r /home/selim/requirements.txt

## load jupyter notebook default configuration
RUN runuser -l __USER_NAME__ -c "mkdir /home/__USER_NAME__/.jupyter"
COPY ./config/.jupyter /home/__USER_NAME__/.jupyter
RUN chown -R __USER_NAME__:__GROUP_NAME__ /home/__USER_NAME__/.jupyter

## launch jupyter notebook
CMD runuser -l __USER_NAME__ -c "jupyter notebook --port=8888 --ip=0.0.0.0 --no-browser --notebook-dir='__PATH_CONTAINER_MOUNTPOINT__'"

EXPOSE 8888
ADD VERSION .
