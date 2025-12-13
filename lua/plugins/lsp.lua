return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
    },

    opts = {
      servers = {

        -- Disable basedpyright completely
        basedpyright = false,

        -- Enable Pyright
        pyright = {},

        -- TypeScript
        tsserver = {},

        -- Go
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              usePlaceholders = true,
              completeUnimported = true,
              analyses = {
                unusedparams = true,
                fieldalignment = true,
              },
              staticcheck = true,
            },
          },
        },
      },

      -- Setup override
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },
}
