-- Conform customization
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      cs = {}, -- Use LSP formatter
    },
    formatters = {
      prettier = {
        prepend_args = { "--ignore-path", "/dev/null" }, -- Allow formatting ignored files
      },
    },
  },
}
