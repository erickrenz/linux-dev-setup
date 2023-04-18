#!/bin/bash

# Verify package manager
if [[ -e /bin/dnf || -e /usr/bin/dnf ]]; then
    echo "Updating packages..."
    dnf upgrade -yq
else
    echo "The dnf package manager is required for this script."
    exit
fi

# Install andible dependencies
echo "Installing dependencies..."
dnf install -yq git ansible

# Clone this repository
echo "Cloning repository..."
git clone https://github.com/erickrenz/linux-dev-setup.git