-- CMP customization

-- Fix transparency
vim.opt.pumblend = 0
vim.opt.winblend = 0

return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.window = {
      completion = { border = "rounded" },
      documentation = { border = "rounded" },
    }

    opts.mapping = cmp.mapping.preset.insert({
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<S-CR>"] = LazyVim.cmp.confirm({ select = true }),
      ["<tab>"] = LazyVim.cmp.confirm({ select = true }),
    })
  end,
}
