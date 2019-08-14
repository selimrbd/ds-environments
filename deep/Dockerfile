FROM tensorflow/tensorflow:latest-gpu-py3-jupyter
MAINTAINER Selim Raboudi (selim.raboudi@gmail.com)

RUN apt-get update
RUN apt-get upgrade -y

RUN pip install --upgrade pip
RUN pip install pandas scikit-learn 'keras==2.1.6' seaborn Pillow pathlib

## solves jupyter notebook autocomplete problem (from: https://github.com/jupyterlab/jupyterlab/issues/3672)
RUN pip install ipython==7.1.1 ipykernel==5.1.0 --force-reinstall

RUN mkdir __PATH_DOCKER_WD__
RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.notebook_dir = '__PATH_DOCKER_WD__'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.password = '__JUPYTER_NOTEBOOK_PASSWORD__'" >> /root/.jupyter/jupyter_notebook_config.py
CMD jupyter notebook --port=8888 --ip=0.0.0.0 --no-browser --allow-root --notebook-dir='__PATH_DOCKER_WD__'

EXPOSE 8888
ADD VERSION .
