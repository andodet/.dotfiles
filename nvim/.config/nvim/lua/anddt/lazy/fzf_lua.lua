-- return {}
return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
  lazy = false,
  config = function()
    -- keymaps
    local fzf = require("fzf-lua")
    fzf.setup {
      -- "max-perf",
      keymap = {
        fzf = {
          ["ctrl-a"] = "select-all+accept",
        },
      },
      grep = {
        rg_opts = "--column --line-number --no-heading --smart-case"
      },
      winopts = {
        set_title = false,
        preview = {
          title = false,
          -- without this
          delay = 50
        }
      },
      fzf_colors = {
        ["bg+"] = { "bg", "Visual" }
      },
      files = {
        file_ignore_patterns = {
          "node_modules/",
          "vendor/",
          ".venv/*",
          ".envs/*",
          "./**/venv",
          "%venv"
        }
      },
      set_term_title = false
    }


    -- search git files
    vim.keymap.set("n", "<C-p>", function()
      fzf.git_files({ previewer = true, scrollbar = true })
    end)
    -- search all open buffers
    vim.keymap.set("n", "<leader>f.", function()
      require("fzf-lua").buffers({
        previewer = false,
        scrollbar = false,
      })
    end, { desc = "Search open buffers" })
    -- search all files
    vim.keymap.set("n", "<leader><leader>f", function()
      require("fzf-lua").files({
        previewer = true,
        scrollbar = true,
      })
    end, { desc = "Search all files" })
    -- fuzzy search in current buffer
    vim.keymap.set("n", "<leader>fg", function()
      require("fzf-lua").grep_curbuf({
        previewer = false,
        scrollbar = true,
      })
    end, { desc = "Search in current buffer" })
    -- fuzzy search all files
    vim.keymap.set("n", "<leader>fG", function()
      require("fzf-lua").grep({
        previewer = true,
        scrollbar = true,
      })
    end, { desc = "Search all files" })
    -- fuzzy document symbols
    vim.keymap.set("n", "<leader>fs", function()
      require("fzf-lua").lsp_document_symbols({ previewer = true })
    end, { desc = "[LSP] Search document symbols" })
    -- fuzzy workspace symbol
    vim.keymap.set("n", "<leader>fS", function()
      -- local word = vim.fn.input("WsSym >")
      require("fzf-lua").lsp_live_workspace_symbols({})
    end, { desc = "[LSP] Search workspace symbols" })
    -- grep exact word from git files
    vim.keymap.set("n", "<leader>s", function()
      local word = vim.fn.input("Grep >")
      require("fzf-lua").grep({ search = word })
    end, { desc = "Git grep word" })
  end,
}
