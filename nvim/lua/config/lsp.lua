require("conform").setup({
  default_format_opts = { lsp_format = "fallback" },
  formatters_by_ft = {
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
  },
})

require("refactoring").setup()
