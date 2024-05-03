# .profile

# User specific aliases and functions
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export LANG=en_US.UTF-8
  export LC_ALL="C.UTF-8"
  export LC_CTYPE="en_US.UTF-8"
  export LC_MESSAGES="en_US.UTF-8"
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export TERM='xterm-256color'
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

# Source global definitions
if [ -f /home/ekrenz/.profile-tmp ]; then
    . /home/ekrenz/.profile-tmp
fi

alias v="nvim"
alias vim="nvim"
alias nv="nvim ."

alias l="ls -al --color=auto"
alias ls="ls --color=auto"
alias neo="neofetch"

if [[ -e /bin/dnf || -e /usr/bin/dnf ]]; then
  alias up="sudo dnf upgrade -y"
elif [[ -e /bin/pacman || -e /usr/bin/pacman ]]; then
  alias up="sudo pacman -Syu"
elif [[ -e /usr/local/bin/brew ]]; then
  alias up="brew upgrade -q"
fi

# fzf colors
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
--color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"

# x11 resize virtual windows
if [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
  alias 720="xrandr -s 1280x720 && feh --bg-fill /home/ekrenz/.dotfiles/wallpapers/unix.jpg"
  alias 1080="xrandr -s 1920x1080 && feh --bg-fill /home/ekrenz/.dotfiles/wallpapers/unix.jpg"
  alias 1440="xrandr -s 2560x1440 && feh --bg-fill /home/ekrenz/.dotfiles/wallpapers/unix.jpg"
  alias 2160="xrandr -s 3840x2160 && feh --bg-fill /home/ekrenz/.dotfiles/wallpapers/unix.jpg"
fi

# scripts
export PATH="$HOME/.dotfiles/scripts:$PATH"

# go
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"

# cargo
export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.cargo/env"

