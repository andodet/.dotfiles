return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'AndreM222/copilot-lualine'
    },
    cond = vim.fn.exists('g:vscode') == 0,
    config = function()
      local mode_map = {
        ['NORMAL'] = 'N',
        ['O-PENDING'] = 'N?',
        ['INSERT'] = 'I',
        ['VISUAL'] = 'V',
        ['V-BLOCK'] = 'VB',
        ['V-LINE'] = 'VL',
        ['V-REPLACE'] = 'VR',
        ['REPLACE'] = 'R',
        ['COMMAND'] = '!',
        ['SHELL'] = 'SH',
        ['TERMINAL'] = 'T',
        ['EX'] = 'X',
        ['S-BLOCK'] = 'SB',
        ['S-LINE'] = 'SL',
        ['SELECT'] = 'S',
        ['CONFIRM'] = 'Y?',
        ['MORE'] = 'M',
      }
      require("lualine").setup({
        options = {
          icons_enabled = true,
          -- theme = 'kanagawa',
          component_separators = '|',
          section_separators = '',
        },
        sections = {
          lualine_a = { { 'mode', fmt = function(s) return mode_map[s] or s end } },
          lualine_b = { { 'filename', path = 0 } },
          lualine_c = { 'branch', 'diff' },
          lualine_x = { "diagnostics", 'encoding', 'fileformat', 'filetype', "copilot" },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      })
    end,
    lazy = false
  }
}
