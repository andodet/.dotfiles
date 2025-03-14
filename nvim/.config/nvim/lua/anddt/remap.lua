vim.g.mapleader = " "

vim.keymap.set("n", "<SPACE>", "<Nop>")
vim.keymap.set({ "n", "v" }, "f", "<cmd>HopChar2<CR>", { desc = "find 2 chars in visible buffer", silent = true })
vim.keymap.set({ "n", "v" }, "F", "<cmd>HopChar1CurrentLine<CR>", { desc = "find single char", silent = true })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "select all" })

vim.keymap.set({ "i", "v", "x" }, "<C-l>", "<Esc>")
vim.g.python3_host_prog = "/home/anddt/.pyenv/versions/3.11.2/bin/python"
vim.g.mapleader = " "

vim.keymap.set('n', "<leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set('n', "<leader>q", ":q<CR>", { desc = "Close file" })
vim.keymap.set('n', "<leader>Q", ":qa!<CR>", { desc = "Close file" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- neovim mappings
-- splits
vim.keymap.set('n', "<A-C-l>", [[<cmd>vertical resize +5<CR>]])
vim.keymap.set('n', "<A-C-h>", [[<cmd>vertical resize -5<CR>]])
vim.keymap.set('n', "<A-C-j>", [[<cmd>horizontal resize -5<CR>]])
vim.keymap.set('n', "<A-C-k>", [[<cmd>horizontal resize +5<CR>]])
vim.keymap.set("n", "<leader>z", [[<cmd>lua require('maximize').toggle()<CR>]], { desc = "Maximize current window" })
vim.keymap.set('n', '<leader><leader>h', [[<cmd>lua require('smart-splits').swap_buf_left()<CR>]],
  { desc = "Swap buffer to the left" })
vim.keymap.set('n', '<leader><leader>j', [[<cmd>lua require('smart-splits').swap_buf_down()<CR>]],
  { desc = "Swap buffer to the bottom" })
vim.keymap.set('n', '<leader><leader>k', [[<cmd>lua require('smart-splits').swap_buf_up()<CR>]],
  { desc = "Swap buffer to the top" })
vim.keymap.set('n', '<leader><leader>l', [[<cmd>lua require('smart-splits').swap_buf_right()<CR>]],
  { desc = "Swap buffer to the right" })
vim.keymap.set('n', '<C-h>', [[<cmd> lua require('smart-splits').move_cursor_left()<CR>]])
vim.keymap.set('n', '<C-j>', [[<cmd> lua require('smart-splits').move_cursor_down()<CR>]])
vim.keymap.set('n', '<C-k>', [[<cmd> lua require('smart-splits').move_cursor_up()<CR>]])
vim.keymap.set('n', '<C-l>', [[<cmd> lua require('smart-splits').move_cursor_right()<CR>]])

-- code navigation
vim.keymap.set("n", "<leader>gR", [[<cmd>Glance references<CR>]])
vim.keymap.set("n", "<leader>gD", [[<cmd>Glance definitions<CR>]])
vim.keymap.set("n", "<leader>gT", [[<cmd>Glance type_definitions<CR>]])
-- go to specific window
for i = 1, 6 do
  local lhs = "<leader>" .. i
  local rhs = i .. "<C-W>w"
  vim.keymap.set("n", lhs, rhs, { desc = "Move to window " .. i })
end

-- tabs
vim.keymap.set("n", "<leader>tn", [[<cmd>$tabnew<CR>]], { desc = "Opena a new tab" })
vim.keymap.set("n", "<leader>tq", [[<cmd>tabclose<CR>]], { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tr", [[<cmd>TabRename]], { desc = "Rename the current tab" })
-- vim.keymap.set("n", "<leader>bM", "<C-W>\\| <C-W>_", { desc = "maximize a window" })
-- vim.keymap.set("n", "<leader>bm", "<C-W>=", { desc = "minimize a window" })

-- file explorer
vim.keymap.set("n", "<leader>ft", [[<cmd>Neotree toggle reveal_force_cwd<CR>]], { desc = "Toggle neotree" })

-- python virtual environments
vim.keymap.set("n", "<leader>pv", [[<cmd> lua require("swenv.api").pick_venv()<CR>]], { desc = "Select python venv" })

-- code
-- vim.keymap.set("n", "<leader>en", [[<cmd>lua vim.diagnostic.goto_next()<CR>]], { desc = "Go to next problem" })
-- vim.keymap.set("n", "<leader>ep", [[<cmd>lua vim.diagnostic.goto_prev()<CR>]], { desc = "Go to previous problem" })

-- git
vim.keymap.set("n", "<leader>gg", [[<cmd>Neogit<CR>]], { desc = "Neogit branch" })
vim.keymap.set("n", "<leader>gc", [[<cmd>Neogit commit<CR>]], { desc = "Neogit commit" })
vim.keymap.set("n", "<leader>gb", [[<cmd>Neogit branch<CR>]], { desc = "Neogit branch" })
vim.keymap.set("n", "<leader>gps", "[[<cmd>Neogit push<CR>]]", { desc = "Neogit push" })
vim.keymap.set("n", "<leader>gpl", [[<cmd>Neogit pull<CR>]], { desc = "Neogit pull" })
vim.keymap.set("n", "<leader>gd", "[[<cmd>Neogit diff<CR>]]", { desc = "Neogit diff" })
vim.keymap.set("n", "<leader>gl", "[[<cmd>Neogit log<CR>]]", { desc = "Neogit log" })

-- Gitsigns
vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk inline" })
vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Gitsigns reset hunk" })
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", { desc = "Gitsings next hunk" })
vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", { desc = "Reset git hunk" })
vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Gitsings stage hunk" })
vim.keymap.set("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Gitsigns unstage hunk" })

--debugger
vim.keymap.set("n", "<leader>dc", [[<cmd>lua require'dap'.continue()<CR>]],
  { desc = "Continue", silent = true })
vim.keymap.set("n", "<leader>dso", [[<cmd>lua require'dap'.step_over()<CR>]],
  { desc = "Step over", silent = true })
vim.keymap.set("n", "<leader>dsi", [[<cmd>lua require'dap'.step_into()<CR>]],
  { desc = "Step into", silent = true })
vim.keymap.set("n", "<leader>dsO", [[<cmd>lua require'dap'.step_out()<CR>]],
  { desc = "Step out", silent = true })
vim.keymap.set("n", "<F9>", [[<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<CR>]],
  { desc = "Toggle Breakpoint", silent = true })
vim.keymap.set("n", "<Leader>dr", [[<cmd>lua require'dap'.repl.open()<CR>]],
  { desc = "Open REPL", silent = true })
vim.keymap.set("n", "<Leader>dl", [[<cmd>lua require'dap'.run_last()<CR>]],
  { desc = "Run Last", silent = true })
vim.keymap.set("n", "<Leader>dq", ":DapStop<CR>",
  { desc = "Dap Stop", silent = true })
vim.keymap.set("n", "<leader>fo", "[[<cmd>SymbolsOutline<CR>]]", { desc = "Toggle symbols outline" })

-- docs
vim.keymap.set("n", "<leader>xd", [[<cmd>lua require("neogen").generate()<CR>]], { desc = "Generate docstring" })

-- tests
vim.keymap.set("n", "<leader>tF", [[<cmd>Neotest run file<CR>]], { desc = "Run entire test file" })
vim.keymap.set("n", "<leader>tl", [[<cmd>Neotest run last<CR>]], { desc = "Run last testt" })
vim.keymap.set("n", "<leader>top", [[<cmd>Neotest output-panel<CR>]], { desc = "Show tests output panel" })
vim.keymap.set("n", "<leader>too", [[<cmd>Neotest output<CR>]], { desc = "Show inline output" })
vim.keymap.set("n", "<leader>tr", [[<cmd>Neotest run<CR>]], { desc = "Neotest run" })
vim.keymap.set("n", "<leader>ts", [[<cmd>Neotest summary<CR>]], { desc = "Neotest summary" })

vim.keymap.set("n", "<leader>fe", [[<cmd>!eslint %<CR>]], { desc = "Run eslint on current file" })


-- tasks
vim.keymap.set("n", "<leader>;;", [[<cmd>OverseerToggle<CR>]], { desc = "Toggle Overseer" })
vim.keymap.set("n", "<leader>;r", [[<cmd>OverseerRestartLast<CR>]], { desc = "Overseer run" })
vim.keymap.set("n", "<leader>;c", [[<cmd>OverseerRunCmd<CR>]], { desc = "Overseer run cmd" })
vim.keymap.set("n", "<leader>;q", [[<cmd>OverseerQuickAction<CR>]], { desc = "Overseer quick action" })

-- terminals
-- TODO: revise this as getting in/out of terminals it is a bid fiddly
vim.keymap.set('t', '<C-q>', [[<C-\><C-n>]])
vim.keymap.set('t', 'jk', [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>tt", [[<Cmd>ToggleTerm<CR>]], { desc = "Toggle terminal pane" })
vim.keymap.set("n", "<leader>th1", [[<Cmd>1ToggleTerm direction=horizontal<CR>]],
  { desc = "Toggle horizontal terminal pane" })
vim.keymap.set("n", "<leader>th2", [[<Cmd>2ToggleTerm direction=horizontal<CR>]],
  { desc = "Toggle horizontal terminal pane" })
vim.keymap.set("n", "<leader>th3", [[<Cmd>3ToggleTerm direction=horizontal<CR>]],
  { desc = "Toggle horizontal terminal pane" })
vim.keymap.set("n", "<leader>tf1", [[<Cmd>1ToggleTerm direction=float<CR>]], { desc = "Toggle float terminal pane" })
vim.keymap.set("n", "<leader>tf2", [[<Cmd>2ToggleTerm direction=float<CR>]], { desc = "Toggle float terminal pane" })
vim.keymap.set("n", "<leader>tf3", [[<Cmd>3ToggleTerm direction=float<CR>]], { desc = "Toggle float terminal pane" })
vim.keymap.set("n", "<leader>tv1", [[<Cmd>1ToggleTerm direction=vertical<CR>]],
  { desc = "Toggle vertical terminal pane" })
vim.keymap.set("n", "<leader>tv2", [[<Cmd>2ToggleTerm direction=vertical<CR>]],
  { desc = "Toggle vertical terminal pane" })
vim.keymap.set("n", "<leader>tv3", [[<Cmd>3ToggleTerm direction=vertical<CR>]],
  { desc = "Toggle vertical terminal pane" })

vim.keymap.set('t', '<A-h>', [[<C-\><C-N><C-w>h]]) -- move to split h when inside in terminal [A-h]
vim.keymap.set('t', '<A-j>', [[<C-\><C-N><C-w>j]]) -- move to split j when inside in terminal [A-j]
vim.keymap.set('t', '<A-k>', [[<C-\><C-N><C-w>k]]) -- move to split k when inside in terminal [A-k]
vim.keymap.set('t', '<A-l>', [[<C-\><C-N><C-w>l]]) -- move to split k when inside in terminal [A-l]
vim.keymap.set('t', '<C-w>', "<C-w>")              -- move to split k when inside in terminal [A-l]
