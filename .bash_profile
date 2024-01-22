# ~/.bash_profile: executed by bash for login shells.

# Source ~/.profile, since that isn't loaded if ~/.bash_profile exists, and
# our $PATH is defined there.
[[ -f ~/.profile ]] && source ~/.profile

# Source ~/.bashrc for interactive login shells, because that isn't loaded otherwise.
[[ -f ~/.bashrc ]] && source ~/.bashrc
