#!/bin/bash

# Verify package manager
if [[ -e /bin/dnf || -e /usr/bin/dnf ]]; then
    echo "[1/4] Updating packages..."
    dnf upgrade -yq
else
    echo "The dnf package manager is required for this script."
    exit
fi

# Install andible dependencies
echo "[2/4] Installing dependencies..."
dnf install -yq git ansible

# Clone this repository
echo "[3/4] Cloning repository..."
if  [ ! -d /home/ekrenz/.dotfiles/ ] ; then
    cd /home/ekrenz/
    git clone -q https://github.com/erickrenz/.dotfiles.git
    chown -hR ekrenz .dotfiles/
fi
cd /home/ekrenz/.dotfiles
git pull -q

# Run ansible playbook
echo "[4/4] Running playbook..."
echo -e "[defaults]\ninventory = inventory.yaml" > ./.setup.cfg
ANSIBLE_CONFIG="./.setup.cfg" ansible-playbook playbook.yaml
rm .setup.cfg
