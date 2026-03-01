-- Disable animations
vim.g.snacks_animate = false

-- Prevent folds from opening on block motions
vim.opt.foldopen:remove("block")

-- Border style for floating windows
vim.o.winborder = "rounded"

-- Enable word wrapping
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Enable spell checking for English and Spanish
vim.opt.spell = true
vim.opt.spelllang = { "en", "es" }

-- VSCode
if vim.g.vscode then
  vim.opt.spell = false
end
