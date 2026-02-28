-- LSP Config customization
return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    diagnostics = {
      float = {
        border = "rounded",
      },
    },
    servers = {
      gopls = {
        settings = {
          gopls = {
            analyses = {
              ST1000 = false, -- Disable missing package doc comment warning
            },
          },
        },
      },
    },
  },
}
