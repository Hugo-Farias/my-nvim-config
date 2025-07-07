return {
  enable = true,
  -- matcher = {
  --   fuzzy = true, -- use fuzzy matching
  --   ignorecase = true, -- use ignorecase
  --   smartcase = true, -- use smartcase
  --   sort_empty = true, -- sort results when the search string is empty
  --   filename_bonus = true, -- give bonus for matching file names (last part of the path)
  --   file_pos = true, -- support patterns like `file:line:col` and `file:line`
  --   -- the bonusses below, possibly require string concatenation and path normalization,
  --   -- so this can have a performance impact for large lists and increase memory usage
  --   cwd_bonus = false, -- give bonus for matching files in the cwd
  --   frecency = true, -- frecency bonus
  --   history_bonus = false, -- give more weight to chronological order
  -- },
  win = {
    input = {
      keys = {
        ["<Esc>"] = { "close", mode = { "n", "i" } },
      },
      b = {
        minipairs_disable = true,
      },
    },
  },
}
