return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
    opts = {
      panel = {
        enabled = true,
      },
      suggestion = {
        enabled = false,
      },
    },
  },
  {
    "giuxtaposition/blink-cmp-copilot",
  },
}
