# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# History File
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=10000

# Source shared aliases and functions
source "$HOME/.profile"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# tmux sessionizer
bind -x '"\C-f":tmux-sessionizer'

# starship
eval "$(starship init bash)"
