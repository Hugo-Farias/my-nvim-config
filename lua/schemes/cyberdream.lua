---@class CyberdreamColors
---@field blue string
---@field cyan string
---@field green string
---@field grey string
---@field magenta string
---@field orange string
---@field pink string
---@field purple string
---@field red string
---@field yellow string
---@field white string

return {
  "scottmckendry/cyberdream.nvim",
  lazy = true,
  priority = 1000,
  opts = {
    transparent = true,
    -- saturation = 0.9,
    styles = {
      transparency = true,
      sidebars = "transparent",
      floats = "transparent",
      keywords = { italic = true },
      -- functions = { italic = true },
    },
    -- Alternatively, you can use 'default' to set all extensions at once
    -- cache = true, -- Use cache for fastest loads
    -- extensions = {
    --     default = false, -- Disable all by default
    --     base = true, -- Enable all built-in hl groups (you probably want this)
    --
    --     -- Now enable only what you want to use
    --     telescope = true,
    --     cmp = true,
    --     gitsigns = true,
    -- },
    colors = {
      -- For a list of colors see `lua/cyberdream/colours.lua`
      -- white = "#f1f1f1",
      white = "#c8d3f5",
      magenta = "#c099ff",
      -- green = "#c3e88d",
      green = "#a1e09c", -- Default: #7ee088
      -- white2 = "#c8d3f5",
      pink = "#e878a8",
    },
    on_colors = function(hl)
      hl.bg_statusline = hl.none
    end,
    overrides = function(colors)
      local hl = colors ---@type CyberdreamColors
      return {
        ["Normal"] = { fg = hl.white },
        ["@variable"] = { fg = hl.white },
        ["@comment"] = { fg = hl.grey, italic = true },
        -- ["@string"] = { fg = hl.green, italic = true },
        ["String"] = { fg = hl.green, italic = true },
        ["Identifier"] = { fg = hl.orange },
        -- ["Statement"] = { fg = hl.pink },
        ["@property"] = { fg = hl.cyan },
        ["Keyword"] = { fg = hl.cyan, italic = true },
        ["Function"] = { fg = hl.blue },
        ["Boolean"] = { fg = hl.orange },
        ["@operator"] = { fg = hl.white },
        ["Operator"] = { fg = hl.white },
        ["@variable.parameter"] = { fg = hl.orange },
        ["@variable.builtin"] = { fg = hl.red },
        -- ["Special"] = { fg = "#199fa2" },
        ["Special"] = { fg = hl.cyan },
        ["Search"] = { fg = hl.white, bg = "#3e68d7" },
        ["CurSearch"] = { fg = "#1b1d2b", bg = "#ff966c" },
        ["Visual"] = { bg = "#2d3f76" },
        ["Type"] = { fg = hl.blue, italic = true },
      }
    end,
    extensions = {
      snacks = false,
    },
  },
}
