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
          vim.cmd("hi QuickFixLine guibg=#38402f")
          vim.cmd("hi colorColumn guibg=#282a2a")
          vim.cmd("hi CursorLine guibg=#282a2a")
          -- search highlights
          vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#458588", fg = "#DDC7A1" })
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
                whitespace = "#302e2c",
                -- bg_visual = "#353c2c",
                bg_visual = "#41473a",
                -- bg = "#191919",
                bg = "#1f2329",
                bg_p1 = "#252525",
                bg_p2 = "#252525",
                pmenu = {
                  fg_sel = "#191919",
                  bg_sel = "#61afef",
                },
                float = {
                  bg = "#2d2d33",
                  bg_border = '#2d2d33',
                },
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
        },
      })
      -- vim.cmd("colorscheme kanagawa-wave")
      -- -- some overrides onlyi work when applied after applying the model
      -- vim.cmd("hi Search ctermfg=0 ctermbg=11 guifg=#191919 guibg=#e8c88c")
      -- vim.cmd("hi CurSearch ctermfg=0 ctermbg=11 guifg=#191919 guibg=#cc9057")
      -- vim.cmd("hi MatchParen cterm=bold,underline guibg=#535965")
      -- vim.cmd("hi WinSeparator guifg=#35383e")
      -- vim.cmd("hi LineNr guifg=#65657b")
    end
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
          -- green = "#5fe35f", -- redefine an existing color        },
          -- bg0 = "#191c20",
          -- bg0 = "#191919",
          -- grey = "#252525",
          -- fg = "#b3b9c5"
          fg = "#a9b0be"
        },
        highlights = {
          -- Visual = { bg = "#4b4b4b" },
          Visual = { bg = " #434343" },
          ["@comment"] = { fg = "#797979" },
          ["@lsp.type.comment"] = { fg = "#797979" },
          ["@punctuation.bracket"] = { fg = "#a0a8b7" },
          ["@colorcolumn"] = { bg = "#2b2c31" },
          ["@cursorline"] = { bg = "#202329" },
          ["@constructor.python"] = { fg = "#e2b86b" },
          -- PmenuSel = { bg = "#458588", fg = "#DDC7A1" }
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
      -- -- vim.cmd("hi colorColumn guibg=#25272b")
      -- -- vim.cmd("hi colorColumn guibg=#2f3237")
      -- -- vim.cmd("hi CursorLine guibg=#1f2428")
      -- vim.cmd("hi Comment guifg=#797979")
      -- vim.cmd("hi LineNr guifg=#646974")
      -- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#458588", fg = "#DDC7A1" })
    end,
  },
}
