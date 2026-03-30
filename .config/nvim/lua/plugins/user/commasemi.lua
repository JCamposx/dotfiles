-- Commas and semicolons automatically inserted
return {
  "saifulapm/commasemi.nvim",
  event = "VeryLazy",
  keys = {
    { "<C-,>", "<CMD>CommaToggle<CR>", desc = "Toggle comma", mode = { "n", "i" } },
    { "<C-,>", ":CommaToggle<CR>gv", desc = "Toggle comma", mode = "x" },
    { "<C-;>", "<CMD>SemiToggle<CR>", desc = "Toggle semicolon", mode = { "n", "i" } },
    { "<C-;>", ":SemiToggle<CR>gv", desc = "Toggle comma in visual mode", mode = { "x" } },
  },
  opts = {
    keymaps = false,
    commands = true,
  },
}
