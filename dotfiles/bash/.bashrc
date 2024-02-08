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

# User specific aliases and functions
export LANG=en_US.UTF-8
export LC_ALL="C.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias v="nvim"
alias vim="nvim"
alias nv="nvim ."

alias l="ls -al"
alias up="sudo dnf upgrade -y"
alias docker="podman"

# cargo
export PATH=/home/ekrenz/.cargo/bin:$PATH
source "$HOME/.cargo/env"

# scripts 
export PATH=/home/ekrenz/.dotfiles/scripts:$PATH
bind -x '"\C-f":tmux-sessionizer'

# starship
eval "$(starship init bash)"
