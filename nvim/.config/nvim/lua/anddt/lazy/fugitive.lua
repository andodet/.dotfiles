return {
  {
    "tpope/vim-fugitive",
    cond = vim.fn.exists('g:vscode') == 0
  }
}
