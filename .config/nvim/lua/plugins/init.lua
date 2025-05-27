-- Import plugins from children directories
return {
  -- LazyVim Editor
  { import = "plugins.lazyvim.editor.grug-far" },
  { import = "plugins.lazyvim.editor.gitsigns" },

  -- LazyVim Extras
  { import = "plugins.lazyvim.extras.dap-ui" },
  { import = "plugins.lazyvim.extras.ai.copilot-chat" },
  { import = "plugins.lazyvim.extras.coding.cmp" },
  { import = "plugins.lazyvim.extras.ui.treesitter-context" },

  -- LazyVim LSP
  { import = "plugins.lazyvim.lsp.lsp-config" },
  { import = "plugins.lazyvim.lsp.mason" },

  -- LazyVim UI
  { import = "plugins.lazyvim.ui.bufferline" },
  { import = "plugins.lazyvim.ui.lualine" },
  { import = "plugins.lazyvim.ui.noice" },

  -- LazyVim Utils
  { import = "plugins.lazyvim.utils.snacks" },

  -- DAP tools
  { import = "plugins.dap.cs" },

  -- Personal plugins
  { import = "plugins.user.commasemi" },
}
