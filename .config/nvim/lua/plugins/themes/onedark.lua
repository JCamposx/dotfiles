-- OneDark theme configuration
return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    opts = {
      options = {
        transparency = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark_vivid",
    },
  },
}
