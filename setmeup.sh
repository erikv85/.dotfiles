#!/bin/bash

if [[ $(basename `pwd`) != ".dotfiles" ]]; then
    echo "Please run from .dotfiles directory"
    exit 1
fi

cwd=$(dirname $(realpath $0))

sudo apt install -y ansible
ansible-playbook -vvv ansible/main.yml -K

# TODO: this should only be done for work laptop, and in a different way altogether
if ! grep -q "set background=dark" $HOME/.vimrc; then
    echo -e "\nset background=dark" | tee -a $HOME/.vimrc
fi
if ! grep -q "set.*default-terminal.*screen-256color" $HOME/.tmux.conf; then
    echo -e "\nset -g default-terminal \"screen-256color\"" | tee -a $HOME/.tmux.conf
fi
