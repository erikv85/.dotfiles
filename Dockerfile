FROM ubuntu:24.04

RUN apt update
RUN apt install -y \
        sudo \
        curl \
        zip \
        ansible
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# TODO: make an image that clones my .dotfiles repo and installs everything

SHELL ["/bin/bash", "-c"]
USER ubuntu
WORKDIR /home/ubuntu

ADD --chown=ubuntu:ubuntu . /home/ubuntu/.dotfiles

RUN ansible-playbook .dotfiles/ansible/main.yml -K
