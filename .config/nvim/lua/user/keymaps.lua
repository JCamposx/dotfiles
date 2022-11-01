local keymap = function(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true, nowait = true })
end

-- Leader
vim.g.mapleader = " "

-- Save changes
keymap("n", "<C-s>", ":w<CR>")
keymap("i", "<C-s>", "<Esc>:w<CR>")
keymap("v", "<C-s>", "<Esc>:w<CR>gv")

-- Quit
keymap("n", "<C-q>", ":q<CR>")
keymap("i", "<C-q>", "<Esc>:q<CR>")
keymap("v", "<C-q>", "<Esc>:q<CR>")

-- Undo
keymap("n", "<C-z>", "u")
keymap("i", "<C-z>", "<Esc>ui")
keymap("v", "<C-z>", "<Esc>ugv")

-- Redo
keymap("i", "<C-r>", "<Esc><C-r>i")
keymap("v", "<C-r>", "<Esc><C-r><CR>gv")

-- Open last closed buffer
keymap("n", "<Leader>\\", ":vsplit# | :wincmd l | :q<CR>")

-- Unmap page up/down
keymap("n", "<PageUp>", "<Nop>")
keymap("n", "<PageDown>", "<Nop>")
keymap("i", "<PageUp>", "<Nop>")
keymap("i", "<PageDown>", "<Nop>")
keymap("v", "<PageUp>", "<Nop>")
keymap("v", "<PageDown>", "<Nop>")

-- Unmap record macro
keymap("n", "q", "<Nop>")
keymap("v", "q", "<Nop>")
keymap("v", "qq", "<Nop>")

-- Delete word before cursor
keymap("n", "<C-w>", "a<C-w><Esc>")

-- Go to next line
keymap("i", "<A-CR>", "<Esc>o")

-- Horizontal mouse scroll adjust
keymap("i", "<S-ScrollWheelUp>", "<Esc>2zha")
keymap("i", "<S-ScrollWheelDown>", "<Esc>2zla")
keymap("n", "<S-ScrollWheelUp>", "2zh")
keymap("n", "<S-ScrollWheelDown>", "2zl")
keymap("v", "<S-ScrollWheelUp>", "2zh")
keymap("v", "<S-ScrollWheelDown>", "2zh")

-- Vertical mouse scroll adjust
keymap("i", "<ScrollWheelUp>", "<Esc>2<C-y>a")
keymap("i", "<ScrollWheelDown>", "<Esc>2<C-e>a")
keymap("n", "<ScrollWheelUp>", "2<C-y>")
keymap("n", "<ScrollWheelDown>", "2<C-e>")
keymap("v", "<ScrollWheelUp>", "2<C-y>")
keymap("v", "<ScrollWheelDown>", "2<C-e>")

-- Surround mouse selection
keymap("v", '"', '<Esc>`>a"<Esc>`<i"<Esc>`>ll')
keymap("v", "'", "<Esc>`>a'<Esc>`<i'<Esc>`>ll")
keymap("v", "`", "<Esc>`>a`<Esc>`<i`<Esc>`>ll")
keymap("v", "(", "<Esc>`>a)<Esc>`<i(<Esc>`>ll")
keymap("v", "{", "<Esc>`>a}<Esc>`<i{<Esc>`>ll")

-- Delete word after cursor
keymap("n", "<A-d>", "dw")
keymap("n", "<A-D>", "dw")
keymap("i", "<A-d>", "<Esc>ldwi")
keymap("i", "<A-D>", "<Esc>ldwi")

-- Tab lines
keymap("n", ">", ">>")
keymap("n", "<", "<<")
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")

-- Split tabs
keymap("n", "<C-\\>", ":vsplit<CR>:wincmd l<CR>")
keymap("n", "<A-\\>", ":split<CR>:wincmd j<CR>")

-- Move between split tabs
keymap("n", "<C-k>", ":wincmd k<CR>")
keymap("n", "<C-j>", ":wincmd j<CR>")
keymap("n", "<C-h>", ":wincmd h<CR>")
keymap("n", "<C-l>", ":wincmd l<CR>")

-- Resize vertical split size
keymap("n", "=", ":vertical resize +2<CR>")
keymap("n", "-", ":vertical resize -2<CR>")

-- Resize horizontal split size
keymap("n", "+", ":resize +2<CR>")
keymap("n", "_", ":resize -2<CR>")

-- Move line(s) up
keymap("n", "<A-k>", ":m-2<CR>")
keymap("i", "<A-k>", "<Esc>:m-2<CR>a")
keymap("v", "<A-k>", ":m-2<CR>gv")

-- Move line(s) down
keymap("n", "<A-j>", ":m+1<CR>")
keymap("i", "<A-j>", "<Esc>:m+1<CR>a")
keymap("v", "<A-j>", ":m '>+1<CR>gv")

-- Go next/previous coincidence adjust
keymap("n", "n", "n")
keymap("n", "N", "N")

-- Move betweet words adjust
keymap("n", "<C-Right>", "w")
keymap("n", "<C-Left>", "b")
keymap("v", "<C-Right>", "w")
keymap("v", "<C-Left>", "b")

-- Select all lines
keymap("n", "<C-A>", "ggVG")

-- Clear search highlight
keymap("n", "<Leader>hh", ":noh<CR>")

-- Quick ; at the end of line
keymap("n", "<A-;>", ":call setline('.', getline('.') . ';')<CR>")
keymap("i", "<A-;>", "<Esc>:call setline('.', getline('.') . ';')<CR>a")
