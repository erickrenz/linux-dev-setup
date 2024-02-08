# .dotfiles

An Ansible playbook to install developer tools for Fedora/CentOS/RHEL based Linux distros using the `dnf` package manager. 

This goal of this project is to quickly get a development system up and running by installing all the required packages needed for a development workstation. No prerequisites are required other than running a RHEL (Red Hat Enterprise Linux) based Linux distro. 

## Quick Start

1. Download the [Fedora Sway Spin](https://fedoraproject.org/spins/sway) Live ISO and install it on a computer or virtual machine.
2. Open a terminal and run the following command:
```bash
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/erickrenz/.dotfiles/main/setup.sh)"
```
3. Enjoy your fully configured Linux development experience :)

### Optional: Manual Ansible Usage

```bash
# Install all packages and tools
ansible-playbook playbook.yaml
```

### Optional: Manual Stow Usage

```bash
# Move to the dotfiles subdirectory
cd dotfiles/
# Stow all directories
make
```

### Optional: Additional Configuration

```bash
# Open dnf config file
sudo vi /etc/dnf/dnf.conf

# ... then edit dnf.conf to
# enable parallel downloads
max_parallel_downloads=10
```

```bash
# authenticate with github
gh auth login
```

```yml
# ~/.gitconfig for kernel development
[user]
    name = Eric Krenz
    email = krenz.eric.krenz@gmail.com
[sendemail]
    smtpserver = smtp.gmail.com
    smtpserverport = 587
    smtpencryption = tls
    smtpuser = <username>
    smtppass = <password>
```
