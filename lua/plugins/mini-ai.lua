return {
  "echasnovski/mini.ai",
  version = "*",
  opts = {
    --   custom_textobjects = {
    --     az = function()
    --       return { vim.fn.line("1"), 1, vim.fn.line("$"), 0 }
    --       -- returns {start_line, start_col, end_line, end_col}
    --       -- full buffer from line 1 col 1 to last line col 0 (end)
    --     end,
    --   },
  },
}
