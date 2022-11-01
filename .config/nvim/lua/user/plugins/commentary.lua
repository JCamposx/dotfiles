vim.cmd("autocmd FileType php set commentstring=/\\/\\ %s")

--Keymaps

local opts = { noremap = true, silent = true, nowait = true }

-- Toggle comments
vim.api.nvim_set_keymap("n", "<Leader>/", ":Commentary<CR>", opts)
vim.api.nvim_set_keymap("v", "<Leader>/", ":Commentary<CR>gv", opts)
