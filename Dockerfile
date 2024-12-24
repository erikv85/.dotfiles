FROM ubuntu:24.04

RUN apt update
RUN apt install -y \
        sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

SHELL ["/bin/bash", "-c"]
USER ubuntu
WORKDIR /home/ubuntu

ADD --chown=ubuntu:ubuntu . /home/ubuntu/.dotfiles

RUN cd .dotfiles && bash setmeup.sh
