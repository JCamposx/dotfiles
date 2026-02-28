-- Git diff viewer
return {
  "sindrets/diffview.nvim",
  lazy = true,
  opts = {
    view = {
      merge_tool = {
        layout = "diff3_mixed",
      },
    },
    file_panel = {
      listing_style = "list",
      win_config = {
        position = "right",
      },
    },
  },
}
