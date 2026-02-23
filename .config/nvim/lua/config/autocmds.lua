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
