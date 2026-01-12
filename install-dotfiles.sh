#!/usr/bin/env bash
# Convenience script to copy dotfiles into place

shopt -s nullglob

BACKUP_DIR="${HOME}/.dotfiles_old"

[[ $PWD == "$HOME/dotfiles" ]] || exit 1

function vcp {
    cp --verbose "$@"
}

echo "# Backing up current dotfiles to ${BACKUP_DIR}:"

if [[ ! -d "$BACKUP_DIR" ]]; then
   mkdir "$BACKUP_DIR" || exit 1
fi

mv --verbose \
  ~/.profile \
  ~/.inputrc \
  ~/.bashrc \
  ~/.bash_profile \
  ~/.bash_logout \
  ~/.vimrc \
  ~/.ssh/config \
    "$BACKUP_DIR" 2>/dev/null

mkdir --parents \
  ~/.config \
  ~/.bashrc.d \
  ~/.vim/pack/scott/start \
  ~/.ssh/config.d

echo "# Installing dotfiles:"

# Shell
vcp .profile        ~/.profile
vcp .inputrc        ~/.inputrc
vcp .bashrc         ~/.bashrc
vcp .bashrc.d/*     ~/.bashrc.d/
vcp .bash_profile   ~/.bash_profile
vcp .liquidpromptrc ~/.liquidpromptrc

# Vim
vcp .vimrc    ~/.vimrc
vcp -r .vim/* ~/.vim/

# Git
vcp .gitconfig ~/.gitconfig

# Others
vcp .tmux.conf  ~/.tmux.conf
vcp .ssh/config ~/.ssh/config
vcp .lesskey    ~/.lesskey
