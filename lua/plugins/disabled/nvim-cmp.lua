return {
  "hrsh7th/nvim-cmp", enabled = true,
  config = function(_, default_opts)
    local merged_opts = vim.tbl_deep_extend("force", default_opts, {
      mapping = {
        ["<Esc>"] = require("cmp").mapping.abort(),
      },
    })
    require("cmp").setup(merged_opts)
  end,
}
