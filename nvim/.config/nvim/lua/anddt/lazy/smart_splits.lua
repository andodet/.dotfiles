return {

  {
    "mrjones2014/smart-splits.nvim",
    config = function()
      require("smart-splits").setup({})
    end,
    cond = vim.fn.exists('g:vscode') == 0
  }
}
