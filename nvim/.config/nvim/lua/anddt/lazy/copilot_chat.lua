return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = { "CopilotChat" },
    event = { "InsertEnter" },
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
      model = "claude-3.5-sonnet",
      prompts = {
        Review = {
          prompt = '/COPILOT_REVIEW Review the selected code.',
          callback = function(response, source)
          end
        }
      }
    },
  },
}
