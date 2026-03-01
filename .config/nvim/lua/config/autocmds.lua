-- Set cursor | when leaving
vim.api.nvim_create_augroup("VimOptions", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
  group = "VimOptions",
  command = "set guicursor=a:ver15",
})

-- Disable autoformat
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    local excluded = { "lua", "go" }
    local ft = vim.bo.filetype
    if not vim.tbl_contains(excluded, ft) then
      vim.b.autoformat = false
    end
  end,
})

-- Set tab width for C# files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Break on all exceptions in DAP
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  once = true,
  callback = function()
    local ok, dap = pcall(require, "dap")
    if not ok then
      return
    end
    dap.defaults.fallback.exception_breakpoints = { "all" }
  end,
})
