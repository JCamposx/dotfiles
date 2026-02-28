-- Interactive Git UI
return {
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "folke/snacks.nvim",
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<CMD>Neogit<CR>", desc = "Show Neogit UI" },
  },
}
