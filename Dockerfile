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

COPY --chown=ubuntu:ubuntu ansible/main.yml /home/ubuntu

RUN ansible-playbook main.yml -K
