return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    local mini = require("mini")

    -- Surround text objects like 'vim-surround'
    mini.surround.setup()

    -- Minimal tabline for open buffers
    mini.tabline.setup()

    -- Lightweight statusline
    mini.statusline.setup()

    -- Animate scroll, resize, cursor
    mini.animate.setup()

    -- Show keybinding clues (like which-key)
    mini.clue.setup({
      triggers = {
        -- Recommended trigger patterns
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
      },
    })

    -- Fast jump to character (like enhanced `f`)
    mini.jump.setup()

    -- Discover and browse keymaps
    mini.map.setup()

    -- Extra text operators (sort, replace, evaluate, exchange)
    mini.operators.setup()
  end,
}
