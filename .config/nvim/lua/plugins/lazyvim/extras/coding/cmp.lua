-- CMP customization

-- Fix transparency
vim.opt.pumblend = 0
vim.opt.winblend = 0

return {
  "hrsh7th/nvim-cmp",
  opts = {
    window = {
      completion = { border = "rounded" },
      documentation = { border = "rounded" },
    },
  },
}
