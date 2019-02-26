#!/bin/bash

pwd=$(dirname $(realpath $0))

if ! grep -q tobashrc $HOME/.bashrc; then
    echo -e "\nsource $pwd/.tobashrc" >> $HOME/.bashrc
    echo "$HOME/.bashrc now sources $pwd/.tobashrc"
fi

ln -sv $pwd/.vimrc $HOME/.vimrc

ln -sv $pwd/.tmux.conf $HOME/.tmux.conf
