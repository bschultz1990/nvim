return {
  'sbdchd/neoformat',
  cmd = { 'Neoformat', 'Format' },
  config = function()
    vim.api.nvim_create_user_command("Format", function()
      vim.cmd("Neoformat")
    end, { nargs = 0 })
  end
}
