return {
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        -- "giuxtaposition/blink-cmp-copilot",
      },
    },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          -- copilot = {
          --   name = "copilot",
          --   module = "blink-cmp-copilot",
          --   score_offset = 100,
          --   async = true,
          -- },
        },
      },
    },
  },
}
