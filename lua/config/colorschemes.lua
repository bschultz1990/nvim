-- config/colorschemes.lua

local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local conf = require('telescope.config').values

M = {}

M.Scs = function (scheme, bg, nv_banner)
  scheme = scheme or "default"
  bg = bg or ""
  nv_banner = nv_banner or "#000000"
  vim.cmd("colorscheme "..scheme)
  vim.opt.background = bg
  if vim.g.neovide then
    vim.g.neovide_title_background_color = nv_banner
  end
  return scheme, bg, nv_banner
end

M.schemes = {
  ['miniautumn'] = function() return M.Scs ('miniautumn', 'dark', '#262029') end,
  ['minicyan'] = function() return M.Scs ('minicyan', 'dark', '#0a2a2a') end,
  ['minispring'] = function() return M.Scs ('minispring', 'dark', '') end,
  ['minischeme'] = function() return M.Scs ('minischeme', 'dark', '#112641') end,
  ['minisummer'] = function() return M.Scs ('minisummer', 'dark', '') end,
  ['miniwinter'] = function() return M.Scs ('miniwinter', 'dark', '#11262d') end,
  ['morning'] = function() return M.Scs ('morning', 'light', '#FFFFFF') end,
  ['peachpuff'] = function() return M.Scs ('peachpuff', 'light', '#000000') end,
  ['retrobox'] = function() return M.Scs ('retrobox', 'dark', '') end,
  ['slate'] = function() return M.Scs ('slate', 'dark', '#262626') end,
}

-- TODO: Extend M.schemes to include built-in color schemes



local function save_scheme(scheme, bg, nv_banner)
  local cs_file = vim.fn.stdpath("config") .. "/after/plugin/current_colorscheme.lua"
  local file = io.open(cs_file, 'w')
  if file then
    local line = string.format("require('config.colorschemes').Scs('%s', '%s', '%s')\n",
      scheme, bg, nv_banner
    )
    file:write(line)
    file:close()
  end
end

local pick_colorscheme = function(opts)
  pickers.new(opts, {
    prompt_title = 'Pick a Colorscheme',
    finder = finders.new_table{results = vim.tbl_keys(M.schemes)},
    sorter = conf.generic_sorter({}),
    layout_config = { width=0.5, height=0.5 },
    attach_mappings = function(prompt_bufnr,map)
      map('i', '<CR>', function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        local scheme, bg, banner = M.schemes[selection[1]]()
        save_scheme(scheme, bg, banner)
      end)
      return true
    end,
  }):find()
end

vim.keymap.set('n', '<leader>th', function()
  pick_colorscheme(require('telescope.themes').get_dropdown())
end, { desc = "Pick a Colorscheme" })

return M
