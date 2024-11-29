return {
  {
    "adoyle-h/lsp-toggle.nvim",
    cond = vim.fn.exists('g:vscode') == 0,
    config = function()
      require("lsp-toggle").setup({})
    end
  }
}
