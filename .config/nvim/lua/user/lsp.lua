-- Servers to ensure installation
local servers = {
  "bashls",
  "cssls",
  "emmet_ls",
  "html",
  "intelephense",
  "jsonls",
  "marksman",
  "pyright",
  "lua_ls",
  "sqlls",
  "ts_ls",
  "vimls",
}

local navic = require("nvim-navic")

vim.g.code_action_menu_show_diff = false

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

-- Mappings
local opts = { noremap = true, silent = true, nowait = true }
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys after the language
-- serverserver attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Navic support
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings
  local bufopts = { noremap = true, silent = true, nowait = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<Leader>k", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<Leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<Leader>ca", ':CodeActionMenu<CR>', bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<Leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- Border support
require("lspconfig.ui.windows").default_options.border = border

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Number line diagnostic setup
local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type

  -- Number line icons
  -- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })

  -- Number line icons disabled
  vim.fn.sign_define(hl, { text = "", texthl = "", numhl = hl })
end

-- Diagnostic icons setup
vim.diagnostic.config({
  underline = true,
  update_in_insert = true,

  -- Virtual text
  virtual_text = {
    prefix = "●",
    spacing = 0,
  },
  severity_sort = true,
  float = {
    source = "always",
  },
})

-- Servers setup
local lspconfig = require("lspconfig")

for _, server in pairs(servers) do
  if server == "intelephense" then
    lspconfig[server].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      init_options = {
        globalStoragePath = os.getenv("HOME") .. "/.local/share/intelephense",
      },
    })
  elseif server == "emmet_ls" then
    lspconfig[server].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      filetypes = {
        "html",
        "css",
        "sass",
        "scss",
        "less",
        "blade",
      },
    })
  else
    lspconfig[server].setup({
      on_attach = on_attach,
      flags = lsp_flags,
    })
  end
end

-- Navic setup
navic.setup({
  icons = {
    File          = "󰈙 ",
    Module        = " ",
    Namespace     = "󰌗 ",
    Package       = " ",
    Class         = "󰌗 ",
    Method        = "󰆧 ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "󰕘",
    Interface     = "󰕘",
    Function      = "󰊕 ",
    Variable      = "󰆧 ",
    Constant      = "󰏿 ",
    String        = "󰀬 ",
    Number        = "󰎠 ",
    Boolean       = "◩ ",
    Array         = "󰅪 ",
    Object        = "󰅩 ",
    Key           = "󰌋 ",
    Null          = "󰟢 ",
    EnumMember    = " ",
    Struct        = "󰌗 ",
    Event         = " ",
    Operator      = "󰆕 ",
    TypeParameter = "󰊄 ",
  },
  highlight = true,
  separator = "  ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true,
})

lspconfig.clangd.setup({
  on_attach = on_attach,
})

-- Setup navic on top
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
