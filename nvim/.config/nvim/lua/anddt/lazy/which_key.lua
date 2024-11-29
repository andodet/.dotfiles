return {
  {
    'folke/which-key.nvim',
    opts = {},
    cond = vim.fn.exists('g:vscode') == 0
  }
}
