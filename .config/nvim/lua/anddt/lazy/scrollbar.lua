return {
  "petertriho/nvim-scrollbar",
  cond = vim.fn.exists("g:vscode") == 0,
  config = function()
    require("scrollbar").setup({
      marks = {
        GitAdd = {
          text = "┆",
          priority = 7,
          gui = nil,
          color = "#76946A",
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "GitSignsAdd",
        },
      }
    })
  end
}
