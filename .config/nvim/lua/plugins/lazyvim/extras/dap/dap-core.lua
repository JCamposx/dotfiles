-- DAP customization
return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")
    dap.listeners.after.event_initialized["set_exception_breakpoints"] = function()
      dap.set_exception_breakpoints({ "all" })
    end
  end,
}
