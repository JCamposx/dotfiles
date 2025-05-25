-- Snacks customization
return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.picker = opts.picker or {}
    opts.picker.sources = opts.picker.sources or {}

    opts.picker.sources.files = {
      hidden = true,
      ignored = true,
    }

    opts.picker.sources.explorer = {
      layout = { layout = { position = "right" } },
      hidden = true,
      ignored = true,
      auto_close = true,
    }

    return opts
  end,
}
