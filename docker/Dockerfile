FROM archlinux:latest

RUN pacman -Syu --noconfirm
RUN pacman -S --needed --noconfirm neovim git curl wget unzip make gcc clang ripgrep fd python-virtualenv python-pip

ARG USER

RUN useradd -m $USER

USER $USER

WORKDIR /home/$USER

# nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | NODE_VERSION=stable bash

RUN mkdir -p .config/nvim

COPY ../init.lua .config/nvim
COPY ../lua .config/nvim/lua

COPY .bashrc .
