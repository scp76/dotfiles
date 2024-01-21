#!/usr/bin/env bash
# Symlink dotfiles

function ln {
    command ln --verbose --symbolic --force "$@"
}

git clone https://github.com/bashbadger/dotfiles ~/dotfiles
cd ~/dotfiles || exit 1

mkdir ~/.dotfiles_old &>/dev/null \
  && mv ~/{.bashrc,.bash_profile,.profile,.inputrc,.vimrc} "$_"

mkdir --parents ~/{.config,.bashrc.d,.vim/colors,.ssh}

## sh
ln ~+/sh/.profile        ~/.profile
ln ~+/sh/.inputrc        ~/.inputrc

## bash
ln ~+/bash/.bashrc       ~/.bashrc
ln ~+/bash/.bash_profile ~/.bash_profile

for bashrc in ~+/bash/.bashrc.d/*; do
    ln "$bashrc"         ~/.bashrc.d
done

## git
ln ~+/git/.gitconfig     ~/.gitconfig

## tmux
ln ~+/tmux/.tmux.conf    ~/.tmux.conf

## vim
ln ~+/vim/.vimrc         ~/.vimrc

for vimcolor in ~+/vim/.vim/colors/*; do
    ln "$vimcolor"       ~/.vim/colors
done
