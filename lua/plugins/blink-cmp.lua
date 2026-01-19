return {
  "saghen/blink.cmp",
  dependencies = {
    -- Tambahkan ini agar blink bisa baca data dari dadbod
    "kristijanhusak/vim-dadbod-completion",
  },
  opts = {
    sources = {
      -- Tambahkan 'dadbod' ke dalam list default
      default = { "lsp", "path", "snippets", "buffer", "dadbod" },
      providers = {
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink",
        },
      },
    },
  },
}
