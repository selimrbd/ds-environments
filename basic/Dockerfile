FROM python:3.7.4
MAINTAINER Selim Raboudi (selim.raboudi@gmail.com)

## create user with same name/id as the host
RUN groupadd -g __GROUP_ID__ __GROUP_NAME__ &&\
    useradd -l -u __USER_ID__ -g __GROUP_NAME__ __USER_NAME__ &&\
    usermod -aG sudo __USER_NAME__ &&\
    install -d -m 0755 -o __USER_NAME__ -g __GROUP_NAME__ /home/__USER_NAME__

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install git python3-pip -y

#RUN runuser -l __USER_NAME__ -c "pip install --user --upgrade pip"
#RUN runuser -l __USER_NAME__ -c "pip install --user pandas jupyter scikit-learn pathlib fire"
RUN pip install --upgrade pip
RUN pip install pandas jupyter scikit-learn pathlib fire

## solves jupyter notebook autocomplete problem (from: https://github.com/jupyterlab/jupyterlab/issues/3672)
RUN pip install ipython==7.1.1 ipykernel==5.1.0 --force-reinstall


#RUN mkdir __PATH_DOCKER_WD__
#RUN jupyter notebook --generate-config
#RUN echo "c.NotebookApp.notebook_dir = '__PATH_DOCKER_WD__'" >> /root/.jupyter/jupyter_notebook_config.py
#RUN echo "c.NotebookApp.password = '__JUPYTER_NOTEBOOK_PASSWORD__'" >> /root/.jupyter/jupyter_notebook_config.py
CMD runuser -l __USER_NAME__ -c "if ! test -f '/home/__USER_NAME__/.jupyter/jupyter_notebook_config.py'; then jupyter notebook --generate-config ; fi &&\
                                jupyter notebook --port=8888 --ip=0.0.0.0 --no-browser --notebook-dir='__PATH_DOCKER_WD__'"


EXPOSE 8888
ADD VERSION .
