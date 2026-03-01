-- Lint customization
return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      markdown = false,
    },
  },
  init = function()
    -- Patch golangcilint cwd to the nearest go.mod/go.work dir
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(ev)
        if ev.data ~= "nvim-lint" then
          return
        end
        local lint = require("lint")
        local base = lint.linters["golangcilint"]
        if type(base) ~= "table" then
          return
        end
        lint.linters["golangcilint"] = setmetatable({}, {
          __index = function(_, k)
            if k == "cwd" then
              local fname = vim.api.nvim_buf_get_name(0)
              return vim.fs.root(fname, { "go.work", "go.mod" }) or vim.fn.getcwd()
            end
            return base[k]
          end,
        })
      end,
    })
  end,
}
