# ~/.bashrc: executed by bash for interactive non-login shells.

# If not running interactively, don't do anything.
[ -z "$PS1" ] && return

# Source global configuration file if it exists.
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# Source common bashrc files.
if [ -d "${HOME}/.bashrc.d" ]; then
    for rc in "${HOME}/.bashrc.d/"*; do
        source "$rc"
done fi
unset rc

# Source host specific bashrc file.
if [ -f "${HOME}/.bashrc_${HOSTNAME%%.*}" ]; then
    source "${HOME}/.bashrc_${HOSTNAME%%.*}"
fi

type fortune &>/dev/null && fortune -as
