if vim.g.neovide then
  ---- Basic Settings ----
  vim.g.neovide_scale_factor = 0.75
  vim.g.neovide_cursor_animation_length = 0
  -- vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_window_blurred = true
  vim.g.neovide_normal_opacity = 0.9
  vim.g.neovide_show_border = false
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_hide_mouse_when_typing = true

  ---- Scale keybinds ----
  vim.keymap.set({ "n", "v" }, "<M-=>", function()
    vim.cmd("lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05")
    vim.notify(tostring(vim.g.neovide_scale_factor))
  end)
  vim.keymap.set({ "n", "v" }, "<M-->", function()
    vim.cmd("lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05")
    vim.notify(tostring(vim.g.neovide_scale_factor))
  end)
  vim.keymap.set({ "n", "v" }, "<M-0>", "<cmd>lua vim.g.neovide_scale_factor = 0.85<CR>")

  ---- Workaround: Prevents Scrolling when switching buffers ----
  vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
      vim.g.neovide_scroll_animation_length = 0
      -- vim.g.neovide_cursor_animation_length = 0
    end,
  })

  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      vim.fn.timer_start(70, function()
        vim.g.neovide_scroll_animation_length = 0.1
        -- vim.g.neovide_cursor_animation_length = 0.08
      end)
    end,
  })
end
