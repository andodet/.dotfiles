if vim.g.vscode then
else
  vim.opt.termguicolors = true
  vim.opt.guicursor = ""
  vim.opt.smartindent = true

  vim.opt.swapfile = false
  -- vim.opt.cursorline = true
  vim.opt.splitright = true
  vim.opt.splitbelow = true
  vim.opt.signcolumn = "yes"
  vim.opt.isfname:append("@-@")
  vim.opt.nu = true
  vim.opt.relativenumber = true
  vim.opt.list = true
  vim.opt.listchars = {
    -- tab = '→ ',
    tab = '  ',
    -- space = "·",
    -- nbsp = "␣",
    trail = "•",
    -- precedes = "«",
    -- extends = "»"
  }
  vim.opt.signcolumn = "yes:2"
  vim.cmd("set title")
  -- code folding
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.opt.foldcolumn = "0"
  vim.opt.foldtext = ""
  vim.opt.foldlevel = 99
  vim.opt.foldlevelstart = 99
  vim.opt.foldnestmax = 4
  vim.opt.wrap = false

  vim.g.python3_host_prog = "/home/anddt/.pyenv/versions/3.12.4/bin/python"

  -- add some delay to lsp errors
  -- vim.opt.updatetime = 250
  vim.cmd("hi link @string.documentation.python SpecialComment")
end
