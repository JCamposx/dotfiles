return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = true,
  opts = {
    terminal_colors = false,
    transparent_mode = true,
    overrides = {
      Pmenu = { bg = "NONE" },
      TabLineFill = { bg = "NONE" },

      CursorLine = { bg = "#32302f" },
      CursorLineNr = { bg = "#32302f" },

      NonText = { link = "GruvboxBg4" },

      LspReferenceRead = { link = "CursorLine" },
      LspReferenceText = { link = "CursorLine" },
      LspReferenceWrite = { link = "CursorLine" },
      LspReferenceTarget = { link = "CursorLine" },

      SnacksPickerDirectory = { link = "GruvboxBlue" },
      SnacksPickerGitStatusUntracked = { link = "GruvboxGreen" },

      ["@lsp.type.variable"] = { link = "GruvboxBlue" },
      ["@lsp.type.fieldName"] = { link = "GruvboxBlue" },
      ["@lsp.typemod.variable.readonly"] = { link = "GruvboxYellow" },
      ["@lsp.type.constantName"] = { link = "GruvboxYellow" },
      ["@lsp.type.namespace"] = { link = "GruvboxYellow" },
    },
  },
}
