-- DAP UI customization
return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  lazy = true,
  opts = {
    layouts = {
      {
        elements = {
          {
            id = "repl",
            size = 0.05,
          },
          {
            id = "scopes",
            size = 0.4,
          },
          {
            id = "watches",
            size = 0.4,
          },
          {
            id = "breakpoints",
            size = 0.15,
          },
        },
        position = "right",
        size = 40,
      },
    },
  },
}
