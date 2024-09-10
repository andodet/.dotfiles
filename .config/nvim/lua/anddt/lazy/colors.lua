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
        -- vim.cmd("colorscheme terafox")
        -- vim.cmd("hi Visual guibg=#363d2d")
      end
    end,
  },
  {
    "nanotech/jellybeans.vim",
    cond = vim.fn.exists('u:vscode') == 0,
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
                bg_gutter = "none",
                whitespace = "#302e2c",
                bg_visual = "#363d2d"
              }
            },
            dragon = {
              ui = {
                whitespace = "#302e2c",
                -- bg_visual = "#363d2d"
                bg_visual = "#434C38"
              }
            }
          }
        }
      })
      vim.cmd("colorscheme kanagawa")
      vim.cmd("hi QuickFixLine guibg=#38402f")
    end
  },
  {
    "sho-87/kanagawa-paper.nvim",
    opts = {},
    cond = vim.fn.exists('u:vscode') == 0,
    config = function()
      require('kanagawa-paper').setup({
        undercurl = true,
        transparent = false,
        gutter = false,
        dimInactive = true, -- disabled when transparent
        terminalColors = true,
        commentStyle = { italic = true },
        functionStyle = { italic = false },
        keywordStyle = { italic = false, bold = false },
        statementStyle = { italic = false, bold = false },
        typeStyle = { italic = false },
        colors = { theme = {}, palette = {} }, -- override default palette and theme colors
        overrides = function()                 -- override highlight groups
          return {}
        end,
      })
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
          Visual = { bg = "#383838" },
        },
        code_style = {
          comments = 'none',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none',
        },
      })
      -- vim.cmd("colorscheme onedark")
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
