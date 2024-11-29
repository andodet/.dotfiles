return {
  "Weissle/persistent-breakpoints.nvim",
  cond = vim.fn.exists("g:vscode") == 0,
  lazy = false,
  config = function()
    require("persistent-breakpoints").setup({})
  end
}
