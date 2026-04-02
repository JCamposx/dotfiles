-- Mason customization
return {

  "mason-org/mason.nvim",
  opts = {
    ui = {
      border = "rounded",
    },
    registries = {
      "github:Crashdummyy/mason-registry",
      "github:mason-org/mason-registry",
    },
    ensure_installed = {
      "roslyn",
    },
  },
}
