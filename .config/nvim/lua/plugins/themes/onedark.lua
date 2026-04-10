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
      Pmenu = { link = "NormalFloat" },
      Cursor = { bg = "#abb2bf", fg = "#282c34" },
      TermCursor = { link = "Cursor" },
      SnacksPickerGitStatusUntracked = { link = "Added" },

      ["@lsp.typemod.variable.readonly"] = { fg = "#e5c07b" },
      ["@lsp.typemod.method.defaultLibrary"] = { fg = "#61afef" },
      ["@tag.builtin"] = { fg = "#ef596f" },
      ["@tag.attribute"] = { fg = "#d19a66" },
      ["@tag.tsx"] = { fg = "#e5c07b" },
    },
  },
}
