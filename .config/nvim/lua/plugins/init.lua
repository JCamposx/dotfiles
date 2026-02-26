-- Import plugins from children directories
return {
  -- LazyVim Editor
  { import = "plugins.lazyvim.editor.gitsigns" },

  -- LazyVim Extras
  { import = "plugins.lazyvim.extras.coding.blink-cmp" },
  { import = "plugins.lazyvim.extras.ui.treesitter-context" },

  -- LazyVim Linting
  { import = "plugins.lazyvim.linting.lint" },

  -- LazyVim LSP
  { import = "plugins.lazyvim.lsp.lsp-config" },
  { import = "plugins.lazyvim.lsp.mason" },

  -- LazyVim UI
  { import = "plugins.lazyvim.ui.bufferline" },
  { import = "plugins.lazyvim.ui.lualine" },
  { import = "plugins.lazyvim.ui.noice" },

  -- LazyVim Utils
  { import = "plugins.lazyvim.utils.snacks" },

  -- Personal plugins
  { import = "plugins.user.commasemi" },
  { import = "plugins.user.oil" },
  { import = "plugins.user.rip-substitute" },
}
