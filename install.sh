#!/bin/bash
echo "Updating Packages..."
sudo pacman -Syu

if [ ! -e ~/Apps ]; then
  mkdir ~/Apps
  echo "$HOME/Apps directory created!"
fi

echo "Making sure we have wget and curl..."
sudo pacman -S wget
sudo pacman -S curl

echo "Installing Git and GitHub..."
sudo pacman -S git
sudo pacman -S github-cli
sudo pacman -S lazygit

echo "Configuring GitHub..."
git config --global user.name "Will"
git config --global user.email "will@noemail.com"
gh auth login

echo "Installing git-credential-manager..."
# Install git-credential-manager
sudo pacman -S git-credential-manager-core


echo "Installing Python v3.11..."
sudo pacman -S python311 \
	&& curl -fLo ~/Apps/get-pip.py \
	&& https://bootstrap.pypa.io/get-pip.py \
	&& sudo chmod u+rwx ~/Apps/get-pip.py

# Install pynvim through pip
cd "$HOME/Apps" || return
python3 -m pip install pynvim
python3.11 -m pip install --upgrade pip

# Neovim Dependencies
sudo pacman -S fzf
sudo pacman -S fd
sudo pacman -S ripgrep
sudo pacman -S rust
sudo pacman -S lua
sudo pacman -S luarocks
sudo pacman -S jdk-openjdk
sudo pacman -S ruby
sudo pacman -S go
sudo pacman -S neovim

# Install getnf.
echo "Installing getnf. Run 'getnf' to acquire patched nerd fonts with glyphs and icons."
cd "$HOME/Apps" || return \
	&& git clone https://github.com/ronniedroid/getnf.git \
	&& cd getnf \
	&& ./install.sh
