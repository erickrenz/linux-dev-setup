# .dotfiles

An Ansible playbook to install developer tools for Fedora/CentOS/RHEL based Linux distros using the `dnf` package manager. 

This goal of this project is to quickly get a development system up and running by installing all of the required packages needed for embedded or linux kernel development. This project can also be applied to any low level development projects in general. No prerequisites are required other than running a RHEL (Red Hat Enterprise Linux) based Linux distro. 

## Getting Started

### Download and Install

```bash
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/erickrenz/linux-dev-setup/main/setup.sh)"
```

### Usage

```bash
# Install all packages and tools
ansible-playbook playbook.yaml
```

### Optional

```bash
# authenticate with github
gh auth login
```

```bash
# edit dnf config
sudo vi /etc/dnf/dnf.conf
```

```yml
# enable parallel downloads
max_parallel_downloads=10
```

```yml
# ~/.gitconfig
[user]
    name = Krenz.Eric
    email = e.krenz@fz-juelich.de
[sendemail]
    smtpserver = smtp.gmail.com
    smtpserverport = 587
    smtpencryption = tls
    smtpuser = <username>
    smtppass = <password>
```
