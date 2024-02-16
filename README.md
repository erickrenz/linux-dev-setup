# .dotfiles

An Ansible playbook to install developer tools for my preferred Linux distros. The goal of this project is to quickly get a development system up and running by installing all the required packages needed for a development workstation. 

Supported package managers:
- `dnf`: Fedora/RHEL
- `pacman`: Arch
- `brew`: macOS/Darwin

Features:
- _langs_: Rust, Go, C, C++, Lua, JS, TS
- _tools_: Neovim, Tmux, Zsh, Starship
- _infra_: Sway, Wayland, Waybar, Rofi
- _theme_: Tokyo Night, JetBrainsMonoNerdFont

_Note: macOS/Darwin does not support any linux tiling window manager ('infra') features. The Kitty terminal is reccomended in order to use the other features ('langs', 'tools', 'theme')._

## Linux Quick Start

1. Download and install a supported distro on a computer or virtual machine:
    - [Fedora](https://fedoraproject.org/workstation/download) using the [Sway Spin](https://fedoraproject.org/spins/sway)
    - [Arch](https://wiki.archlinux.org/title/Installation_guide) using [archinstall]() -> Profile -> Desktop -> Sway
2. Open a terminal and run the following command:
```bash
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/erickrenz/.dotfiles/main/setup.sh)"
```
3. Enjoy your fully configured Linux development experience :)

## macOS Quick Start

For [macOS](https://developer.apple.com/macos), simply run the following command:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/erickrenz/.dotfiles/main/setup.sh)"
```

### Manual Ansible Usage

Install all packages and tools for your specific distro:
```bash
ansible-playbook fedora.yaml
```
```bash
ansible-playbook arch.yaml
```
```bash
ANSIBLE_CONFIG="./nosudo.cfg" ansible-playbook macos.yaml
```

### Manual Stow Usage

Move to the config or fonts subdirectory:
```bash
cd config/
```
... then stow all directories using the included Makefile:
```bash
make
```

