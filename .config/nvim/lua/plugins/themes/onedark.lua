-- OneDarkPro theme configuration
return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  opts = {
    options = {
      transparency = true,
      terminal_colors = false,
    },
    styles = {
      types = "italic",
      comments = "italic",
      keywords = "italic",
      virtual_text = "italic",
    },
    highlights = {
      Pmenu = { bg = "NONE" },
      Cursor = { bg = "#abb2bf", fg = "#111318" },
      TermCursor = { link = "Cursor" },
      SnacksPickerGitStatusUntracked = { link = "Added" },
    },
  },
}
