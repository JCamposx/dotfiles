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
    highlights = {
      FloatBorder = {
        guifg = "#5c6370",
      },
    },
    float_opts = {
      border = "curved",
    },
  },
}
