-- Patch golangcilint cwd to the nearest go.mod/go.work dir
return {
  "mfussenegger/nvim-lint",
  init = function()
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
            -- Run from the module root so golangci-lint resolves imports correctly
            if k == "cwd" then
              local fname = vim.api.nvim_buf_get_name(0)
              return vim.fs.root(fname, { "go.work", "go.mod" }) or vim.fn.getcwd()
            end
            -- Override the trailing path arg with a module-relative package path
            if k == "args" then
              local base_args = base.args
              if not base_args then
                return base_args
              end
              local new_args = {}
              for i = 1, #base_args - 1 do
                new_args[i] = base_args[i]
              end
              new_args[#new_args + 1] = function()
                local fname = vim.api.nvim_buf_get_name(0)
                local root = vim.fs.root(fname, { "go.work", "go.mod" })
                if not root then
                  return vim.fn.fnamemodify(fname, ":h")
                end
                local rel = vim.fn.fnamemodify(fname, ":h"):sub(#root + 2)
                return rel == "" and "./..." or "./" .. rel .. "/..."
              end
              return new_args
            end
            return base[k]
          end,
        })
      end,
    })
  end,
}
