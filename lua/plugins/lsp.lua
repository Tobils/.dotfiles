return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
    },

    opts = {
      servers = {
        -- Disable all LSP temporarily
        basedpyright = false,
        pyright = false,
        lua_ls = true,
        ts_ls = true,
        prismals = true,
        tailwindcss = true,
        eslint = true,
        gopls = true,
      },

      setup = {},
    },
  },
}

