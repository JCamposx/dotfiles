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
          { "<A-space>", false, mode = "i" },
          { "<A-space>", function() return vim.lsp.buf.signature_help() end, mode = { "n", "i" }, desc = "Signature Help", has = "signatureHelp" }
        },
      },
      omnisharp = {
        enabled = false,
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
