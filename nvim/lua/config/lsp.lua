local lspconfig = require("lspconfig")
lspconfig.basedpyright.setup({
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "basic",
      },
    },
  },
})

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
