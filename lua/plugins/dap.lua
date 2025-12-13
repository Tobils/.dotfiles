return {
  -- Core DAP
  {
    "mfussenegger/nvim-dap",
    lazy = false, -- 👈 WAJIB: load saat startup
    config = function()
      local dap = require("dap")
    end,
  },

  -- DAP UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    lazy = false, -- 👈 optional, tapi bagus di-load awal
    config = function()
      require("dapui").setup()
    end,
  },

  -- Go Debugger
  {
    "leoluz/nvim-dap-go",
    ft = { "go" },
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-go").setup()
    end,
  },
}
