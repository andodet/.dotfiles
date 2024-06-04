return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    },
    cond = vim.fn.exists("g:vscode") == 0,
  }
}
