return {
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "giuxtaposition/blink-cmp-copilot",
        "Exafunction/windsurf.nvim",
      },
    },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot", "codeium" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
          codeium = {
            name = "Codeium",
            module = "codeium.blink",
            async = true,
          },
        },
      },
    },
  },
}
