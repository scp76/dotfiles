# Dotfiles

This repository contains my personal dotfiles.

## Shell configuration

- `.bashrc.d/`: bash configuration files (aliases, functions, etc.).
- `.bash_profile`: sources `~/.profile` and `~/.bashrc` for login shells.
- `.bashrc`: sources `/etc/bashrc`, `~/.bashrc.d/*` and `~/.bashrc_$HOSTNAME`.
- `.bashrc_$HOSTNAME`: host specific configuration (*not* committed to this repository).
- `.inputrc`: GNU readline library configuration.
- `.profile`: profile file for bourne-compatible shells (sets `$PATH`).

## Setting up on a new system

### With GNU stow

1. Install stow

```
# e.g. for debian-based systems
sudo apt install stow --yes
```

2. Clone this repository

```
git clone https://github.com/bashbadger/dotfiles ~/dotfiles
```

3. Back up existing dotfiles

```
mkdir ~/.dotfiles.old && mv ~/{.bashrc,.bash_profile,.profile,.inputrc,.vimrc} $_
```

4. Create directories

```
mkdir --parents ~/{.config,.bashrc.d,.vim/colors,.ssh}
```

5. Install dotfiles

```
# Add other packages as required
stow --verbose --dir=$HOME/dotfiles sh bash vim tmux

# Or:

cd ~/dotfiles
stow --verbose sh bash vim tmux
```

6. Verify successful installation (optional)

```
find ~ -type l -ls
```

#### Re-install (re-stow / prune obsolete links)

```
stow --verbose --dir=$HOME/dotfiles --restow sh bash vim tmux
```

#### Uninstall (unstow / unlink) dotfiles

```
stow --verbose --dir=$HOME/dotfiles --delete sh bash vim tmux
```

### With install script (alternative if stow isn't available)

```
git clone https://github.com/bashbadger/dotfiles ~/dotfiles
~/dotfiles/install.sh
```

## References

- Bash startup files in the GNU Bash manual:
    - https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html
- Various StackExchange answers:
    - https://superuser.com/a/703584
    - https://superuser.com/a/789465
    - https://stackoverflow.com/a/8597411
    - https://superuser.com/a/440082
- Bash Startup Explained:
    - https://zwischenzugs.com/2019/02/27/bash-startup-explained/
