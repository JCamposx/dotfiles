local map = LazyVim.safe_keymap_set

-- Custom keymaps
map({ "n", "x" }, "<C-a>", "<Esc>ggVG", { desc = "Select All", noremap = true, silent = true, nowait = true })

-- Delete LazyVim default keybinds
-- Snacks
vim.keymap.del("n", "<leader>fe") -- Open Explorer (Root Dir)
vim.keymap.del("n", "<leader>fE") -- Open Explorer (cwd)
vim.keymap.del("n", "<leader>E") -- Open Explorer (cwd)
vim.keymap.del("n", "<leader>ff") -- Find Files
vim.keymap.del("n", "<leader>fF") -- Find Files (cwd)
vim.keymap.del("n", "<leader>ft") -- Open Terminal (Root Dir)
vim.keymap.del("n", "<leader>fT") -- Open Terminal (cwd)
-- Buffers
vim.keymap.del("n", "<leader>bd") -- Delete Buffer
vim.keymap.del("n", "<leader>bD") -- Delete Buffer and Window
vim.keymap.del("n", "[b") -- Previous Buffer
vim.keymap.del("n", "]b") -- Next Buffer
-- Grep
vim.keymap.del("n", "<leader>sg") -- Grep (Root Dir)
vim.keymap.del("n", "<leader>sG") -- Grep (cwd)
