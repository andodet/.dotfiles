return {
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons",     -- keep this if you're using NvChad
    config = function()
      require("nvim-navic").setup({
        highlight = true,
      })
      require("barbecue").setup()
      vim.api.nvim_set_hl(0, "NavicText", { bg = "#383838", fg = "#383838" })
    end,
    cond = vim.fn.exists('g:vscode') == 0
  }
}
