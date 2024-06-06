# Installation
**Clone into ~/.config/**

```bash
sudo apt install git gh

# Configure gh and git. Log in to GitHub
git config --global user.name "Ben S."
git config --global user.email "bens@noemail.com"
gh auth login
```

**Install Neovim Script**
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
# Save this as nviminstall.sh
# Run any time there's an update to neovim. You'll be up and running in five seconds. :)
```

**Install and Configure Python**
```bash
sudo apt install python3 python3-pip
```

**Install pynvim through pip**
```
python3 -m pip install pynvim
python3 -m pip install --upgrade pip
```

> EXTERNALLY MANAGED ENVIRONMENT ERROR?
Use `apt install python3-packagename` instead of pip

**Node, Yarn, and NPM**
```bash
sudo apt install nodejs npm
npm install -g n
sudo n install latest -y

# Reset the location of the new Node
hash -r

# Or just restart your shell :)

sudo npm install -g neovim
sudo npm install -g live-server
sudo npm install -g cmdtest

# Set ownership of ~/.npm
sudo chown -R 501:20 ~/.npm
```

**Rust**
```bash
curl https://sh.rustup.rs -sSf | sh
```

Restart your shell

**Neovim Dependencies**
```bash
sudo apt install xclip
sudo apt install fzf
sudo apt install fdclone
sudo apt install ripgrep
sudo apt install lua5.4
sudo apt install luarocks
cargo install tree-sitter-cli
```
From here, open Neovim, let your plugin manager grab everything, then restart Neovim and run `:checkhealth". Pay special attention to any errors and install remaining software per the on-screen instructions.

**Nerd Fonts!**
