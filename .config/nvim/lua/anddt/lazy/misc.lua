return {
  {
    'tpope/vim-sleuth',
    cond = vim.fn.exists('g:vscode') == 0
  }
}

