FROM tiangolo/python-machine-learning:python3.7
MAINTAINER Selim Raboudi (selim.raboudi@gmail.com)

RUN apt-get update
RUN apt-get upgrade -y

RUN conda update -n base -c defaults conda
RUN conda install -y pandas jupyter scikit-learn

#RUN useradd --no-log-init -s /bin/bash -d /home/ds1 -m -G sudo ds1
RUN mkdir /root/ds-env-data
RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.notebook_dir = '/root/ds-env-data/'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.password = 'sha1:d26c6e60d44c:03ef6d6d1abf65204396087cf141c7dfe460b4b8'" >> /root/.jupyter/jupyter_notebook_config.py
CMD jupyter notebook --port=8888 --ip=0.0.0.0 --no-browser --allow-root --notebook-dir='/root/ds-env-data'

EXPOSE 8888
ADD VERSION .
