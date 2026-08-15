return {
  "nicwest/vim-camelsnek",
  event = "VeryLazy",
  keys = {
    { "crs", "<cmd>Snek<cr>", desc = "To snake_case" },
    { "crS", "<cmd>Screm<cr>", desc = "To Upper SNAKE_CASE" },
    { "crc", "<cmd>CamelB<cr>", desc = "To CamelCase" },
    { "crC", "<cmd>Camel<cr>", desc = "To Upper CamelCase" },
    { "crk", "<cmd>Kebab<cr>", desc = "To kebab-case" },
  },
}
