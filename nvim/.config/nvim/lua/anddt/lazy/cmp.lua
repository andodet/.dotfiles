return {
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      local lspkind = require("lspkind")
      local cmp = require("cmp")
      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol',
            -- maxwidth = 50,
            ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            before = function(entry, vim_item)
              return vim_item
            end
          }),
          enabled = function()
            local in_prompt = vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
            if in_prompt then -- this will disable cmp in the Telescope window (taken from the default config)
              return false
            end
            local context = require("cmp.config.context")
            return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
          end
        },
      })
    end,
  }
}
