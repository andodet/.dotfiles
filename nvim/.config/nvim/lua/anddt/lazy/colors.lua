return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons' }, { 'RRethy/nvim-base16' } },
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_disable_italic_comment = true
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"
      vim.g.gruvbox_material_dim_inactive_windows = 0
      vim.cmd.colorscheme("gruvbox-material")
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#458588", fg = "#DDC7A1" })
      vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "#3c3836", fg = "#ebdbb2" })
      -- vim.api.nvim_set_hl(0, "MatchParen", { bg = "#4f4b4a" })
      vim.api.nvim_set_hl(0, "MatchParen", { bg = "#605d5c" })
      vim.api.nvim_set_hl(0, "@string", { fg = "#00ffaa" })
      vim.cmd("hi Visual guibg = #434343")
    end
  },
}
