#!/bin/bash

cwd=$(dirname $(realpath $0))

if ! grep -q tobashrc $HOME/.bashrc; then
    echo -e "\nsource $cwd/.tobashrc" >> $HOME/.bashrc
    echo "$HOME/.bashrc now sources $cwd/.tobashrc"
fi

ln -sv $cwd/.vimrc $HOME/.vimrc

ln -sv $cwd/.tmux.conf $HOME/.tmux.conf

# TODO: this should only be done for work laptop, and in a different way altogether
echo -e "\nset background=dark" >> $HOME/.vimrc
echo -e "\nset -g default-terminal \"screen-256color\"" >> $HOME/.tmux.conf
