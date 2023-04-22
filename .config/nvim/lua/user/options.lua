-- Disable Netrw at very start of init.lua (NvimTree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Neovim Options
local options = {
  syntax = "enable",
  filetype = "on",
  encoding = "UTF-8",
  number = true,
  relativenumber = true,
  mouse = "a",
  clipboard = "unnamedplus",
  showcmd = true,
  showmatch = true,
  showmode = false,
  ruler = false,
  wrap = false,
  linebreak = true,
  breakindent = true,
  termguicolors = true,
  cursorline = false,
  autoindent = true,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  smartindent = true,
  backspace = "indent,eol,start",
  bufhidden = "delete",
  foldlevelstart = 99,
  foldmethod = "indent",
  confirm = true,
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  swapfile = false,
  autoread = true,
  updatetime = 100,
}

vim.opt.matchpairs:append("<:>")

for k, v in pairs(options) do
  vim.opt[k] = v
end
