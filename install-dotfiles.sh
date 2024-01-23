#!/usr/bin/env bash
# Symlink dotfiles

function ln {
    command ln --verbose --symbolic --force "$@"
}

[[ $PWD == "$HOME/dotfiles" ]] || exit 1

mkdir ~/.dotfiles_old &>/dev/null \
  && mv --verbose \
     ~/{.bashrc,.bash_profile,.profile,.inputrc,.vimrc,.ssh/config} \
     "$_" 2>/dev/null

mkdir --parents ~/{.config,.bashrc.d,.vim/colors,.ssh/config.d}

# Tilde expansion ensures symlinks have absolute path.

## Shell configuration
ln ~+/.profile      ~/.profile
ln ~+/.inputrc      ~/.inputrc
ln ~+/.bashrc       ~/.bashrc
ln ~+/.bash_profile ~/.bash_profile

for bashrc in ~+/.bashrc.d/*; do
    ln "$bashrc"    ~/.bashrc.d
done

## Vim
ln ~+/.vimrc        ~/.vimrc

## Others
ln ~+/.gitconfig    ~/.gitconfig
ln ~+/.tmux.conf    ~/.tmux.conf
ln ~+/.ssh/config   ~/.ssh/config
