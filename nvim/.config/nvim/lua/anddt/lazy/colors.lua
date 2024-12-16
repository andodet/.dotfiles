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
                -- bg_visual = "#363d2d",
                -- bg = "#14171a",
                -- bg_p1 = "#1f2329",
                -- bg_p2 = "#1f2329"
              }
            },
            wave = {
              ui = {
                -- bg_gutter = "none",
                -- whitespace = "#302e2c",
                -- bg_visual = "#363d2d",
                -- bg = "#14171a",
                -- -- bg = "#000000",
                whitespace = "#302e2c",
                bg_visual = "#353c2c",
                -- bg = "#201f1f",
                bg = "#191919",
                bg_p1 = "#252525",
                bg_p2 = "#252525",
              }
            },
            dragon = {
              ui = {
                whitespace = "#302e2c",
                bg_visual = "#353c2c",
                bg = "#111313",
                bg_p1 = "#141617",
                bg_p2 = "#141617"
              },
              syn = {
                comment = "#6a6a6a"
              }
            }
          }
        }
      })
      -- vim.cmd("colorscheme kanagawa")
      vim.cmd("hi QuickFixLine guibg=#38402f")
      vim.cmd("hi colorColumn guibg=#1f2329")
      -- #141617
      vim.cmd("hi CursorLine guibg=#1f2428")
      vim.cmd("hi WinSeparator guifg=#35383e")
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#458588", fg = "#DDC7A1" })
    end
  },
  {
    "neanias/everforest-nvim",
    -- config = function()
    --   require("everforest").setup({
    --     ---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
    --     ---Default is "medium".
    --     background = "hard",
    --     italics = false,
    --     disable_italic_comments = true,
    --     colours_override = function(palette)
    --       palette.bg0 = "#111313"
    --     end
    --   })
    --   vim.cmd("colorscheme everforest")
    --   vim.cmd("hi colorColumn guibg=#1f2329")
    --   vim.cmd("hi CursorLine guibg=#1f2428")
    -- end
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_disable_italic_comment = true
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"
      vim.g.gruvbox_material_dim_inactive_windows = 0
      vim.cmd.colorscheme("gruvbox-material")
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#458588", fg = "#DDC7A1" })
      vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "#3c3836", fg = "#ebdbb2" })
      vim.api.nvim_set_hl(0, "MatchParen", { bg = "#4f4b4a" })
    end
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "darker",
        colors = {
          green = "#00ffaa", -- redefine an existing color        },
          bg0 = "#191c20",
          -- grey = "#252525",
        },
        highlights = {
          Visual = { bg = "#383838" },
          -- ["@comment"] = { fg = "#868686" },
          ["@comment"] = { fg = "#797979" },
          ["@punctuation.bracket"] = { fg = "#a0a8b7" },
          ["@colorcolumn"] = { bg = "#202329" },
          ["@cursorline"] = { bg = "#202329" },
          ["@constructor.python"] = { fg = "#e2b86b" },
          PmenuSel = { bg = "#458588", fg = "#DDC7A1" }
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
      -- vim.cmd("hi colorColumn guibg=#1f2329")
      -- vim.cmd("hi CursorLine guibg=#1f2428")
    end,
  },
}
