-- Snacks customization
return {
  "folke/snacks.nvim",
  -- stylua: ignore
  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
    { "<leader><space>", function() Snacks.picker.files({ cwd = vim.fn.getcwd() }) end, desc = "Find Files" },
    { "<leader>/", function() Snacks.picker.grep({ cwd = vim.fn.getcwd() }) end, desc = "Grep" },
    { "<C-/>", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal" },
    { "<C-\\>", function() Snacks.terminal.open(nil, { win = { position = "float", border = "rounded"} }) end, desc = "Open New Terminal" },
  },
  opts = {
    dashboard = {
      preset = {
        header = [[
                               __                
  ___     ___    ___   __  __ /\_\    ___ ___    
 / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  
/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
 \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        keys = {
          { icon = " ", key = "f", action = ":lua LazyVim.pick()()", desc = " Find File" },
          { icon = " ", key = "n", action = ":ene | startinsert", desc = " New File" },
          { icon = " ", key = "s", action = ':lua require("persistence").load()', desc = " Restore Session" },
          { icon = " ", key = "x", action = ":LazyExtras", desc = " Lazy Extras" },
          { icon = "󰒲 ", key = "l", action = ":Lazy", desc = " Lazy" },
          { icon = " ", key = "q", action = ":qa", desc = " Quit" },
        },
      },
    },
    picker = {
      sources = {
        files = {
          hidden = true,
          ignored = true,
          exclude = { ".git", "node_modules", ".angular", "dist" },
        },
        explorer = {
          replace_netrw = true,
          layout = { layout = { position = "right" } },
          hidden = true,
          ignored = true,
          auto_close = true,
        },
      },
    },
  },
}
