require("onedarkpro").setup({
  theme = "onedark_vivid", -- The default theme
  caching = false, -- Use caching for the theme?
  cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro/"), -- The path to the cache directory
  colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
  highlights = {
    statusLine = { bg = "NONE", fg = "NONE" }
  }, -- Override default highlight and/or filetype groups
  filetypes = { -- Override which filetype highlight groups are loaded
    javascript = true,
    lua = true,
    markdown = true,
    php = true,
    python = true,
    ruby = true,
    rust = true,
    toml = true,
    yaml = true,
  },
  plugins = { -- Override which plugin highlight groups are loaded
    -- See the Supported Plugins section for a list of available plugins
  },
  styles = { -- Choose from "bold,italic,underline"
    types = "NONE", -- Style that is applied to types
    numbers = "NONE", -- Style that is applied to numbers
    strings = "NONE", -- Style that is applied to strings
    comments = "italic", -- Style that is applied to comments
    keywords = "NONE", -- Style that is applied to keywords
    constants = "NONE", -- Style that is applied to constants
    functions = "NONE", -- Style that is applied to functions
    operators = "NONE", -- Style that is applied to operators
    variables = "NONE", -- Style that is applied to variables
    conditionals = "NONE", -- Style that is applied to conditionals
    virtual_text = "italic", -- Style that is applied to virtual text
  },
  options = {
    bold = false, -- Use bold styles?
    italic = false, -- Use italic styles?
    underline = true, -- Use underline styles?
    undercurl = true, -- Use undercurl styles?

    cursorline = true, -- Use cursorline highlighting?
    transparency = true, -- Use a transparent background?
    terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
    highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
  }
})

vim.cmd("colorscheme onedark_vivid")

vim.cmd("highlight NvimTreeOpenedFolderName guifg=#61afef")
