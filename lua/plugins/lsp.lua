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
        lua_ls = false,
        ts_ls = false,
        prismals = false,
        tailwindcss = false,
        eslint = false,
        gopls = false,
      },

      setup = {},
    },
  },
}