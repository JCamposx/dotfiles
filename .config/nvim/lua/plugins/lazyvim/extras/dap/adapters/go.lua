-- Go debugger with go.mod-aware cwd

-- Find all go.mod files under cwd and return their parent directories
local function find_go_roots()
  local mods = vim.fn.glob(vim.fn.getcwd() .. "/**/go.mod", false, true)
  local roots = {}
  for _, mod in ipairs(mods) do
    table.insert(roots, vim.fn.fnamemodify(mod, ":h"))
  end
  return roots
end

-- Show a picker if multiple go.mod found, auto-select if only one
local function pick_go_root(callback)
  local roots = find_go_roots()
  if #roots == 0 then
    callback(vim.fn.getcwd())
  elseif #roots == 1 then
    callback(roots[1])
  else
    vim.ui.select(roots, {
      prompt = "Select Go module:",
      format_item = function(r)
        return vim.fn.fnamemodify(r, ":~:.")
      end,
    }, function(choice)
      callback(choice or vim.fn.getcwd())
    end)
  end
end

return {
  "leoluz/nvim-dap-go",
  lazy = true,
  ft = { "go" },
  config = function(_, opts)
    local dap = require("dap")
    require("dap-go").setup(opts)

    -- Filter out duplicate "Delve:" configs registered by mason-nvim-dap at picker time
    local base_provider = dap.providers.configs["dap.global"]
    dap.providers.configs["dap.global"] = function(bufnr) ---@diagnostic disable-line: duplicate-set-field
      local configs = base_provider(bufnr)
      if vim.bo[bufnr].filetype == "go" then
        return vim.tbl_filter(function(c)
          return not c.name:match("^Delve:")
        end, configs)
      end
      return configs
    end

    -- Override dap.adapters.go to inject the go.mod-aware cwd into the delve executable
    local base_adapter = dap.adapters.go
    dap.adapters.go = function(callback, client_config)
      local co = coroutine.running()
      vim.schedule(function()
        pick_go_root(function(root)
          coroutine.resume(co, root)
        end)
      end)

      local root = coroutine.yield()

      if type(base_adapter) == "function" then
        base_adapter(function(adapter)
          if adapter.executable then
            adapter.executable.cwd = root
          end
          callback(adapter)
        end, client_config)
      else
        callback(base_adapter)
      end
    end

    -- Point Debug configs to the module root, not the current file
    for _, cfg in ipairs(dap.configurations.go or {}) do
      if cfg.request == "launch" and cfg.mode ~= "test" and cfg.program == "${file}" then
        cfg.program = function()
          local fname = vim.api.nvim_buf_get_name(0)
          return vim.fs.root(fname, { "go.work", "go.mod" }) or vim.fn.getcwd()
        end
      end
    end
  end,
}
