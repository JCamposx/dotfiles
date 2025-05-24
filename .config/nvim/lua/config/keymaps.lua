local opts = { noremap = true, silent = true, nowait = true }

-- Close window
vim.api.nvim_set_keymap("n", "<C-q>", ":q<CR>", opts)

-- Select all
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", opts)

return {
  opts = opts,
}
