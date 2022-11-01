-- Keymaps

local opts = { noremap = true, silent = true, nowait = true }

-- Find files
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files hidden=true no_ignore=true<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-p>", "<Esc>:Telescope find_files hidden=true no_ignore=true<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-p>", "<Esc>:Telescope find_files hidden=true no_ignore=true<CR>", opts)

-- Live grep
vim.api.nvim_set_keymap("n", "<C-t>", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-t>", "<Esc>:Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-t>", "<Esc>:Telescope live_grep<CR>", opts)

-- Buffers
vim.api.nvim_set_keymap("n", "<C-x>", ":Telescope buffers sort_lastused=true<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-x>", "<Esc>:Telescope buffers sort_lastused=true<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-x>", "<Esc>:Telescope buffers sort_lastused=true<CR>", opts)

-- Setup

local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    prompt_prefix = " ",
    path_display = { "smart" },
    mappings = {
      i = {
        -- Keymaps help
        ["<C-h>"] = "which_key",

        -- Select next item
        ["<S-Tab>"] = actions.move_selection_next,
        ["<C-j>"] = actions.move_selection_next,
        ["<Down>"] = actions.move_selection_next,

        -- Select previous item
        ["<Tab>"] = actions.move_selection_previous,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Up>"] = actions.move_selection_previous,

        -- Close with one <Esc>
        ["<Esc>"] = actions.close,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
})
