FROM tiangolo/python-machine-learning:python3.7
MAINTAINER Selim Raboudi (selim.raboudi@gmail.com)

RUN apt-get update
RUN apt-get upgrade -y

RUN conda update -n base -c defaults conda
RUN conda install -y pandas jupyter scikit-learn

RUN groupadd -r ds && useradd --no-log-init -s /bin/bash -d /home/ds1 -m -G sudo ds1

EXPOSE 8888
CMD runuser -l ds1 -c "/opt/conda/bin/jupyter notebook --port=8888 --ip=0.0.0.0 --no-browser"

ADD VERSION .
