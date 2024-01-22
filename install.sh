#!/usr/bin/env bash
# Symlink dotfiles

function ln {
    command ln --verbose --symbolic --force "$@"
}

[[ $PWD == "$HOME/dotfiles" ]] || exit 1

mkdir ~/.dotfiles_old &>/dev/null \
  && mv --verbose ~/{.bashrc,.bash_profile,.profile,.inputrc,.vimrc} "$_" 2>/dev/null

mkdir --parents ~/{.config,.bashrc.d,.vim/colors,.ssh}

# tilde expansion ensures symlinks have absolute path.

## sh
ln ~+/.profile      ~/.profile
ln ~+/.inputrc      ~/.inputrc

## bash
ln ~+/.bashrc       ~/.bashrc
ln ~+/.bash_profile ~/.bash_profile

for bashrc in ~+/.bashrc.d/*; do
    ln "$bashrc"    ~/.bashrc.d
done

## git
ln ~+/.gitconfig    ~/.gitconfig

## tmux
ln ~+/.tmux.conf    ~/.tmux.conf

## vim
ln ~+/.vimrc        ~/.vimrc

for vimcolor in ~+/.vim/colors/*; do
    ln "$vimcolor"  ~/.vim/colors
done
