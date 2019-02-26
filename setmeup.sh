#!/bin/bash

pwd=$(realpath $0)

if ! grep -q tobashrc $HOME/.bashrc; then
    echo -e "\nsource $pwd/.tobashrc" >> $HOME/.bashrc
fi

ln -s $pwd/.vimrc $HOME/.vimrc

ln -s $pwd/.tmux.conf $HOME/.tmux.conf
