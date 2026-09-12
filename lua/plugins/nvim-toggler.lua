return {
  "nguyenvukhang/nvim-toggler",
  lazy = false,
  opts = {
    {
      -- inverses = {
      --   ["vim"] = "emacs",
      -- },

      -- removes the default <leader>i keymap
      remove_default_keybinds = false,
      -- removes the default set of inverses
      remove_default_inverses = false,
      -- auto-selects the longest match when there are multiple matches
      autoselect_longest_match = true,
    },
  },
}
