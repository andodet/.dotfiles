return {
  {
    "folke/trouble.nvim",
    cond = vim.fn.exists('g:vscode') == 0,
    opts = {},
    keys = {
      {
        "<leader>el",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
    }
  }
}
