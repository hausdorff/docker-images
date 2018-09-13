FROM ubuntu:18.04

LABEL maintainer Alex Clemmer <clemmer.alexander@gmail.com>

RUN apt update
RUN apt install -y git
RUN apt install -y vim
RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
RUN sh ~/.vim_runtime/install_awesome_vimrc.sh

VOLUME /vim
WORKDIR /vim
ENTRYPOINT [ "vim" ]

