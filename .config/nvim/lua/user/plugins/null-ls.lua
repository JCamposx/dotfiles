local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
  formatting.autopep8,
  formatting.stylua,
  formatting.fish_indent,
  formatting.prettier.with({
    command = "prettier",
    args = { "$FILENAME", "--no-semi=false", "--bracket-same-line=true" },
  }),
  formatting.phpcsfixer.with({
    args = { "-q", "--stdin-path=$FILENAME", "--using-cache=false", "-" },
  }),
  formatting.blade_formatter.with({
    args = { "--write", "$FILENAME", "--indent-size=2", "--wrap=80" },
  }),
}

null_ls.setup({
  sources = sources,
})
