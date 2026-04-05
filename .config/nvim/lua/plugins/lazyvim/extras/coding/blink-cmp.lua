-- Blink.CMP customization
return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      documentation = {
        auto_show = false,
      },
    },
    keymap = {
      preset = "super-tab",
      ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-j>"] = { "select_next", "fallback_to_mappings" },
    },
    cmdline = {
      enabled = true,
      keymap = {
        preset = "inherit",
      },
    },
  },
}
