return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      lsp_codelens = false,
      max_line_lenght = 201,
      lsp_gofumpt = true,
      lsp_cfg = false,
      luasnip = true
    })
  end,
  -- event = { "CmdlineEnter" },
  ft = { "go", 'gomod' },
  cond = vim.fn.exists('g:vscode') == 0
}
