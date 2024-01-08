### oh-my-zsh .zshrc

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
# CASE_SENSITIVE="true"
# ENABLE_CORRECTION="true"
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

zstyle ':omz:update' mode auto      
zstyle ':omz:update' frequency 5

HIST_STAMPS="yyyy-mm-dd"

plugins=(git)

source $ZSH/oh-my-zsh.sh

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

alias up="sudo dnf upgrade -y"
alias neo="neofetch && colors"
alias colors="/home/ekrenz/.dotfiles/dotfiles/alacritty/.config/alacritty/print_colors.sh"
alias docker="podman"

alias 1080="xrandr -s 1920x1080 && feh --bg-fill /home/ekrenz/.dotfiles/wallpapers/unix.jpg"
alias 1440="xrandr -s 2560x1440 && feh --bg-fill /home/ekrenz/.dotfiles/wallpapers/unix.jpg"
alias 2160="xrandr -s 3840x2160 && feh --bg-fill /home/ekrenz/.dotfiles/wallpapers/unix.jpg"

# cargo
export PATH=/home/ekrenz/.cargo/bin:$PATH

# tmux sessionizer
bindkey -s ^f "bash /home/ekrenz/.local/scripts/tmux-sessionizer\n"

