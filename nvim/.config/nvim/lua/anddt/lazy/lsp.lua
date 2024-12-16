return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
      "creativenull/efmls-configs-nvim",
      "ray-x/lsp_signature.nvim",
      "microsoft/python-type-stubs",
      "hrsh7th/cmp-cmdline"
    },
    opts = { format = { timeout_ms = 300 } },
    config = function()
      local lsp = require("lsp-zero")
      lsp.extend_lspconfig()
      local cmp = require("cmp")
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )

      require("fidget").setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "eslint",
          "ruff",
          -- "basedpyright",
          "pyright",
          "gopls",
          "efm"
        },
        handlers = {
          function(server_name) -- default handler (optional)
            -- They renamed stuff upstream so typescript breaks
            -- if server_name == "ts_ls" then
            --   server_name = "tsserver"
            -- end
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,
        },
      })


      -- Add borders to documentation hover
      -- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      --   vim.lsp.handlers.hover,
      --   { border = 'single' }
      -- )
      --
      -- For some reason ruff has started acting up (shows "No information available on hover")
      vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
        config = config or { border = 'single' }
        config.focus_id = ctx.method
        if not (result and result.contents) then
          return
        end
        local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
        markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
        if vim.tbl_isempty(markdown_lines) then
          return
        end
        return vim.lsp.util.open_floating_preview(markdown_lines, 'markdown', config)
      end

      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
      local lsp_format_on_save = function(bufnr)
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end
      -- key bindings
      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        lsp_format_on_save(bufnr)
        -- lsp.buffer_autoformat()
        require "lsp_signature".on_attach({
          bind = true, -- This is mandatory, otherwise border config won't get registered.
          hint_enable = false,
          floating_window = false,
          handler_opts = {
            border = "single",
          }
        }, bufnr)
        vim.keymap.set("n", "gds", function()
          vim.cmd([[split]])
          vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "gdS", function()
          vim.cmd([[vsplit]])
          vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "gs", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>es", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>en", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<leader>ep", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        -- vim.keymap.set("i", "<A-C-Space>", function() require("lsp_signature").toggle_float_win() end, opts)
        vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "<leader>fi", function() vim.lsp.buf.format() end, opts)
      end)

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "it", "describe", "before_each", "after_each" },
            },
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
              },
            },
          },
        },
      })

      -- lspconfig.pylsp.setup({
      --   enable = true,
      --   on_attach = function(client, bufnr)
      --     -- client.server_capabilities.documentFormattingProvider = false
      --     -- client.server_capabilities.hoverProvider = false
      --     -- client.server_capabilities.renameProvider = false
      --   end,
      --   settings = {
      --     pylsp = {
      --       plugins = {
      --         jedi_completion = { enabled = true },
      --         pycodestyle = { enabled = false },
      --         pyflakes = { enabled = false },
      --         mccabe = { enabled = false },
      --         pylsp_mypy = { enable = false },
      --         pyls_mypy = { enabled = false },
      --         flake8 = { enabled = false },
      --         pylsp_black = { enabled = false },
      --         pylsp_isort = { enabled = false },
      --         ruff = { enabled = false },
      --       },
      --     },
      --   },
      -- })
      --
      -- vim.diagnostic.config({
      --   virtual_text = true,
      --   signs = true,
      --   update_in_insert = false,
      --   underline = true,
      --   severity_sort = false,
      --   float = true,
      -- })

      lspconfig.omnisharp.setup({})
      lspconfig.ruff.setup({
        -- this is done to maintain parity with black formatter
        cmd = { "ruff", "server" },
        settings = {
        }
      })
      lspconfig.pyright.setup({
        flags = {
          debounce_text_changes = 1000,
          allow_incremental_sync = false,
        },
        settings = {
          python = {
            analysis = {
              openFilesOnly = true,
              diagnosticMode = "openFilesOnly",
              useLibraryCodeForTypes = true,
              autoSearchPathh = true,
              stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
              typeCheckingMode = "basic",
            }
          },
          pyright = {
            stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
            typeCheckingMode = "strict",
          }
        },
      })
      -- lspconfig.basedpyright.setup({
      --   flags = {
      --     debounce_text_changes = 1000,
      --     allow_incremental_sync = false,
      --   },
      --   cmd = { "basedpyright-langserver", "--createstub", "--stdio" },
      --   settings = {
      --     python = {
      --       analysis = {
      --         openFilesOnly = true,
      --         diagnosticMode = "openFilesOnly",
      --         useLibraryCodeForTypes = false,
      --         autoSearchPath = true,
      --         stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
      --         typeCheckingMode = "basic",
      --       }
      --     },
      --     basedpyright = {
      --       stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
      --       typeCheckingMode = "basic",
      --     }
      --   },
      -- })
      lspconfig.ts_ls.setup({})
      lspconfig.eslint.setup({})
      lspconfig.gopls.setup({
        -- on_attach = function(client, bufnr)
        --   -- goimports = gofmt + goimports
        --   local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
        --   vim.api.nvim_create_autocmd("BufWritePre", {
        --     pattern = "*.go",
        --     callback = function()
        --       require('go.format').goimports()
        --     end,
        --     group = format_sync_grp,
        --   })
        -- end,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true
            },
            staticcheck = true,
            -- gofumpt = true
          }
        }
      })

      local golines = require("efmls-configs.formatters.golines")
      local black = require("efmls-configs.formatters.black")
      local ruff_sort = require("efmls-configs.formatters.ruff_sort")
      local isort = require("efmls-configs.formatters.isort")
      local prettier = {
        formatCommand =
        "prettier --stdin-filepath ${INPUT}",
        formatStdin = true,
      }
      local shfmt = require("efmls-configs.formatters.shfmt")
      local goimports = require('efmls-configs.formatters.goimports')
      lspconfig.efm.setup({
        filetypes = { "python", "javascript", "typescript", "html", "yaml", "markdown", "json" },
        init_options = { documentFormatting = true },
        settings = {
          languages = {
            typescript = { prettier },
            -- javascript = { prettier },
            html = { prettier },
            yaml = { prettier },
            markdown = { prettier },
            json = { prettier },
            python = { isort },
            sh = { shfmt },
            go = { goimports }
          },
        },
      })
      lsp.format_on_save({
        format_opts = {
          async = true,
        },
        servers = {
          ["efm"] = { "javascript", "typescript", "html", "yaml", "markdown", "json", "python", "sh", "go" },
        },
      })

      local cmp_select = { behavior = cmp.SelectBehavior.Select }


      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
        window = {
        },
        enabled = function()
          local in_prompt = vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
          if in_prompt then -- this will disable cmp in the Telescope window (taken from the default config)
            return false
          end
          local context = require("cmp.config.context")
          return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
        end,
        cmp.event:on("menu_opened", function()
          vim.b.copilot_suggestion_hidden = false
        end)
      })
      -- vim cmd line autocomplete
      -- cmp.setup.cmdline(':', {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = cmp.config.sources({
      --     { name = 'path' }
      --   }, {
      --     {
      --       name = 'cmdline',
      --       option = {
      --         ignore_cmds = { 'Man', '!' }
      --       }
      --     }
      --   })
      -- })

      vim.diagnostic.config({
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          -- border = "single",
          source = "always",
          header = "",
          prefix = "",
        },
        virtual_text = true
      })
    end,
    cond = vim.fn.exists("g:vscode") == 0,
  },
  {
    "onsails/lspkind.nvim",
    cond = vim.fn.exists("g:vscode") == 0,
    config = function()
      require("lspkind").init({
        mode = "symbol",
        preset = "codicons",
        symbol_map = {
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰜢",
          Variable = "󰀫",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        },
      })
    end,
  },
}
