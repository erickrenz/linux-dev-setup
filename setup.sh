#!/bin/bash

# Detect package manager
if [[ -e /bin/dnf || -e /usr/bin/dnf ]]; then
    dnf upgrade -y
else
    echo "The dnf package manager is required for this script."
    exit
fi

### git ###
dnf install -y git

### zsh ###
# Sets zsh as default shell and configures oh-my-zsh
# https://ohmyz.sh#install
dnf install -y zsh util-linux-user
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Kernel Tools ###
# https://www.kernel.org/doc/html/latest/process/changes.html
dnf install -y dwarves bindgen python3-sphinx openssl pcmciautils grub-customizer bc
# https://packages.fedoraproject.org/pkgs/kernel/kernel/
dnf install -y kernel kernel-devel kernel-headers kernel-cross-headers dtc
# Embedded/BusyBox dependencies
dnf install -y glibc-static perl-Pod-Html openocd

### LLVM / Clang ###
# https://packages.fedoraproject.org/pkgs/llvm/llvm/
dnf install -y llvm clang cmake lld lldb clang-tools-extra

### Rust ###
# https://www.rust-lang.org/tools/install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

### Qemu ###
# https://www.qemu.org/download/#linux
dnf install -y qemu qemu-kvm @virtualization

### VSCode ###
# https://code.visualstudio.com/docs/setup/linux
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update -y
dnf install -y code

### Neovim ###
# https://github.com/neovim/neovim/wiki/Installing-Neovim
dnf copr enable -y agriffis/neovim-nightly
dnf install -y neovim python3-neovim

### Miscelaneous ###
# Install the Fedora Server packages
dnf group install -y "server-product-environment"
# Install groups are the "build-essential" equivalent for Fedora
dnf group install -y "C Development Tools and Libraries" 
dnf group install -y "Development Tools"
# Misc Utilities
dnf install -y podman neofetch

### Update installed tools ###
dnf update -y 
