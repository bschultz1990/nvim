require('telescope').setup {
  defaults = {
    file_ignore_patterns = {"%.git", "%.npm", "%node_modules"}
  },
  pickers = {
    find_files = {
      -- find_command = {'fzf'},
      -- search_dirs = {"D:/"}
    },
  }
}

require('telescope').load_extension 'file_browser'


---- TELESCOPE MAPPINGS
nmap("<leader>ff",":Telescope find_files<cr>")
nmap("<leader>fg",":Telescope live_grep<cr>")
nmap("<leader>bb",":Telescope buffers<cr>")
nmap("<leader>h",":Telescope help_tags<cr>")
nmap("<leader>fb",":Telescope file_browser<cr>")
