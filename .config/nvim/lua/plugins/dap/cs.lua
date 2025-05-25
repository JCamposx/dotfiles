-- DAP setup for C#
return {
  "nicholasmata/nvim-dap-cs",
  dependencies = { "mfussenegger/nvim-dap" },
  lazy = true,
  ft = "cs",
  opts = {
    netcoredbg = {
      path = "netcoredbg",
    },
  },
}
