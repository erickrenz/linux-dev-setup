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

alias l="ls -al --color=auto"
alias ls="ls --color=auto"
alias neo="neofetch"
alias docker="podman"

if [[ -e /bin/dnf || -e /usr/bin/dnf ]]; then
  alias up="sudo dnf upgrade -y"
elif [[ -e /bin/pacman || -e /usr/bin/pacman ]]; then
  alias up="sudo pacman -Syu"
elif [[ -e /usr/local/bin/brew ]]; then
  alias up="brew upgrade -q"
  alias docker="docker"
fi

# scripts
export PATH="$HOME/.dotfiles/scripts:$PATH"

# cargo
export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.cargo/env"

