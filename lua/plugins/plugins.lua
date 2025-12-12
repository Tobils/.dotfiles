-- toggle terminal
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        shade_terminals = true,
        direction = "float",
        float_opts = {
          border = "rounded",
        },
        open_mapping = [[<leader>t]],
      })
    end,
  },
}
