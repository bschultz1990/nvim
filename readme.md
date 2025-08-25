# Installation

## Install NvChad
[NVChad Installation Instructions](https://nvchad.com/docs/quickstart/install) 

## Clone This Repository
```bash
cd ~/.config/nvim/lua/
gh repo clone nvim user
```

## Edit `init.lua`
```bash
nvim ~/.config/nvim/init.lua
```

**Lazy Setup**
```lua
require("lazy").setup({
...
  { import = "user.plugins" },
}, lazy_config)
```

**User Init**
```lua
vim.schedule(function()
  require "user.init"
end)

Snipmate_path = {}
table.insert(Snipmate_path, "C:/Users/326630/OneDrive - Amcor/Documents/snippets")
```
