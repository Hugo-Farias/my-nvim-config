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
---@field black string
---@field darkgrey string
---@field darkteal string
---@field teal string

return {
  "scottmckendry/cyberdream.nvim",
  lazy = true,
  priority = 1000,
  opts = {
    transparent = true,
    -- saturation = 0.7,
    styles = {
      transparency = true,
      -- sidebars = "transparent",
      -- floats = "transparent",
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
      -- white = "#f1f1f1",
      white = "#c8d3f5",
      pink = "#c099ff",
      -- green = "#c3e88d",
      green = "#a1e09c", -- Default: #7ee088
      -- magenta = "#e878a8",
      darkgrey = "#333333",
      black = "#000000",
      darkteal = "#26484d",
      teal = "#4fd6be",
      -- teal = "#19ffc8",
      cyan = "#86e1fc",
    },
    -- on_colors = function(hl)
    --   hl.bg_statusline = hl.none
    -- end,
    overrides = function(colors)
      local hl = colors ---@type CyberdreamColors
      return {
        ["Normal"] = { fg = hl.white },
        ["@variable"] = { fg = hl.white, italic = true },
        ["@comment"] = { fg = hl.grey },
        ["Comment"] = { fg = hl.grey },
        -- ["@string"] = { fg = hl.green, italic = true },
        ["String"] = { fg = hl.green },
        ["Identifier"] = { fg = hl.orange },
        ["Statement"] = { fg = hl.pink, italic = true },
        ["@property"] = { fg = hl.cyan },
        ["@module"] = { fg = hl.teal, italic = true },
        ["Keyword"] = { fg = hl.teal, italic = true },
        ["Function"] = { fg = hl.blue },
        ["Boolean"] = { fg = hl.orange },
        ["@operator"] = { fg = hl.white },
        ["Operator"] = { fg = hl.white },
        ["@variable.parameter"] = { fg = hl.orange },
        ["@variable.builtin"] = { fg = hl.red, italic = true },
        ["Special"] = { fg = hl.cyan },
        ["Type"] = { fg = hl.blue, italic = true },
        ["LspSignatureActiveParameter"] = { bg = hl.darkgrey },
        ["Search"] = { fg = hl.black, bg = hl.cyan },
        ["CurSearch"] = { fg = hl.black, bg = hl.orange },
        -- ["Visual"] = { bg = "#2d3f76" },
        ["Visual"] = { bg = hl.darkteal },
        ["SnacksPickerDir"] = { fg = hl.grey },
        ["SnacksPickerFile"] = { fg = hl.white },
        ["FloatBorder"] = { fg = hl.white },
      }
    end,
    -- extensions = {
    --   snacks = false,
    -- },
  },
}
