# install neovim and lazyvim
# note please change dpkg value to your correct architecture eg: nvim-linux64.deb, arm64, amd64 etc
# dependencies: git, cmake

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

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# clone lazyvim starter cfg
git clone https://github.com/LazyVim/starter ~/.config/nvim &&
rm -rf ~/.config/nvim/.git &&

echo "please run nvim now to complete installation"
