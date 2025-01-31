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

      function get_window()
        return vim.api.nvim_win_get_number(0)
      end

      require("lualine").setup({

        options = {
          icons_enabled = true,
          -- theme = 'kanagawa',
          component_separators = '|',
          section_separators = '',
        },
        sections = {
          lualine_a = { { 'mode', fmt = function(s) return mode_map[s] or s end } },
          lualine_b = { { 'filename', path = 4 } },
          lualine_c = { 'branch', 'diff' },
          lualine_x = { "diagnostics", 'encoding', 'fileformat', 'filetype', "copilot" },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = { { get_window, color = { bg = "#383838", fg = "none" } } }
        }
      })
    end,
    lazy = false
  }
}
