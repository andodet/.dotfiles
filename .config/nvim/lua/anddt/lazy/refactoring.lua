return {
  "ThePrimeagen/refactoring.nvim",
  cond = vim.fn.exists("g:vscode") == 0,
  config = function()
    require("refactoring").setup({})
  end
}
