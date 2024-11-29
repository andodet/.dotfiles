return {
  {
    "windwp/nvim-projectconfig",
    config = function()
      require("nvim-projectconfig").setup({
        project_dir = vim.fn.expand("~/.config/nvim/projects/")
      })
    end,
    cond = vim.fn.exists('g:vscode') == 0,
    lazy = false
  }
}
