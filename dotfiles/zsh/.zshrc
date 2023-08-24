### starship .zshrc

plugins=(git)

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias l="ls -al"

alias g="git"
alias gs="git status"
alias ga="git add ."
alias gc="git commit"

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

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
