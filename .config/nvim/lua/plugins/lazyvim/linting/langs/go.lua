-- Patch golangcilint cwd to the nearest go.mod/go.work dir
return {
  "mfussenegger/nvim-lint",
  config = function()
    -- Redefine as a function so cwd is resolved per-buffer at lint time.
    local original = require("lint.linters.golangcilint")
    require("lint").linters.golangcilint = function()
      local linter = vim.tbl_extend("force", {}, original)
      local fname = vim.api.nvim_buf_get_name(0)
      linter.cwd = vim.fs.root(fname, { "go.work", "go.mod" }) or vim.fn.getcwd()
      return linter
    end
  end,
}
