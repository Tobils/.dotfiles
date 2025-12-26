return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<leader>o", false }, -- disable default <leader>o
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false, -- show hidden files by default
        custom = {},
      },
    })
  end,
}

