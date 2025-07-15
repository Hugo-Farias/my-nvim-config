return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    -- Add or skip cursor above/below the main cursor.
    set({ "n", "x" }, "<C-up>", function()
      mc.lineAddCursor(-1)
    end, { desc = "Multi-cursor: Add cursor on line above" })

    set({ "n", "x" }, "<C-down>", function()
      mc.lineAddCursor(1)
    end, { desc = "Multi-cursor: Add cursor on line below" })

    set({ "n", "x" }, "<C-n>k", function()
      mc.lineSkipCursor(-1)
    end, { desc = "Multi-cursor: Skip line above when adding cursor" })

    set({ "n", "x" }, "<C-n>j", function()
      mc.lineSkipCursor(1)
    end, { desc = "Multi-cursor: Skip line below when adding cursor" })

    -- Add or skip adding a new cursor by matching word/selection
    set({ "n", "x" }, "<C-n><C-n>", function()
      mc.matchAddCursor(1)
    end, { desc = "Multi-cursor: Add next match as new cursor" })

    set({ "n", "x" }, "<C-n>s", function()
      mc.matchSkipCursor(1)
    end, { desc = "Multi-cursor: Skip next match" })

    set({ "n", "x" }, "<C-n>N", function()
      mc.matchAddCursor(-1)
    end, { desc = "Multi-cursor: Add previous match as new cursor" })

    set({ "n", "x" }, "<C-n>S", function()
      mc.matchSkipCursor(-1)
    end, { desc = "Multi-cursor: Skip previous match" })

    -- Add and remove cursors with control + left click.
    set("n", "<c-leftmouse>", mc.handleMouse)
    set("n", "<c-leftdrag>", mc.handleMouseDrag)
    set("n", "<c-leftrelease>", mc.handleMouseRelease)

    -- Disable and enable cursors.
    set({ "n", "x" }, "<C-n>t", mc.toggleCursor, { desc = "Multi-cursor: Toggle cursors" })

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet({ "n", "x" }, "<left>", mc.prevCursor, { desc = "Multi-cursor: Previous cursor" })
      layerSet({ "n", "x" }, "<right>", mc.nextCursor, { desc = "Multi-cursor: Next cursor" })

      -- Delete the main cursor.
      layerSet({ "n", "x" }, "<C-n>x", mc.deleteCursor, { desc = "Multi-cursor: Delete main cursor" })

      -- Enable and clear cursors using escape.
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
