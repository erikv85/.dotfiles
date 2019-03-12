#!/bin/bash

cwd=$(dirname $(realpath $0))

if ! grep -q tobashrc $HOME/.bashrc; then
    echo -e "\nsource $cwd/.tobashrc" >> $HOME/.bashrc
    echo "$HOME/.bashrc now sources $cwd/.tobashrc"
fi

ln -sv $cwd/.vimrc $HOME/.vimrc

ln -sv $cwd/.tmux.conf $HOME/.tmux.conf
