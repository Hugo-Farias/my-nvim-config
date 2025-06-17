if vim.g.neovide then
  ---- Basic Settings ----
  -- vim.o.guifont = "CaskaydiaCove Nerd Font:h11"
  vim.o.guifont = "CaskaydiaCove Nerd Font:h12:#e-antialias:#h-none"
  -- vim.g.neovide_scale_factor = 0.7
  vim.g.neovide_cursor_animation_length = 0
  -- vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_window_blurred = true
  vim.g.neovide_normal_opacity = 0.7
  vim.g.neovide_show_border = false

  ---- Prevents Scrolling when switching buffers ----
  vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
      vim.g.neovide_scroll_animation_length = 0
      -- vim.g.neovide_cursor_animation_length = 0
    end,
  })
  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      vim.fn.timer_start(70, function()
        vim.g.neovide_scroll_animation_length = 0.3
        -- vim.g.neovide_cursor_animation_length = 0.08
      end)
    end,
  })

end
