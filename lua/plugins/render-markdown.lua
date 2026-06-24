return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
  ft = { "markdown", "text", "plaintex" },
  keys = {
    { '<leader>rm', '<cmd>RenderMarkdown toggle<cr>', desc = 'RenderMarkdown' },
  },
  opts = {
    pipe_table = { style = "normal" },
  },
}
