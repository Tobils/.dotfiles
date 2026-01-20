return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = false },
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        lazy = false,
      },
    },
    lazy = false,
    keys = {
      { "<leader>du", "<cmd>DBUIToggle<cr>", desc = "Toggle Dadbod UI" },
      { "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "Find DB Buffer" },
      { "<leader>dr", "<cmd>DBUIRenameBuffer<cr>", desc = "Rename DB Buffer" },
      { "<leader>dl", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_help = 0
      vim.g.db_ui_win_width = 30
      vim.g.db_ui_force_echo_execute = 1
      vim.g.db_ui_execute_on_save = 0
      vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_queries"
    end,
  },
}
