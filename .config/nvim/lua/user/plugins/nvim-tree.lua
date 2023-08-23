-- Keymaps

local opts = { noremap = true, silent = true, nowait = true }

vim.api.nvim_set_keymap("n", "<Leader>b", ":NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("v", "<Leader>b", "<Esc>:NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("t", "<Leader>b", "<C-\\><C-n>:NvimTreeToggle<CR>a", opts)

-- Setup

local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.del('n', '<C-t>', { buffer = bufnr })
  vim.keymap.del('n', 's', { buffer = bufnr })
  vim.keymap.del('n', '-', { buffer = bufnr })
  vim.keymap.del('n', 'm', { buffer = bufnr })
  vim.keymap.del('n', 'f', { buffer = bufnr })

  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'b', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'w', api.tree.collapse_all, opts('Collapse'))
end

require("nvim-tree").setup({
  on_attach = my_on_attach,
  hijack_cursor = true,
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
  view = {
    width = 30,
    side = "right",
  },
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
