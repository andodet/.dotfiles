return {
  {
    "declancm/maximize.nvim",
    config = function()
      require("maximize").setup()
    end,
    cond = vim.fn.exists('g:vscode') == 0,
  }
}
