return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = true,
  opts = {
    terminal_colors = false,
    transparent_mode = true,
    overrides = {
      Pmenu = { bg = "NONE" },
      PMenuSel = { link = "Visual" },
      TabLineFill = { bg = "NONE" },

      CursorLine = { bg = "#32302f" },
      CursorLineNr = { bg = "#32302f" },
      Visual = { bg = "#3c3836" },

      NonText = { link = "GruvboxBg4" },

      LspReferenceRead = { link = "CursorLine" },
      LspReferenceText = { link = "CursorLine" },
      LspReferenceWrite = { link = "CursorLine" },
      LspReferenceTarget = { link = "CursorLine" },

      SnacksPickerDirectory = { link = "GruvboxBlue" },
      SnacksPickerGitStatusUntracked = { link = "GruvboxGreen" },

      ["@lsp.type.variable"] = { link = "GruvboxBlue" },
      ["@lsp.type.field"] = { link = "GruvboxBlue" },
      ["@lsp.type.constant"] = { link = "GruvboxYellow" },
      ["@lsp.mod.readonly"] = { link = "GruvboxYellow" },
      ["@lsp.type.namespace"] = { link = "GruvboxYellow" },
    },
  },
}
