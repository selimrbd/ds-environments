FROM tiangolo/python-machine-learning:python3.7
MAINTAINER Selim Raboudi (selim.raboudi@gmail.com)

RUN apt-get update
RUN apt-get upgrade -y

RUN conda update -n base -c defaults conda
RUN conda install -y pandas jupyter scikit-learn

COPY ./config/start.sh /start.sh
RUN chmod +x /start.sh

RUN groupadd -r ds && useradd --no-log-init -s /bin/bash -d /home/ds1 -m -G sudo ds1
RUN runuser -l ds1 -c "mkdir ~/.jupyter"
COPY ./config/jupyter_notebook_config.json /home/ds1/.jupyter/jupyter_notebook_config.json
RUN chown ds1 /home/ds1/.jupyter/jupyter_notebook_config.json

EXPOSE 8888
ENTRYPOINT runuser -l ds1 -c "/opt/conda/bin/jupyter notebook --port=8888 --ip=0.0.0.0 --no-browser & /bin/bash"

ADD VERSION .
