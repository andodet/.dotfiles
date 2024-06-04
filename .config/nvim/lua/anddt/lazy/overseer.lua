return {
  'stevearc/overseer.nvim',
  opts = {},
  config = function()
    require("overseer").setup({
      templates = { "builtin" },
    })
  end,
  cond = vim.fn.exists('g:vscode') == 0
}
