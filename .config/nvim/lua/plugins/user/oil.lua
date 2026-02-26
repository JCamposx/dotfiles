-- Oil customization
return {
  "stevearc/oil.nvim",
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  event = "VeryLazy",
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open current directory" },
  },
  opts = {
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    watch_for_changes = true,
    view_options = {
      show_hidden = true,
    },
    win_options = {
      wrap = true,
    },
  },
}
