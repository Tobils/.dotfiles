return {
  {
    "neovim/nvim-lspconfig",
    ft = { "go" },
    config = function()
      -- Autoformat Go on Save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  },
}
