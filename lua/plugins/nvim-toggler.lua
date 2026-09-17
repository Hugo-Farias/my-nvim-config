return {
  "nguyenvukhang/nvim-toggler",
  opts = {
    -- inverses = {
    --   ["vim"] = "emacs",
    -- },

    -- removes the default <leader>i keymap
    remove_default_keybinds = true,
    -- removes the default set of inverses
    remove_default_inverses = false,
    -- auto-selects the longest match when there are multiple matches
    autoselect_longest_match = false,
  },
  keys = {
    {
      "<leader>i",
      function()
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        local line = vim.api.nvim_get_current_line()

        local pos = vim.fn.match(line, [[\<\(true\|false\|on\|off\)\>]], col)

        if pos >= 0 then
          vim.api.nvim_win_set_cursor(0, { row, pos })
        end

        require("nvim-toggler").toggle()
      end,
      desc = "Flip boolean value",
    },
  },
}
