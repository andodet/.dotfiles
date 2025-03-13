return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = false,
          debounce = 75,
          keymap = {
            accept = "<A-CR>",
            accept_word = "<A-p>",
            accept_line = "<A-o>",
            next = "<A-.>",
            prev = "<M-,>",
            dismiss = "<A-;>",
          },
        }
      })
    end,
  }
}
