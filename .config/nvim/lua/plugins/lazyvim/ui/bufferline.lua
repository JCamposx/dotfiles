-- Bufferline customization
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<D-S-h>", "<CMD>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "<D-S-l>", "<CMD>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },
  opts = {
    options = {
      always_show_bufferline = true,
      show_buffer_close_icons = false,
      right_mouse_command = false,
      middle_mouse_command = function(n)
        Snacks.bufdelete(n)
      end,
    },
  },
}
