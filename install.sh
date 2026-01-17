# default app install script for pi cm5 debian lite terminal use, to be continually updated with more relevant packages

#!/bin/bash

# require sudo
if [ "$EUID" -ne 0 ]
  then echo "You need root for this! Please use sudo for this script"
  exit
fi

# update package lists
apt update &&

# install core packages
apt install -y git taskwarrior rustup aerc tmux cmake pipx ranger btop lynx w3m imv calcure &&

# install neovim
git clone https://github.com/neovim/neovim.git &&
cd neovim &&
make &&
CMAKE_BUILD_TYPE=RelWithDebInfo &&
cd build &&
cpack -G DEB &&
dpkg -i nvim-linux-arm64.deb &&

# install lazyvim
# required
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# clone lazyvim repository
cd ~
git clone https://github.com/LazyVim/starter ~/.config/nvim &&
rm -rf ~/.config/nvim/.git &&

# upgrade all installed packages
apt full-upgrade -y &&

# install battery driver --uncomment for hackberry pi specific install
# cd ~
# apt install make linux-headers-rpi-2712
# git clone https://github.com/CNflysky/hackberrypiq20 --depth 1
# cd hackberrypiq20
# make && sudo make install

# clean post install
apt autoremove -y &&
apt clean &&

echo "please restart manually because i do not know the script for that yet"
