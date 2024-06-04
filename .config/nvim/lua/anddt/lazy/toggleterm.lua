return {
  {
    "akinsho/toggleterm.nvim",
    cond = vim.fn.exists('g:vscode') == 0,
    config = function()
      require('toggleterm').setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
      })
    end
  }
}
