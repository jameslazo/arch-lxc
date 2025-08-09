#!/bin/bash

# initialize
# pacman-key --init
# pacman-key --populate
# pacman -Syu git
# mkdir .config && cd .config
# git clone https://github.com/jameslazo/arch-lxc .
# chmod +x script.sh && ./script.sh

. bash/.bashrc
pacman -S --noconfirm tmux vim man-pages bash-completion
