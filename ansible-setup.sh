#!/bin/bash

# Detect package manager == dnf
if [[ -e /bin/dnf || -e /usr/bin/dnf ]]; then
    dnf upgrade -yq
else
    echo "The dnf package manager is required for this script."
    exit
fi

# Install andible dependencies
dnf install -yq python ansible
