return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
        'gbrlsnchs/telescope-lsp-handlers.nvim'
    },

    config = function()
        local actions = require("telescope.actions")
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-l>"] = actions.close,
                    }
                },
                file_ignore_patterns = {
                    "/usr/lib/go*/**", -- this is clearly not working
                    ".git/",
                    "node_modules/",
                    "vendor/",
                    ".venv*"
                },
            },
            pickers = {
                find_files = {
                    hidden = true
                }
            },
            settings = {
            },
            extensions = {
                lsp_handlers = {},
                lsp_workspace_symbols = {}
            }
        })
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
    end,
    cond = vim.fn.exists('g:vscode') == 0
}
