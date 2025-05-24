-- Set cursor | when leaving
vim.api.nvim_create_augroup("VimOptions", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
  group = "VimOptions",
  command = "set guicursor=a:ver15",
})

-- Disable autoformat
vim.api.nvim_create_autocmd("filetype", {
  pattern = "*",
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Enable autoformat for lua files
vim.api.nvim_create_autocmd("filetype", {
  pattern = "lua",
  callback = function()
    vim.b.autoformat = true
  end,
})

-- Save folds when closing buffers
vim.api.nvim_create_augroup("RememberFolds", { clear = true })
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = "RememberFolds",
  pattern = "*.*",
  command = "silent mkview",
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "RememberFolds",
  pattern = "*.*",
  callback = function()
    if vim.bo.buftype == "" then
      vim.defer_fn(function()
        vim.cmd("silent! loadview")
      end, 1)
    end
  end,
})
