return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    opts = function(_, opts)
      -- emoji
      table.insert(opts.sources, { name = "emoji" })

      -- tailwind color preview
      opts.formatting = opts.formatting or {}
      opts.formatting.format = require("tailwindcss-colorizer-cmp").formatter
    end,
  },
}
