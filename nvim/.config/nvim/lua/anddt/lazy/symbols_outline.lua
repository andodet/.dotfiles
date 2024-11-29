return {
  {
    'hedyhli/outline.nvim',
    cond = vim.fn.exists('g:vscode') == 0,
    config = function()
      vim.keymap.set("n", "<leader>fo", "[[<cmd>Outline<CR>]]", { desc = "Toggle symbols outline" })
      require("outline").setup {}
    end
  }
}
