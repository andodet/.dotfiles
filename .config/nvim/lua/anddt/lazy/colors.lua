return {
  -- {
  --   "HiPhish/rainbow-delimiters.nvim",
  --   config = function()
  --     require('rainbow-delimiters.setup').setup()
  --   end,
  --   cond = vim.fn.exists('g:vscode') == 0
  -- },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons' }, { 'RRethy/nvim-base16' } },
    cond = vim.fn.exists('g:vscode') == 0
  },
  {
    'sainnhe/edge',
    cond = vim.fn.exists('g:vscode') == 0
  },
  {
    'EdenEast/nightfox.nvim',
    cond = vim.fn.exists('u:vscode') == 0,
    config = function()
      if vim.g.vscode then
        vim.cmd("colorscheme default")
        ["@variable.builtin"] = { italic = false }
      else
        -- vim.cmd("colorscheme nightfox")
        -- vim.cmd("hi Visual guibg=#363d2d")
      end
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    cond = vim.fn.exists('u:vscode') == 0,
    config = function()
      require("kanagawa").setup({
        keywordStyle = { italic = false },
        commentStyle = { italic = false },
        statementStyle = { italic = false },
        functionStyle = { italic = false },
        typeStyle = { italic = false },
        overrides = function()
          return {
            ["@variable.builtin"] = { italic = false },
          }
        end,
        colors = {
          palette = {
            custom_nontext = "#302e2c"
          },
          theme = {
            all = {
              ui = {
                bg_gutter = "none"
              }
            },
            dragon = {
              ui = {
                whitespace = "#302e2c",
                bg_visual = "#363d2d"
              }
            }
          }
        }
      })
      -- vim.cmd("colorscheme kanagawa-dragon")
    end
  },
  {
    "mcchrish/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    cond = vim.fn.exists('u:vscode') == 0,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "darker",
        colors = {
          grey = "#878787",  -- define a new color
          green = "#00ffaa", -- redefine an existing color        },
        },
        highlights = {
          Visual = { bg = "#4a4a4a" },
          -- Visual = { bg = "#3d3d3d" },
        },
        code_style = {
          comments = 'none',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none'
        },
      })
      vim.cmd("colorscheme onedark")
    end,
  },
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        no_italic = true,
        integrations = {
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = {},
              hints = {},
              warnings = {},
              information = {},
            },
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
        },
      })
    end,
  },
}
