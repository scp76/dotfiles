# Dotfiles

This repository contains my personal dotfiles.

## Shell configuration

- `.bashrc.d/`: bash configuration files (aliases, functions, etc.).
- `.bash_profile`: sources `~/.profile` and `~/.bashrc` for login shells.
- `.bashrc`: sources `/etc/bashrc`, `~/.bashrc.d/*`, `~/.bashrc_local` and `~/.bashrc_$HOSTNAME`.
- `.bashrc_local`: private configuration (*not* committed to this repository).
- `.bashrc_$HOSTNAME`: host specific configuration (*not* committed to this repository).
- `.inputrc`: GNU readline library configuration.
- `.profile`: profile file for bourne-compatible shells (sets `$PATH`).

## Setting up on a new system

```
git clone https://github.com/bashbadger/dotfiles ~/dotfiles && cd "$_"
./install.sh
```
