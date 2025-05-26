-- Terminal integration for Neovim
return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = true,
  keys = {
    { "<C-/>", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Open Terminal" },
    { "<C-\\>", "<cmd>ToggleTerm direction=float<CR>", desc = "Open Float Terminal" },
  },
  opts = {
    autochdir = false,
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
