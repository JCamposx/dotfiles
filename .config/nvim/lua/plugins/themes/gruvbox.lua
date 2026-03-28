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
      LspReferenceRead = { link = "Visual" },
      LspReferenceText = { link = "Visual" },
      LspReferenceWrite = { link = "Visual" },
      LspReferenceTarget = { link = "Visual" },
      SnacksPickerGitStatusUntracked = { link = "Added" },
      ["@lsp.type.variable"] = { link = "GruvboxBlue" },
      ["@lsp.type.fieldName"] = { link = "GruvboxBlue" },
      ["@lsp.typemod.variable.readonly"] = { link = "GruvboxYellow" },
      ["@lsp.type.constantName"] = { link = "GruvboxYellow" },
      ["@lsp.type.namespace"] = { link = "GruvboxYellow" },
    },
  },
}
