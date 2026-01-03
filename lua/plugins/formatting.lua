return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    opts = function(_, opts)
      -- 🔒 SAFETY GUARD (WAJIB)
      opts.sources = opts.sources or {}
      opts.formatting = opts.formatting or {}

      -- emoji source
      table.insert(opts.sources, { name = "emoji" })

      -- tailwind color preview
      opts.formatting.format =
        require("tailwindcss-colorizer-cmp").formatter
    end,
  },
}

