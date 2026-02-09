local map = LazyVim.safe_keymap_set

-- Custom keymaps
map({ "n", "x" }, "<C-a>", "<Esc>ggVG", { desc = "Select All", noremap = true, silent = true, nowait = true })
map("x", "p", '"_dP', { desc = "Paste without overwriting register", noremap = true, silent = true, nowait = true })

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
vim.keymap.del("n", "[B") -- Move Buffer to Previous
vim.keymap.del("n", "]B") -- Move Buffer to Next
-- Grep
vim.keymap.del("n", "<leader>sg") -- Grep (Root Dir)
vim.keymap.del("n", "<leader>sG") -- Grep (cwd)

-- VSCode
if vim.g.vscode then
  vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true, nowait = true })
  vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true, nowait = true })

  local function vscode_map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, function()
      require("vscode").call(rhs)
    end, { noremap = true, silent = true, nowait = true })
  end

  vscode_map("n", "zM", "editor.foldAll")
  vscode_map("n", "zR", "editor.unfoldAll")
  vscode_map("n", "zc", "editor.fold")
  vscode_map("n", "zC", "editor.foldRecursively")
  vscode_map("n", "zo", "editor.unfold")
  vscode_map("n", "zO", "editor.unfoldRecursively")
  vscode_map("n", "za", "editor.toggleFold")
end
