# .profile

# User specific aliases and functions
export LANG=en_US.UTF-8
export LC_ALL="C.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"

# Preferred editor for local and remote sessions
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
alias neo="neofetch"
alias docker="podman"

# scripts
export PATH=/home/ekrenz/.dotfiles/scripts:$PATH

# cargo
export PATH=/home/ekrenz/.cargo/bin:$PATH
source "$HOME/.cargo/env"

