M = {}

M.Scs = function (scheme, bg, nv_banner)
  nv_banner = nv_banner or "#000000"
  vim.cmd("colorscheme "..scheme)
  vim.opt.background = bg
  if vim.g.neovide then
    vim.g.neovide_title_background_color = nv_banner
  end
end

  -- ['miniautumn'] = function() M.Scs('miniautumn', 'dark', '#262029')end,
M.schemes = {
  { 'miniautumn', 'dark', '#262029' },
  { 'miniwinter', 'dark', '#11262d' },
  { 'minicyan', 'dark', '#0a2a2a' },
  { 'slate', 'dark', '#262626' },
  { 'minischeme', 'dark', '#112641' },
  { 'peachpuff', 'light', '#000000' },
  { 'morning', 'light', '#FFFFFF' },
}

local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local conf = require('telescope.config').values

local pick_colorscheme = function()
  pickers.new({}, {
    prompt_title = 'Pick a Colorscheme',
    finder = finders.new_table{results = vim.tbl_keys(M.schemes)},
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr,map)
      map('i', '<CR>', function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        M.schemes[selection[1]]()
      end)
      return true
    end,
  }):find()
end

vim.keymap.set('n', '<leader>th', function()
  pick_colorscheme()
end, { desc = "Pick a Colorscheme" })

return M
