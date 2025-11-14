for _, m in ipairs(vim.api.nvim_get_keymap("n")) do
  if m.lhs == "gcc" or m.lhs == "gc" then
    print(vim.inspect(m))
  end
end
