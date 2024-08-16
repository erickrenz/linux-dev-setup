# Linux Terminal Commands

## Hardware

- `uname -a`: kernel/architecture versions
- `ip a`: list local ip addresses
- `free`: list available memory and swap
- `df -h`: list available storage drives
- `lsblk`: list all hard drives
- `lsusb`: list all usb drives
- `lspci`: list all pci devices
- `netstat -tulpn`: list open ports
- `ss -tulpn`: list open ports
- `ps -aux`: list all running processes
- `htop`: list all processes (pretty)

## Software

- `wget abc.com/file.txt`: download file from internet
- `tar -xvzf`: tar extract (x), verbose (v), decompress .tar.gz (z) file (f)
- `find / -name "file.txt`: find file within directory
- `ln -s file.txt link`: create soft link to file
- `parallel echo ::: A B C`: run multiple commands in parallel

## Internet

- `ping -c 5 -s 500 google.com`: send 5x 500 bite packets to test connection
- `traceroute google.com`: view path through internet servers to get to site

## String Manipulation

- `grep`: filter by string
- `sed 's/unix/linux/ file.txt'`: replace or substitute a string ('s/find/replace/')
- `awk '{print $2}'`: print second "word" in line
- `echo "added text" | tee -a file.txt`: reads stdin, writes to fine && stdout
- `jq .foo.bar file.json`: pretty print json w/ serarch params

### Examples (Advanced)

- `ip a | grep inet | awk '{print $2}'`: print ip addresses (only)
- `echo "4+5+6+7" | bc`: do some math

## Miscellaneous

- `less ...`: same as `cat`, but one page at a time
- `man ...`: open and read manual for command
- `history | tail`: show 10x previous shell commands
