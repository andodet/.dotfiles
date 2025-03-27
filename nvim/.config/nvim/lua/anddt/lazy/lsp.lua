return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
      "creativenull/efmls-configs-nvim",
      {
        "ray-x/lsp_signature.nvim",
        opts = {
          bind = true,
          hint_enable = true,
          floating_window = false,
          handler_opts = {
            -- border = "single",
          },
          hint_prefix = ""
        },
      },
      "microsoft/python-type-stubs",
    },
    opts = { format = { timeout_ms = 300 } },
    config = function()
      local lspconfig = require("lspconfig")
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
          "pyright",
          "gopls",
          "efm"
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,
        },
      })

      vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
        -- config = config or { border = 'single' }
        config = config or {}
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

      local on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = true
        local opts = { buffer = bufnr, remap = false }
        lsp_format_on_save(bufnr)
        require "lsp_signature".setup()
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
        vim.keymap.set("n", "]e", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "[e", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "<leader>fi", function() vim.lsp.buf.format() end, opts)
        vim.keymap.set("i", "<C-k>", cmp.mapping.scroll_docs(-4), opts)
        vim.keymap.set("i", "<C-j>", cmp.mapping.scroll_docs(4), opts)
      end

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "it", "describe", "before_each", "after_each" },
            },
            workspace = {
              userThirdParty = { os.getenv("HOME") .. ".local/share/lua/5.4" },
              checkThirdParty = "Apply"
            },
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "space",
                indent_size = "4",
              },
            },
          },
        },
      })

      lspconfig.omnisharp.setup({ on_attach = on_attach })
      lspconfig.ruff.setup({
        -- cmd = { "ruff", "server" },
        settings = {
          organizeImports = true,
          lint = {
            args = { "--fix" }
          }
        },
        on_attach = on_attach,
      })
      lspconfig.pyright.setup({
        flags = {
          -- debounce_text_changes = 1000,
          allow_incremental_sync = false,
        },
        settings = {
          python = {
            analysis = {
              openFilesOnly = true,
              diagnosticMode = "openFilesOnly",
              useLibraryCodeForTypes = true,
              autoSearchPath = true,
              stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
              typeCheckingMode = "basic",
            }
          },
          pyright = {
            stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
            disableOrganizeImports = true
          }
        },
        on_attach = on_attach,
      })
      lspconfig.ts_ls.setup({ on_attach = on_attach })
      lspconfig.eslint.setup({ on_attach = on_attach })
      lspconfig.gopls.setup({
        settings = {
          gopls = {
            staticcheck = true,
            semanticTokens = false,
            analyses = {
              unusedparams = true,
              unusedvariable = true,
              unusedfunc = true,
              unreachable = true,
              bools = true,
            },
          },
        },
        on_attach = on_attach
      })
      local goimports = require('efmls-configs.formatters.goimports')
      local isort = require("efmls-configs.formatters.isort")
      local prettier = require("efmls-configs.formatters.prettier")
      local shfmt = {
        formatCommand = "shfmt -i 2 --filename '${INPUT}' -",
        formatStdin = true,
      }
      -- local prettier = {
      --   formatCommand = "prettier --stdin-filepath ${INPUT}",
      --   formatStdin = true,
      -- }
      lspconfig.efm.setup({
        filetypes = {
          "css",
          "go",
          "html",
          "javascript",
          "javascript.jsx",
          "javascriptreact",
          "json",
          "markdown",
          "python",
          "typescript",
          "typescript.tsx",
          "typescriptreact",
          "yaml",
        },
        init_options = { documentFormatting = true },
        settings = {
          languages = {
            javascript = { prettier },
            javascriptreact = { prettier },
            ["javascript.jsx"] = { prettier },
            typescript = { prettier },
            ["typescript.tsx"] = { prettier },
            typescriptreact = { prettier },
            css = { prettier },
            html = { prettier },
            yaml = { prettier },
            markdown = { prettier },
            json = { prettier },
            python = { isort },
            sh = { shfmt },
            go = { goimports },
          },
        },
        on_attach = on_attach,
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
        enabled = function()
          local in_prompt = vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
          if in_prompt then
            return false
          end
          local context = require("cmp.config.context")
          return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
        end,
        cmp.event:on("menu_opened", function()
          vim.b.copilot_suggestion_hidden = false
        end)
      })

      vim.diagnostic.config({
        float = {
          focusable = false,
          style = "minimal",
          source = "always",
          header = "",
          prefix = "",
        },
        virtual_text = true
      })
    end,
  },

  {
    "onsails/lspkind.nvim",
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
