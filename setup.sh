#!/bin/bash

# Verify package manager
if [[ -e /bin/dnf || -e /usr/bin/dnf ]]; then
    echo "[1/4] Updating packages..."
    dnf upgrade -yq
    echo "[2/4] Installing dependencies..."
    dnf install -yq git ansible
elif [[ -e /bin/pacman || -e /usr/bin/pacman ]]; then
    echo "[1/4] Updating packages..."
    pacman -Syu --noconfirm
    echo "[2/4] Installing dependencies..."
    pacman -S git ansible --noconfirm --needed
elif [[ -e /usr/local/bin/brew ]]; then
    echo "[1/4] Updating packages..."
    brew upgrade -q
    echo "[2/4] Installing dependencies..."
    brew install -q git ansible
else
    echo "A supported package manager is required for this script."
    echo "For more information, refer to https://github.com/erickrenz/.dotfiles"
    exit
fi

# Clone this repository
echo "[3/4] Cloning repository..."
if [[ -e /usr/local/bin/brew ]]; then
    # MacOS / Darwin
    if  [ ! -d /Users/erickrenz/.dotfiles/ ] ; then
        cd /Users/erickrenz/
        git clone -q https://github.com/erickrenz/.dotfiles.git
        chown -hR erickrenz .dotfiles/
    fi
    cd /Users/erickrenz/.dotfiles
    git pull -q
else
    # Linux
    if  [ ! -d /home/ekrenz/.dotfiles/ ] ; then
        cd /home/ekrenz/
        git clone -q https://github.com/erickrenz/.dotfiles.git
        chown -hR ekrenz .dotfiles/
    fi
    cd /home/ekrenz/.dotfiles
    git pull -q
fi

# Run ansible playbook
echo "[4/4] Running playbook..."
echo -e "[defaults]\ninventory = inventory.yaml" > ./.setup.cfg
if [[ -e /bin/dnf || -e /usr/bin/dnf ]]; then
    ANSIBLE_CONFIG="./.setup.cfg" ansible-playbook fedora.yaml
elif [[ -e /bin/pacman || -e /usr/bin/pacman ]]; then
    ANSIBLE_CONFIG="./.setup.cfg" ansible-playbook arch.yaml
elif [[ -e /usr/local/bin/brew ]]; then
    ANSIBLE_CONFIG="./.setup.cfg" ansible-playbook macos.yaml
fi
rm .setup.cfg
