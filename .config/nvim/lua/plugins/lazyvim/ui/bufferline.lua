-- Bufferline customization
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<C-S-h>", "<CMD>BufferLineMovePrev<CR>", desc = "Move buffer prev" },
    { "<C-S-l>", "<CMD>BufferLineMoveNext<CR>", desc = "Move buffer next" },
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
