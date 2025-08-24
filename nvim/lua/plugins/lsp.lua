return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "basedpyright" },
    },
  },
  {
    "neovim/nvim-lspconfig",
  },
}
