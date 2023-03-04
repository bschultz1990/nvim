## Like What You See?
Feel free to fork this repo and hack away with your own config!

## Installation
```bash
cd ~/.config \
  && git clone --depth 1 --branch pacman https://github.com/bschultz1990/nvim \
  && ./install.sh
```

After installation, launch neovim (`nvim`) let LazyVim update plugins. Relaunch, then run `:checkhealth` to field for any edge cases or extra packages you might need to grab.

## Keybinds

NOTE: Default leader key is `,`

  - `gcc` Comment/uncomment the current line
  - `gc` Comment/uncomment the current selection
  - `<leader>~` Terminal on the bottom.
  - `<C-w>w` Switch to next open window
  - `<leader>tn` Next tab
  - `<leader>tb` Open buffer switcher in Telescope
  - `<leader>ex` Open Netrw file browser
  - `<C-cr>` Source a session file under the cursor in Netrw
  - `<leader>zz` Zen Mode, like Visual Studio Code
  - `<leader>st` Open the starter page.
  - `<leader>tc` Switch colorschemes with live preview

View all keybinds with `<leader>tk` or `:Telescope keybinds`, then search through the beautiful Telescope-powered list. :)

## Custom Commands

### Manage Plugin Updates, Etc..

```
:Lazy Brings up Lazy.nvim plugin manager. `q` will exit that window.
```

### Sessions
```
:Session name
```
- Where `name` is the name of your session WITHOUT a file extension.
- Will create a new session in your `sessions` folder.
- Saves all tabs, windows, and cursor positions.
- Combine this with `<C-cr>` when viewing the sessions folder in Netrw.
- Neovim will then source the session file to its former state.

### Reload Your Init.lua
```bash
:Reload
```
### Edit Your Init.lua File
```
:Vimrc
```
### Edit Your Plugins File
```
:Plugins
```
### Show Help File In Its Own Tab
```
:H document
```
- Where `document` is whatever help subject you want. Switch tabs with `<leader>tn` or `:tabnext`.
