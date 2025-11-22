-- No need to copy this inside `setup()`. Will be used automatically.
return {
  "echasnovski/mini.splitjoin",
  version = "*",
  lazy = false,
  opts = {
    -- Module mappings. Use `''` (empty string) to disable one.
    -- Created for both Normal and Visual modes.
    mappings = {
      toggle = "gS",
      split = "",
      join = "",
    },

    -- Detection options: where split/join should be done
    detect = {
      -- Array of Lua patterns to detect region with arguments.
      -- Default: { '%b()', '%b[]', '%b{}' }
      brackets = nil,

      -- String Lua pattern defining argument separator
      separator = ",",

      -- Array of Lua patterns for sub-regions to exclude separators from.
      -- Enables correct detection in presence of nested brackets and quotes.
      -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
      exclude_regions = nil,
    },

    -- Split options
    split = {
      hooks_pre = {},
      hooks_post = {},
    },

    -- Join options
    join = {
      hooks_pre = {},
      hooks_post = {},
    },
  },
  -- keys = {
  --   {
  --     "<C-k>",
  --     function()
  --       local sj = require("mini.splitjoin")
  --       local ok, res = pcall(sj.split)
  --       if not ok or res == nil then
  --         vim.cmd("normal! i<CR><Esc>")
  --       end
  --     end,
  --     desc = "Split (mini.splitjoin or fallback)",
  --   },
  --   {
  --     "L",
  --     function()
  --       local sj = require("mini.splitjoin")
  --       local ok, res = pcall(sj.join)
  --       if not ok or res == nil then
  --         vim.cmd("normal! J")
  --       end
  --     end,
  --     desc = "Join (mini.splitjoin or fallback)",
  --   },
  -- },
}
