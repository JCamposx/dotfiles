-- Bufferline customization

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<C-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<C-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<C-S-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "<C-S-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    { "<A-c>", "<cmd>:bd<CR>", desc = "Delete buffer" },
  },
  opts = {
    options = {
      always_show_bufferline = true,
      middle_mouse_command = function(n)
        Snacks.bufdelete(n)
      end,
    },
  },
}
