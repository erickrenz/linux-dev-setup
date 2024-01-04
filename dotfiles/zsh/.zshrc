### oh-my-zsh .zshrc

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
# CASE_SENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 5

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy-mm-dd"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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

# opam configuration
[[ ! -r /home/ekrenz/.opam/opam-init/init.zsh ]] || source /home/ekrenz/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# bun
[ -s "/home/ekrenz/.bun/_bun" ] && source "/home/ekrenz/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# wasmtime
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

