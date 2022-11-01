-- Keymaps

-- Bidirectional search in all tabs
vim.keymap.set("n", "s", function()
  require("leap").leap({
    target_windows = vim.tbl_filter(function(win)
      return vim.api.nvim_win_get_config(win).focusable
    end, vim.api.nvim_tabpage_list_wins(0)),
  })
end)
