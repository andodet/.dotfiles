return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cond = vim.fn.exists('g:vscode') == 0,
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "vimdoc", "javascript", "typescript", "c", "lua", "rust",
                "bash", "python", "toml", "go", "ruby", "sql", "json"
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = false,

            indent = {
                enable = true
            },

            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },

            highlight = {
                -- `false` will disable the whole extension
                disable = { "gitcommit", "json" },
                enable = true,
                indent = { enable = false },
                endwise = { enable = true },

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { "markdown" },
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<CR>',
                    scope_incremental = '<CR>',
                    node_incremental = '<TAB>',
                    node_decremental = '<S-TAB>',
                }
            }
        })

        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "master",
            },
        }
        vim.treesitter.language.register("templ", "templ")
    end,
}

-- config = function()
--     local configs = require("nvim-treesitter.configs")
--
--     configs.setup({
--         ensure_installed = {
--             "cmake",
--             "cpp",
--             "c_sharp",
--             "c",
--             "lua",
--             "rust",
--             "python",
--             "go",
--         },
--         context_commentstring = {
--             enable = true,
--             enable_autocmd = false,
--         },
--         highlight = { enable = true, use_languagetree = true },
--         indent = { enable = false },
--         endwise = { enable = true },
--     })
-- en
