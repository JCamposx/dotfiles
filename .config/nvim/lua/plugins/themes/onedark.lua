-- OneDarkPro theme configuration
return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  opts = {
    options = {
      transparency = true,
    },
    styles = {
      types = "italic",
      comments = "italic",
      keywords = "italic",
      parameters = "italic",
      conditionals = "italic",
      virtual_text = "italic",
    },
    highlights = {
      Pmenu = { bg = "NONE" },
    },
  },
}
