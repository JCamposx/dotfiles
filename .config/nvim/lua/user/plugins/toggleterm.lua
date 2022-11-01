require("toggleterm").setup({
  hide_numbers = true,
})

-- Keymaps

local opts = { noremap = true, silent = true, nowait = true }

-- Toggle terminal in normal mode
vim.api.nvim_set_keymap("n", "<A-Esc>", ":ToggleTerm size=20 direction=horizontal<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader><Esc>", ":ToggleTerm size=50 direction=vertical<CR>", opts)

-- Toggle terminal in term mode
vim.api.nvim_set_keymap("t", "<A-Esc>", "<C-\\><C-n>:ToggleTerm<CR>", opts)
vim.api.nvim_set_keymap("t", "<Leader><Esc>", "<C-\\><C-n>:ToggleTerm<CR>", opts)
vim.api.nvim_set_keymap("t", "<C-q>", "<C-\\><C-n>:ToggleTerm<CR>", opts)

-- Move between split tabs in term mode
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n>:wincmd k<CR>", opts)
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n>:wincmd j<CR>", opts)
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n>:wincmd h<CR>", opts)
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n>:wincmd l<CR>", opts)

-- Terminal to normal mode
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)
