-- Commas and semicolons automatically inserted
return {
  "saifulapm/commasemi.nvim",
  event = "VeryLazy",
  keys = {
    { "<A-,>", "<CMD>CommaToggle<CR>", desc = "Toggle comma", mode = { "n", "i" } },
    { "<A-,>", ":CommaToggle<CR>gv", desc = "Toggle comma", mode = "x" },
    { "<A-;>", "<CMD>SemiToggle<CR>", desc = "Toggle semicolon", mode = { "n", "i" } },
    { "<A-;>", ":SemiToggle<CR>gv", desc = "Toggle comma in visual mode", mode = { "x" } },
  },
  opts = {
    keymaps = false,
    commands = true,
  },
}
