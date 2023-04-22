vim.cmd([[packadd packer.nvim]])

local packer = require("packer")

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
  use({ "wbthomason/packer.nvim" })

  use({ "lewis6991/impatient.nvim" })

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.x",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use({ "rcarriga/nvim-notify" })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
  })

  use({ "akinsho/toggleterm.nvim" })

  use({
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  })

  use({ "jose-elias-alvarez/null-ls.nvim" })

  use({
    "L3MON4D3/LuaSnip",
    requires = { "rafamadriz/friendly-snippets" },
  })

  use({ "SmiteshP/nvim-navic" })

  use({ "RRethy/vim-illuminate" })

  use({ "danymat/neogen" })

  use({ "lewis6991/gitsigns.nvim" })

  use({ "tpope/vim-fugitive" })

  use({ "tpope/vim-surround" })

  use({ "tpope/vim-commentary" })

  use({ "alvan/vim-closetag" })

  use({ "jwalton512/vim-blade" })

  use({ "windwp/nvim-ts-autotag" })

  use({ "mattn/emmet-vim" })

  use({ "ntpeters/vim-better-whitespace" })

  use({ "lukas-reineke/indent-blankline.nvim" })

  use({ "windwp/nvim-autopairs" })

  use({
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  use({
    "mg979/vim-visual-multi",
    branch = "master",
  })

  use({ "ggandor/leap.nvim" })

  use({ "olimorris/onedarkpro.nvim" })

  use({ "NvChad/nvim-colorizer.lua" })

  use({
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  use({
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true,
    },
  })
end)
