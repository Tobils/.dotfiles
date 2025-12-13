return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },

  opts = {
    sources = {
      default = { "lsp", "path", "buffer", "snippets" },
    },

    completion = {
      accept = {
        -- Enter = terima completion + jalankan LSP edits
        selection = "enter",

        -- INI yang membuat gopls bisa auto-import
        additional_text_edits = true,

        auto_brackets = {
          enabled = true,
        },
      },
    },
  },
}
