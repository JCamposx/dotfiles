-- Kanagawa theme configuration
return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  opts = {
    transparent = true,
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "NONE",
          },
        },
      },
    },
    overrides = function()
      return {
        NormalFloat = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },
        FloatTitle = { bg = "NONE" },
        Pmenu = { bg = "NONE" },
        TabLineFill = { bg = "NONE" },
        BlinkCmpMenuBorder = { link = "FloatBorder" },
        WinSeparator = { link = "FloatBorder" },
        CursorLineNr = { fg = "#957fb8" },
      }
    end,
  },
}
