#!/bin/bash

cwd=$(dirname $(realpath $0))

if ! grep -q tobashrc $HOME/.bashrc; then
    echo -e "\nsource $cwd/.tobashrc" | tee -a $HOME/.bashrc
fi

ln -sv $cwd/.vimrc $HOME/.vimrc
lm -sv $HOME/.vimrc $HOME/.ideavimrc

ln -sv $cwd/.tmux.conf $HOME/.tmux.conf

# TODO: this should only be done for work laptop, and in a different way altogether
if ! grep -q "set background=dark" $HOME/.vimrc; then
    echo -e "\nset background=dark" | tee -a $HOME/.vimrc
fi
if ! grep -q "set.*default-terminal.*screen-256color" $HOME/.tmux.conf; then
    echo -e "\nset -g default-terminal \"screen-256color\"" | tee -a $HOME/.tmux.conf
fi

if grep -sq 'NAME="Ubuntu"' /etc/os-release && [ -f install.sh ]; then
    bash install.sh
else
    echo "OS is not Ubuntu so skipping program installations"
fi
