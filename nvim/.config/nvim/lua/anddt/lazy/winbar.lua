return {
  {
    "fgheng/winbar.nvim",
    cond = vim.fn.exists('g:vscode') == 0,
    config = function()
      require("winbar").setup({})
    end
  }
}
