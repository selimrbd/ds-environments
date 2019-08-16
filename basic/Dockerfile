FROM python:3.7.4
MAINTAINER Selim Raboudi (selim.raboudi@gmail.com)

## create user with same name/id as the host
RUN groupadd -g __GROUP_ID__ __GROUP_NAME__ &&\
    useradd -l -u __USER_ID__ -g __GROUP_NAME__ __USER_NAME__ &&\
    usermod -aG sudo __USER_NAME__ &&\
    install -d -m 0755 -o __USER_NAME__ -g __GROUP_NAME__ /home/__USER_NAME__

RUN chown -R __USER_NAME__:__GROUP_NAME__ /usr/local/lib/python3.7

## create the default mount point
RUN runuser -l __USER_NAME__ -c "if ! test -d __PATH_CONTAINER_MOUNTPOINT__ ; then mkdir __PATH_CONTAINER_MOUNTPOINT__ ; fi"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install git python3-pip -y

RUN pip install --upgrade pip
COPY ./config/requirements.txt /home/selim/requirements.txt
RUN pip install -r /home/selim/requirements.txt

## load jupyter notebook default configuration
RUN runuser -l __USER_NAME__ -c "mkdir /home/__USER_NAME__/.jupyter"
COPY ./config/.jupyter /home/__USER_NAME__/.jupyter
RUN chown -R __USER_NAME__:__GROUP_NAME__ /home/__USER_NAME__/.jupyter

## launch jupyter notebook
CMD runuser -l __USER_NAME__ -c "jupyter notebook --port=8888 --ip=0.0.0.0 --no-browser --notebook-dir='__PATH_CONTAINER_MOUNTPOINT__'"

EXPOSE 8888
ADD VERSION .
