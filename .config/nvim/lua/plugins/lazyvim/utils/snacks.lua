-- Snacks customization
return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.picker = opts.picker or {}
    opts.picker.sources = opts.picker.sources or {}

    opts.picker.sources.files = {
      hidden = true,
      ignored = true,
      exclude = { ".git", "node_modules", ".angular" },
    }

    opts.picker.sources.explorer = {
      layout = { layout = { position = "right" } },
      hidden = true,
      ignored = true,
      auto_close = true,
    }

    return opts
  end,
  -- stylua: ignore
  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
    { "<leader><space>", function() Snacks.picker.files({ cwd = vim.fn.getcwd() }) end, desc = "Find Files" },
    { "<leader>/", function() Snacks.picker.grep({ cwd = vim.fn.getcwd() }) end, desc = "Grep" },
    { "<C-/>", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal" },
    { "<C-\\>", function() Snacks.terminal.open(nil, { win = { position = "float", border = "rounded"} }) end, desc = "Open New Terminal" },
  },
}
