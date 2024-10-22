return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    settings = {
      save_on_toggle = true
    },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})
      vim.keymap.set("n", "<leader>am", function() harpoon:list():add() end)
      vim.keymap.set("n", "<leader>aa", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    end
  },
}
