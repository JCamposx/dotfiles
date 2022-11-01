vim.cmd("highlight IndentBlanklineContextChar guifg=#858585")

require("indent_blankline").setup({
  show_current_context = true,
  show_trailing_blankline_indent = false,
  filetype_exclude = {
    "lspinfo",
    "packer",
    "checkhealth",
    "help",
    "man",
    "NvimTree",
    "",
  },
})
