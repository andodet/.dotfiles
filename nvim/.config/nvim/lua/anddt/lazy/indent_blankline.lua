return {
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      scope = { enabled = false },
      whitespace = {
        remove_blankline_trail = false,
      },
      indent = {
        char = { "│" },
      },
      -- show_current_context = false,
      -- show_first_indent_level = false,
    },
    cond = vim.fn.exists('g:vscode') == 0
  },
}
