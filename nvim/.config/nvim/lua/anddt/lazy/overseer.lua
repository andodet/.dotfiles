return {
  'stevearc/overseer.nvim',
  opts = {},
  dependencies = {
    "stevearc/dressing.nvim"
  },
  config = function()
    require("overseer").setup({
      templates = { "builtin" },
    })
    vim.api.nvim_create_user_command("OverseerRestartLast", function()
      local overseer = require("overseer")
      local tasks = overseer.list_tasks({ recent_first = true })
      if vim.tbl_isempty(tasks) then
        vim.notify("No tasks found", vim.log.levels.WARN)
      else
        overseer.run_action(tasks[1], "restart")
      end
    end, {})
  end,
  cond = vim.fn.exists('g:vscode') == 0
}
