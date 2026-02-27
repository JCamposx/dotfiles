-- Bufferline customization
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<A-S-h>", "<CMD>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "<A-S-l>", "<CMD>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    { "<A-c>", "<CMD>:bd<CR>", desc = "Delete buffer" },
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
