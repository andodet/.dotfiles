return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'AndreM222/copilot-lualine'
    },
    cond = vim.fn.exists('g:vscode') == 0,
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          -- theme = 'onedark',
          component_separators = '|',
          section_separators = '',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { "diagnostics", { "swenv", icon = "" }, 'encoding', 'fileformat', 'filetype', "copilot" },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      })
    end,
    lazy = false
  }
}
