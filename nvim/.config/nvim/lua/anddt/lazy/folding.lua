return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require('ufo').setup()
    end,
    cond = vim.fn.exists('g:vscode') == 0
  }
}
