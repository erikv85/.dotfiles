#!/bin/bash

pwd=$(realpath $0)

if ! grep -q tobashrc $HOME/.bashrc; then
    echo -e "\nsource $pwd/.tobashrc" | tee -a $HOME/.bashrc
fi

ln -sv $pwd/.vimrc $HOME/.vimrc

ln -sv $pwd/.tmux.conf $HOME/.tmux.conf
