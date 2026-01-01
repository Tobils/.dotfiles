return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- load sebelum buffer kebaca
    opts = {
      options = {
        "buffers",
        "curdir",
        "tabpages",
        "winsize",
      },
    },
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
        desc = "Restore session (cwd)",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "Restore last session",
      },
      {
        "<leader>qd",
        function()
          require("persistence").stop()
        end,
        desc = "Disable session saving",
      },
    },
  },
}
