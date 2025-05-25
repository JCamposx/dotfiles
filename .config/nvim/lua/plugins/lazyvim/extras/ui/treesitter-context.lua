-- TreeSitter Context customization
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "LazyFile",
  opts = {
    mode = "topline",
    max_lines = 0,
  },
}
