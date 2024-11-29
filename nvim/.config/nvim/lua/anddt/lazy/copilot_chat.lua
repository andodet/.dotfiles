return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    cmd = { "CopilotChat" },
    event = { "InsertEnter" },
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
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
