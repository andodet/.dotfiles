return {
  {
    "AckslD/swenv.nvim",
    lazy = false,
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("swenv").setup({
        post_set_venv = function()
          vim.cmd("LspRestart")
        end,
        venvs_path = vim.fn.expand("~/.pyenv/versions"),
        get_venvs = function(venvs_path)
          return require("swenv.api").get_venvs(venvs_path)
        end,
        icon = ""
      })
    end,
    cond = vim.fn.exists('g:vscode') == 0
  }
}
