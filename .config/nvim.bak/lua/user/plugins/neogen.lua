require("neogen").setup({
  enabled = true,
})

-- Keymaps

local opts = { noremap = true, silent = true }

-- Generate function docstring
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)

-- Generate class docstring
vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
