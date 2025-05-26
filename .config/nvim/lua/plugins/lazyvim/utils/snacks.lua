-- Snacks customization
return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.picker = opts.picker or {}
    opts.picker.sources = opts.picker.sources or {}

    opts.picker.sources.files = {
      hidden = true,
      ignored = true,
      exclude = { ".git", "node_modules" },
    }

    opts.picker.sources.explorer = {
      layout = { layout = { position = "right" } },
      hidden = true,
      ignored = true,
      auto_close = true,
    }

    return opts
  end,
  keys = {
    -- stylua: ignore
    { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
    -- stylua: ignore
    { "<leader><space>", function() Snacks.picker.files({ cwd = vim.fn.getcwd() }) end, desc = "Find Files" },
    -- stylua: ignore
    { "<leader>/", function() Snacks.picker.grep({ cwd = vim.fn.getcwd() }) end, desc = "Grep" },
  },
}
