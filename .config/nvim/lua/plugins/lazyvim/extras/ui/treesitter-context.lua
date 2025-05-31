-- TreeSitter Context customization
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "LazyFile",
  opts = {
    mode = "cursor",
    max_lines = 5,
  },
}
