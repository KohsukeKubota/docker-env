FROM gcr.io/kaggle-images/python:v75

RUN pip install -U pip && \
    pip install fastprogress japanize-matplotlib && \
    pip install jupyter-contrib-nbextensions && \
    pip install jupyter-nbextensions-configurator && \ 
    jupyter contrib nbextension install --user && \
    jupyter nbextensions_configurator enable --user && \
    mkdir -p $(jupyter --data-dir)/nbextensions && \
    cd $(jupyter --data-dir)/nbextensions && \
    git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding && \
    jupyter nbextension enable vim_binding/vim_binding && \
    pip install bhtsne && \
    pip install dgl && \
    pip install torchsummary