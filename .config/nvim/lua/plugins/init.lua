-- Import plugins from children directories
return {
  -- LazyVim Editor
  { import = "plugins.lazyvim.editor.gitsigns" },

  -- LazyVim Extras
  { import = "plugins.lazyvim.extras.coding.blink-cmp" },
  { import = "plugins.lazyvim.extras.dap.dap-core" },
  { import = "plugins.lazyvim.extras.dap.dap-ui" },
  { import = "plugins.lazyvim.extras.dap.adapters.dotnet" },
  { import = "plugins.lazyvim.extras.dap.adapters.go" },
  { import = "plugins.lazyvim.extras.formatting.conform" },
  { import = "plugins.lazyvim.extras.ui.treesitter-context" },

  -- LazyVim Linting
  { import = "plugins.lazyvim.linting.lint" },
  { import = "plugins.lazyvim.linting.langs.go" },

  -- LazyVim LSP
  { import = "plugins.lazyvim.lsp.lsp-config" },
  { import = "plugins.lazyvim.lsp.mason" },
  { import = "plugins.lazyvim.lsp.servers.roslyn" },

  -- LazyVim UI
  { import = "plugins.lazyvim.ui.bufferline" },
  { import = "plugins.lazyvim.ui.lualine" },
  { import = "plugins.lazyvim.ui.noice" },

  -- LazyVim Utils
  { import = "plugins.lazyvim.utils.snacks" },

  -- Personal plugins
  { import = "plugins.user.commasemi" },
  { import = "plugins.user.diffview" },
  { import = "plugins.user.neogit" },
  { import = "plugins.user.rip-substitute" },
}
