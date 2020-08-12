FROM gcr.io/kaggle-images/python:v75

RUN pip install -U pip && \
    pip install fastprogress japanize-matplotlib && \
    pip install bhtsne && \
    pip install dgl && \
    pip install torchsummary && \
    pip install mlflow && \
    pip install hydra-core --upgrade && \
    pip install omegaconf && \
    pip install yahoo_finance_api2

## jupyterlab拡張機能
RUN apt-get update && \
    apt-get install -y sudo &&\
    apt-get install -y curl && \ 
    apt-get install -y git && \
    apt-get install -y wget && \
    apt-get install -y make && \
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && \ 
    sudo apt-get install -y nodejs

RUN pip install jupyterlab && \
    jupyter serverextension enable --py jupyterlab && \
    jupyter labextension install jupyterlab_vim && \
    jupyter labextension install @jupyterlab/toc && \
    jupyter labextension install jupyterlab-flake8 && \
    conda install nodejs && \
    pip install jupyterlab_code_formatter && \
    jupyter labextension install @ryantam626/jupyterlab_code_formatter && \
    jupyter serverextension enable --py jupyterlab_code_formatter && \
    pip install black isort && \
    conda install black isort

#mecab and mecab-ipadic-NEologd
RUN apt-get update \
    && apt-get install -y mecab \
    && apt-get install -y libmecab-dev \
    && apt-get install -y mecab-ipadic-utf8 \
    && apt-get install -y xz-utils \
    && apt-get install -y file

RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git \
    && cd mecab-ipadic-neologd \
    && bin/install-mecab-ipadic-neologd -n -y

RUN pip install mecab-python3 && \
    sudo apt install fonts-noto-cjk