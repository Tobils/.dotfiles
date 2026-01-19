return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
    },

    opts = {
      servers = {

        -- Disable basedpyright
        basedpyright = false,

        -- Python
        pyright = {},

        -- TypeScript / React / Next.js
        ts_ls = {},

        -- prisma
        prismals = {},

        -- Tailwind CSS
        tailwindcss = {
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "liquid",
          },
          init_options = {
            userLanguages = {
              typescript = "javascript",
              typescriptreact = "javascript",
              liquid = "html",
            },
          },
        },

        -- ESLint (recommended)
        eslint = {},

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

      setup = {
        -- TypeScript override
        ts_ls = function(_, opts)
          require("typescript").setup({
            server = opts,
          })
          return true
        end,

        -- ESLint auto-fix on save
        eslint = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            command = "EslintFixAll",
          })
        end,
      },
    },
  },
}
