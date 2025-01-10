FROM archlinux:latest

RUN pacman -Syu --noconfirm
RUN pacman -S --needed --noconfirm neovim git curl wget gcc clang make unzip ripgrep fd python-virtualenv python-pip

# nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | NODE_VERSION=stable bash

WORKDIR /root

RUN mkdir -p .config/nvim

COPY init.lua .config/nvim
COPY lua .config/nvim/lua

COPY .bashrc .
