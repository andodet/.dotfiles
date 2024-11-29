return {
    "danymat/neogen",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "L3MON4D3/LuaSnip",
    },
    cmd = { "Neogen" },
    config = function()
        local neogen = require("neogen")

        neogen.setup({
            enabled = true,
            input_after_comment = false,
            languages = {
                python = {
                    template = {
                        annotation_convention = "google_docstrings"
                    }
                }
            },
            snippet_engine = "luasnip"
        })

        vim.keymap.set("n", "<leader>xd", function()
            neogen.generate()
        end)
    end,
}
