FROM tensorflow/tensorflow:latest-gpu-py3-jupyter
MAINTAINER Selim Raboudi (selim.raboudi@gmail.com)

RUN apt-get update
RUN apt-get upgrade -y

RUN conda install -y pandas jupyter scikit-learn

RUN mkdir __PATH_DOCKER_WD__
RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.notebook_dir = '__PATH_DOCKER_WD__'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.password = '__JUPYTER_NOTEBOOK_PASSWORD__'" >> /root/.jupyter/jupyter_notebook_config.py
CMD jupyter notebook --port=8888 --ip=0.0.0.0 --no-browser --allow-root --notebook-dir='__PATH_DOCKER_WD__'

EXPOSE 8888
ADD VERSION .
