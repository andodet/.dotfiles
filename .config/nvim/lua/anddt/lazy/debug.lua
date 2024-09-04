return {
  "mfussenegger/nvim-dap",
  cond = vim.fn.exists('g:vscode') == 0,
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      opts = {},
      config = function(_, opts)
        -- setup dap config by VsCode launch.json file
        -- require("dap.ext.vscode").load_launchjs()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close({})
        end

        vim.api.nvim_create_user_command("RunScriptWithArgs", function(t)
          -- :help nvim_create_user_command
          args = vim.split(vim.fn.expand(t.args), '\n')
          approval = vim.fn.confirm(
            "Will try to run:\n    " ..
            vim.bo.filetype .. " " ..
            vim.fn.expand('%') .. " " ..
            t.args .. "\n\n" ..
            "Do you approve? ",
            "&Yes\n&No", 1
          )
          if approval == 1 then
            dap.run({
              type = vim.bo.filetype,
              request = 'launch',
              name = 'Launch file with custom arguments (adhoc)',
              program = '${file}',
              args = args,
            })
          end
        end, {
          complete = 'file',
          nargs = '*'
        })

        -- avoid auto-closing the UI on error exit
        function dapui_no_close()
          require('dapui').close()
          require('dap').disconnect()
          require('dap').close()
        end

        -- Map the function to the exit command
        vim.cmd [[
          augroup dapui_no_close
          autocmd!
          autocmd FileType dap-repl lua dapui_no_close()
          augroup END
        ]]
      end,
    },
    {
      "nvim-neotest/nvim-nio"
    },
    keys = {
      { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
    },

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },

    -- which key integration
    {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        defaults = {
          ["<leader>d"] = { name = "+debug" },
        },
      },
    },

    -- mason.nvim integration
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = "mason.nvim",
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {
          function(config)
            require("mason-nvim-dap").default_setup(config)
          end
        },

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          "python", "go"
        },
      },
    },
    {
      'mfussenegger/nvim-dap-python',
      cond = vim.fn.exists('g:vscode') == 0,
      dependencies = {
        'mfussenegger/nvim-dap',
        'rcarriga/nvim-dap-ui',
      },
      config = function()
        require("dap-python").setup("/home/anddt/.pyenv/versions/3.12.4/bin/python")
      end
    }
  },
}
