-- return {
--   "saghen/blink.cmp",
--   dependencies = { "rafamadriz/friendly-snippets" },
--
--   opts = {
--     sources = {
--       default = { "lsp", "path", "buffer", "snippets" },
--     },
--
--     completion = {
--       -- Enter = terima completion + jalankan LSP edits
--       selection = "enter",
--
--       -- INI yang membuat gopls bisa auto-import
--       additional_text_edits = true,
--
--       accept = {
--         auto_brackets = {
--           enabled = true,
--         },
--       },
--     },
--   },
-- }

return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },

  opts = {
    sources = {
      default = { "lsp", "path", "buffer", "snippets" },
    },

    completion = {
      menu = {
        auto_show = true,
      },

      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
    },
  },
}
