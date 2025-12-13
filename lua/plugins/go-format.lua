return {
  {
    "nvimtools/none-ls.nvim",
    ft = "go",
    config = function()
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  },
}
