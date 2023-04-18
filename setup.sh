#!/bin/bash

# Verify package manager
if [[ -e /bin/dnf || -e /usr/bin/dnf ]]; then
    echo "[1/3] Updating packages..."
    dnf upgrade -yq
else
    echo "The dnf package manager is required for this script."
    exit
fi

# Install andible dependencies
echo "[2/3] Installing dependencies..."
dnf install -yq git ansible

# Clone this repository
echo "[3/3] Cloning repository..."
git clone -q https://github.com/erickrenz/linux-dev-setup.git