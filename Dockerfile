# Base image
FROM jupyterhub/jupyterhub:latest

# Install Python packages
#USER root
#RUN apt-get update 
#RUN apt-get upgrade -y
RUN apt-get install nodejs
RUN apt-get install npm
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/jupyterhub/configurable-http-proxy /configurable-http-proxy 
#WORKDIR /configurable-http-proxy 
#WORKDIR /srv/jupyterhub
#RUN apt-get install npm nodejs python3 python3-pip git nano -y
RUN python3 -m pip install notebook jupyterlab 
RUN apt-get update 
RUN apt-get upgrade -y


RUN pip install --upgrade pip
RUN apt-get install nano
#RUN jupyterhub --generate-config -f jupyterhub_config.py
#RUN jupyter labextension install @jupyterlab/hub-extension
#COPY jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py
RUN apt-get update 
RUN apt-get upgrade -y
# Install R
#RUN apt-get update && \
RUN apt-get install r-base -y
RUN apt-get install libzmq3-dev libcurl4-openssl-dev libssl-dev jupyter-core jupyter-client -y
RUN R -e "install.packages(c('repr', 'IRdisplay', 'IRkernel'), type = 'source')"
RUN R -e "IRkernel::installspec(user = FALSE)"
#RUN jupyter labextension install @techrah/text-shortcuts

RUN apt-get update 
RUN apt-get upgrade -y
# Set the root password
RUN apt-get update && apt-get install -y git
#RUN git clone https://github.com/jupyterhub/nativeauthenticator.git
#WORKDIR nativeauthenticator
#RUN pip install -e .
RUN pip install jupyterhub-nativeauthenticator
COPY jupyterhub_config.py /srv/jupyterhub/.




WORKDIR /srv/jupyterhub
#RUN jupyterhub --generate-config -f jupyterhub_config.py
#Library
RUN pip install geopandas
RUN pip install numpy
RUN pip install seaborn
RUN pip install pandas
RUN pip install tensorflow
RUN pip install scipy
RUN pip install matplotlib
RUN pip install keras
RUN pip install scikit-learn
RUN pip install Scrapy3
RUN pip install opencv-python
RUN pip install openpyxl
RUN pip install Theano
RUN pip install beautifulsoup4
RUN pip install peewee
RUN pip install Pillow
#RUN pip install stanza
RUN pip install gensim
RUN pip install nltk

#RUN apt-get install libgdal-dev -y
#RUN pip install gdal
RUN apt-get update 
RUN apt-get upgrade -y

# Expose the necessary port for JupyterHub
EXPOSE 8000
EXPOSE 8080

# Start JupyterHub , "--config", "/srv/jupyterhub/jupyterhub_config.py"
CMD ["jupyterhub"]
# Set the root password