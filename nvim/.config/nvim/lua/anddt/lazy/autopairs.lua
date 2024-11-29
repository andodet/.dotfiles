return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
    cond = vim.fn.exists('g:vscode') == 0
  }
}
