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
  vim.keymap.set("n", "j", "gj", { remap = true, silent = true })
  vim.keymap.set("n", "k", "gk", { remap = true, silent = true })

  local function vscode_map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, function()
      require("vscode").call(rhs)
    end, { noremap = true, silent = true, nowait = true })
  end

  -- Folding
  vscode_map("n", "zM", "editor.foldAll")
  vscode_map("n", "zR", "editor.unfoldAll")
  vscode_map("n", "zc", "editor.fold")
  vscode_map("n", "zC", "editor.foldRecursively")
  vscode_map("n", "zo", "editor.unfold")
  vscode_map("n", "zO", "editor.unfoldRecursively")
  vscode_map("n", "za", "editor.toggleFold")

  -- Navigate diagnostics
  vscode_map("n", "]d", "editor.action.marker.next")
  vscode_map("n", "[d", "editor.action.marker.prev")
  vscode_map("n", "]e", "editor.action.marker.next")
  vscode_map("n", "[e", "editor.action.marker.prev")

  -- Navigate git hunks
  vscode_map("n", "]h", "workbench.action.editor.nextChange")
  vscode_map("n", "[h", "workbench.action.editor.previousChange")

  -- Format
  vscode_map("n", "<leader>cf", "editor.action.formatDocument")
  vscode_map("x", "<leader>cf", "editor.action.formatDocument")

  -- Navigate buffers (within current group)
  vscode_map("n", "L", "workbench.action.nextEditorInGroup")
  vscode_map("n", "H", "workbench.action.previousEditorInGroup")

  -- LSP Navigation
  vscode_map("n", "gd", "editor.action.revealDefinition")
  vscode_map("n", "gD", "editor.action.revealDeclaration")
  vscode_map("n", "gI", "editor.action.goToImplementation")
  vscode_map("n", "gy", "editor.action.goToTypeDefinition")
  vscode_map("n", "gr", "editor.action.goToReferences")

  vscode_map("n", "<leader>e", "workbench.view.explorer")
end
