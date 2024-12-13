return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show()
      end,
      desc = "Global Keymaps (which-key)",
    },
  },
}
