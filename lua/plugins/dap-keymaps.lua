return {
  {
    "mfussenegger/nvim-dap",
    keys = function()
      local dap = require("dap")
      local dapui = require("dapui")

      return {
        -- Debug controls
        { "<F5>", dap.continue, desc = "Debug: Start / Continue" },
        { "<F10>", dap.step_over, desc = "Debug: Step Over" },
        { "<F11>", dap.step_into, desc = "Debug: Step Into" },
        { "<F12>", dap.step_out, desc = "Debug: Step Out" },

        -- Breakpoints
        { "<leader>b", dap.toggle_breakpoint, desc = "Debug: Toggle Breakpoint" },
        {
          "<leader>B",
          function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
          end,
          desc = "Debug: Conditional Breakpoint",
        },

        -- UI (sidebar / scopes / repl)
        { "<leader>du", dapui.toggle, desc = "Debug: Toggle UI" },
        { "<leader>dr", dap.repl.open, desc = "Debug: REPL" },
      }
    end,
  },
