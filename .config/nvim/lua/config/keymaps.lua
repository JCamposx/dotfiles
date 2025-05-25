local map = LazyVim.safe_keymap_set

-- Custom keymaps
map({ "n", "x" }, "<C-q>", "<Esc>:q<CR>", { desc = "Close Window", noremap = true, silent = true, nowait = true })
map({ "n", "x" }, "<C-a>", "<Esc>ggVG", { desc = "Select All", noremap = true, silent = true, nowait = true })

-- Delete LazyVim default keyMappings
vim.keymap.del("n", "<leader>bd") -- Delete Buffer
vim.keymap.del("n", "<leader>bD") -- Delete Buffer and Window
vim.keymap.del("n", "[b") -- Previous Buffer
vim.keymap.del("n", "]b") -- Next Buffer
