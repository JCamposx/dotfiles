-- Keymaps

local opts = { noremap = true, silent = true, nowait = true }

vim.api.nvim_set_keymap("n", "<Leader>tt", ":NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("v", "<Leader>tt", "<Esc>:NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("t", "<Leader>tt", "<C-\\><C-n>:NvimTreeToggle<CR>a", opts)

-- Setup

local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup({
  open_on_setup = true,
  hijack_cursor = true,
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
  view = {
    width = 30,
    side = "left",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
        { key = "h", cb = tree_cb("close_node") },
        { key = "v", cb = tree_cb("vsplit") },
        { key = "w", cb = tree_cb("collapse_all") },
      },
    },
  },
  remove_keymaps = { "<C-t>", "s", "-", "m", "f" },
  git = {
    enable = true,
    ignore = false,
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  renderer = {
    root_folder_modifier = ":t",
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "★",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
})
