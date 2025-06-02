return {
  "chrisgrieser/nvim-rip-substitute",
  cmd = "RipSubstitute",
  -- stylua: ignore
  keys = {
    { "<leader>fs", function() require("rip-substitute").sub() end, mode = { "n", "x" }, desc = "Rip Substitute" },
  },
}
