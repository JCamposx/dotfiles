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
            id = "scopes",
            size = 0.4,
          },
          {
            id = "watches",
            size = 0.4,
          },
          {
            id = "breakpoints",
            size = 0.2,
          },
        },
        position = "right",
        size = 50,
      },
      {
        elements = {
          {
            id = "repl",
            size = 1,
          },
        },
        position = "bottom",
        size = 15,
      },
    },
  },
}
