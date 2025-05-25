require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all"
  ensure_installed = {
    "php",
    "lua",
    "html",
    "css",
    "markdown",
    "python",
    "javascript",
    "typescript",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = true,
  },

  autotag = {
    enable = true,
    filetypes = {
      'html',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'svelte',
      'vue',
      'tsx',
      'jsx',
      'rescript',
      'xml',
      'php',
      'markdown',
      'astro',
      'glimmer',
      'handlebars',
      'hbs',
    }
  }
})
