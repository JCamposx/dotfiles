-- Terminal integration for Neovim
return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = true,
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm direction=float<CR>", desc = "Open float terminal" },
  },
  opts = {
    autochdir = true,
  },
}
