#!/bin/bash
echo "Updating Packages..."
pacman -Syu

if [ ! -e ~/Apps ]; then
  mkdir ~/Apps
  echo "$HOME/Apps directory created!"
fi

echo "Making sure we have wget and curl..."
pacman -S wget
pacman -S curl

echo "Installing Git and GitHub..."
pacman -S git
pacman -S github-cli
pacman -S lazygit

echo "Configuring GitHub..."
git config --global user.name "Will"
git config --global user.email "will@noemail.com"
gh auth login

echo "Installing git-credential-manager..."
# Install git-credential-manager
pacman -S git-credential-manager-core


echo "Installing Python v3.11..."
pacman -S python311 \
	&& curl -fLo ~/Apps/get-pip.py \
	&& https://bootstrap.pypa.io/get-pip.py \
	&& sudo chmod u+rwx ~/Apps/get-pip.py

# Install pynvim through pip
cd "$HOME/Apps" || return
python3 -m pip install pynvim
python3.11 -m pip install --upgrade pip

# Neovim Dependencies
pacman -S fzf
pacman -S fd
pacman -S ripgrep
pacman -S rust
pacman -S lua
pacman -S luarocks
pacman -S jdk-openjdk
pacman -S ruby
pacman -S go
pacman -S neovim

# Install getnf.
echo "Installing getnf. Run 'getnf' to acquire patched nerd fonts with glyphs and icons."
cd "$HOME/Apps" || return \
	&& git clone https://github.com/ronniedroid/getnf.git \
	&& cd getnf \
	&& ./install.sh
