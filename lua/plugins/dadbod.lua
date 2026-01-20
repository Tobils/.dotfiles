return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = false },
      { "kristijanhusak/vim-dadbod-completion", lazy = false },
    },
    -- Mematikan lazy loading agar command :DBUI langsung tersedia
    lazy = false,
    keys = {
      { "<leader>du", "<cmd>DBUIToggle<cr>", desc = "Toggle Dadbod UI" },
      { "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "Find DB Buffer" },
      { "<leader>dr", "<cmd>DBUIRenameBuffer<cr>", desc = "Rename DB Buffer" },
      { "<leader>dl", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
    },
    init = function()
      -- Konfigurasi tampilan UI
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_help = 0
      vim.g.db_ui_win_width = 30
      vim.g.db_ui_force_echo_execute = 1

      -- Lokasi penyimpanan query favorit/history
      -- Pastikan folder ini ada atau akan dibuat otomatis
      vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_queries"
    end,
  },
}
