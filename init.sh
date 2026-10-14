#!/bin/bash
set -e
stow tmux3.2
stow emacs27 -t ~/.emacs.d
stow kitty/ -t ~/.config/kitty/

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

stow vim8.2
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c "PlugInstall"

sudo apt install ripgrep
