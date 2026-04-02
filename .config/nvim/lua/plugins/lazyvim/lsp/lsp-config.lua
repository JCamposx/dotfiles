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
      ["*"] = {
        -- stylua: ignore
        keys = {
          { "<C-k>", false, mode = "i" },
          { "<C-h>", function() return vim.lsp.buf.signature_help() end, mode = "i", desc = "Signature Help", has = "signatureHelp" },
        },
      },
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
