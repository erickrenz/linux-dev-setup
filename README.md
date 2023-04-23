# .dotfiles

An Ansible playbook to install developer tools for Fedora/CentOS/RHEL based Linux distros using the `dnf` package manager. 

This goal of this project is to quickly get a development system up and running by installing all of the required packages needed for embedded or linux kernel development. This project can also be applied to any low level development projects in general. No prerequisites are required other than running a RHEL (Red Hat Enterprise Linux) based Linux distro. 

## Getting Started

```bash
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/erickrenz/linux-dev-setup/main/setup.sh)"
```

### Optional

```bash
# edit dnf config
sudo vi /etc/dnf/dnf.conf


# enable parallel downloads
max_parallel_downloads=10
```

## Installed Tools

`Git` &nbsp;
`Zsh` &nbsp;
`ohmyzsh` &nbsp;
`GNU C` &nbsp;
`GNU Make` &nbsp;
`GNU Stow` &nbsp;
`bash` &nbsp;
`flex` &nbsp;
`bison` &nbsp;
`openssl` &nbsp;
`bindgen` &nbsp;
`binutils` &nbsp;
`Kernel-devel` &nbsp;
`Kernel-headers` &nbsp;
`LLVM` &nbsp;
`Clang` &nbsp;
`Rust` &nbsp;
`Qemu` &nbsp;
`VSCode` &nbsp;
`Neovim` &nbsp;
