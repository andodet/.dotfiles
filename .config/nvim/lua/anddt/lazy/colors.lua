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
    'EdenEast/nightfox.nvim',
    config = function()
      if vim.g.vscode then
        vim.cmd("colorscheme default")
        ["@variable.builtin"] = { italic = false }
      else
        -- vim.cmd("colorscheme terafox")
        -- vim.cmd("colorscheme terafox")
        -- vim.cmd("hi Visual guibg=#363d2d")
        -- vim.cmd("hi CursorLine guibg=#1d3337")
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
                bg_gutter = "none",
                whitespace = "#302e2c",
                bg_visual = "#363d2d",
                bg = "#14171a",
              }
            },
            wave = {
              ui = {
                bg_gutter = "none",
                whitespace = "#302e2c",
                bg_visual = "#363d2d",
                bg = "#14171a",
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
      vim.cmd("colorscheme kanagawa-wave")
      vim.cmd("hi QuickFixLine guibg=#38402f")
      vim.cmd("hi colorColumn guibg=#1f2329")
      vim.cmd("hi CursorLine guibg=#1f2428")
      vim.cmd("hi WinSeparator guifg=#35383e")
    end
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
}
