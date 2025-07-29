---@class snacks.indent.Config
return {
  enabled = true,
  priority = 1,
  char = "│",
  only_scope = true, -- only show indent guides of the scope
  only_current = true, -- only show indent guides in the current window
  hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
  -- can be a list of hl groups to cycle through
  -- hl = {
  --   "SnacksIndent1",
  --   "SnacksIndent2",
  --   "SnacksIndent3",
  --   "SnacksIndent4",
  --   "SnacksIndent5",
  --   "SnacksIndent6",
  --   "SnacksIndent7",
  --   "SnacksIndent8",
  -- },
  -- animate scopes. Enabled by default for Neovim >= 0.10
  -- Works on older versions but has to trigger redraws during animation.
  -- -@class snacks.indent.animate: snacks.animate.Config
  -- -@field enabled? boolean
  --- * out: animate outwards from the cursor
  --- * up: animate upwards from the cursor
  --- * down: animate downwards from the cursor
  --- * up_down: animate up or down based on the cursor position
  animate = {
    enabled = false,
    style = "out",
    easing = "linear",
    duration = {
      step = 20, -- ms per step
      total = 500, -- maximum duration
    },
  },
  scope = {
    enabled = true, -- enable highlighting the current scope
    priority = 200,
    char = "│",
    underline = false, -- underline the start of the scope
    only_current = true, -- only show scope in the current window
    hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
  },
  chunk = {
    enabled = false,
    -- only show chunk scopes in the current window
    only_current = true,
    priority = 200,
    hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
    char = {
      corner_top = "┌",
      corner_bottom = "└",
      -- corner_top = "╭",
      -- corner_bottom = "╰",
      horizontal = "─",
      vertical = "│",
      arrow = ">",
    },
  },
}
