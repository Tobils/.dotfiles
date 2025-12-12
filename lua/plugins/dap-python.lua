-- return {
--   {
--     "mfussenegger/nvim-dap-python",
--     ft = "python",
--     dependencies = { "mfussenegger/nvim-dap" },
--     config = function()
--       local python = vim.fn.exepath("python3")
--       require("dap-python").setup(python)
--     end,
--   },
-- }

return {
  -- Nonaktifkan dap core dari LazyVim
  { "mfussenegger/nvim-dap", enabled = false },

  -- Setup ulang dari awal
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Debug: Continue",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Debug: Step Over",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Debug: Toggle Breakpoint",
      },
    },
    config = function()
      local dap = require("dap")
      -- Konfigurasi basic dap di sini kalau perlu
    end,
  },

  -- DAP Python
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local python = vim.fn.exepath("python3") or "python3"
      require("dap-python").setup(python)
    end,
  },
}
