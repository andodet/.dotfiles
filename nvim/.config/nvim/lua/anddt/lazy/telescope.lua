return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "gbrlsnchs/telescope-lsp-handlers.nvim",
        "davvid/telescope-git-grep.nvim",
        "junegunn/fzf",
        -- {
        --     'nvim-telescope/telescope-fzf-native.nvim',
        --     build = 'make',
        -- }
    },

    config = function()
        local actions = require("telescope.actions")
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-l>"] = actions.close,
                    }
                },
                file_ignore_patterns = {
                    "/usr/lib/go*/**", -- this is clearly not working
                    "%.git/",
                    "node_modules/",
                    "vendor/",
                    ".venv*",
                    "./**/venv",
                    "%venv"
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
                lsp_workspace_symbols = {},
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                }
            }
        })
        telescope.load_extension("git_grep")
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader><leader>s', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader><leader>S', function()
            require("git_grep").grep({ search = vim.fn.input("Grep > "), opts = { "--ignore-case" } })
        end)
    end,
    cond = vim.fn.exists('g:vscode') == 0
}
