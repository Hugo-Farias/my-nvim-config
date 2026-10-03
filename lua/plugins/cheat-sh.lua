return {
  "BitsuMamo/cheat-sh-nvim",
  lazy = true,
  keys = {
    {
      "<leader>cs",
      function()
        require("cheat-sh-nvim").cheatSheetCursor()
      end,
      desc = "Cheatsheet: Under Cursor",
    },
    {
      "<leader>cS",
      function()
        require("cheat-sh-nvim").cheatSheetCommand(vim.fn.input("Cheat Sheet> "))
      end,
      desc = "Cheatsheet: Manual Command",
    },
  },
}
