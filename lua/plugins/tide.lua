return {
  "jackMort/tide.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    keys = {
      leader = "q", -- Leader key to prefix all Tide commands
      panel = "t", -- Open the panel (uses leader key as prefix)
      add_item = "A", -- Add a new item to the list (leader + 'a')
      delete = "D", -- Remove an item from the list (leader + 'd')
      clear_all = "X", -- Clear all items (leader + 'x')
      horizontal = "-", -- Split window horizontally (leader + '-')
      vertical = "|", -- Split window vertically (leader + '|')
    },
    animation_duration = 0, -- Animation duration in milliseconds
    animation_fps = 0, -- Frames per second for animations
    hints = {
      dictionary = "hjkl;yuiop", -- Key hints for quick access
    },
  },
}
