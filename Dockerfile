# Base image
FROM jupyterhub/jupyterhub:latest

# Install Python packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nodejs npm git nano r-base wget tar libzmq3-dev libcurl4-openssl-dev libssl-dev jupyter-core jupyter-client && \
    git clone https://github.com/jupyterhub/configurable-http-proxy /configurable-http-proxy && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/1.10/julia-1.10.2-linux-x86_64.tar.gz && \
    tar -xzf julia-1.10.2-linux-x86_64.tar.gz -C /opt && \
    ln -s /opt/julia-1.10.2/bin/julia /usr/local/bin/julia && \
    rm julia-1.10.2-linux-x86_64.tar.gz && \
    python3 -m pip install notebook jupyterlab && \
    pip install --upgrade pip && \
    pip install jupyterhub-nativeauthenticator && \
    R -e "install.packages(c('repr', 'IRdisplay', 'IRkernel'), type = 'source')" && \
    R -e "IRkernel::installspec(user = FALSE)" && \
    julia -e "using Pkg; Pkg.add('IJulia')" && \
    pip install geopandas numpy seaborn pandas tensorflow scipy matplotlib keras scikit-learn Scrapy3 opencv-python openpyxl Theano beautifulsoup4 peewee Pillow gensim nltk && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY jupyterhub_config.py /srv/jupyterhub/

WORKDIR /srv/jupyterhub

# Expose the necessary port for JupyterHub
EXPOSE 8000
EXPOSE 8080

# Start JupyterHub
CMD ["jupyterhub"]
