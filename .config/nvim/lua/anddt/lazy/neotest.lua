return {
  {
    "nvim-neotest/neotest",
    cond = vim.fn.exists('g:vscode') == 0,
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python"),
          require("neotest-go")
        }
      })
    end

  }
}
