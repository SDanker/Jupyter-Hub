# Base image
FROM jupyterhub/jupyterhub:latest

# Install Python packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nodejs npm git nano r-base libzmq3-dev libcurl4-openssl-dev libssl-dev julia jupyter-core jupyter-client && \
    git clone https://github.com/jupyterhub/configurable-http-proxy /configurable-http-proxy && \
    python3 -m pip install notebook jupyterlab && \
    pip install --upgrade pip && \
    pip install jupyterhub-nativeauthenticator && \
    R -e "install.packages(c('repr', 'IRdisplay', 'IRkernel'), type = 'source')" && \
    R -e "IRkernel::installspec(user = FALSE)" && \
    julia -e "using Pkg; Pkg.add('IJulia')" && \
    pip install geopandas numpy seaborn pandas tensorflow scipy matplotlib keras scikit-learn Scrapy3 opencv-python openpyxl Theano beautifulsoup4 peewee Pillow gensim nltk

COPY jupyterhub_config.py /srv/jupyterhub/

WORKDIR /srv/jupyterhub

# Expose the necessary port for JupyterHub
EXPOSE 8000
EXPOSE 8080

# Start JupyterHub
CMD ["jupyterhub"]
