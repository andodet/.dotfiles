local dap = require("dap")
-- define a few custom runners for dap
table.insert(dap.configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Launch file with arguments (custom)',
  program = '${file}',
  cwd = "${workspaceFolder}",
  args = function()
    local args_string = vim.fn.input('Arguments: ')
    return vim.split(args_string, " +")
  end,
})
