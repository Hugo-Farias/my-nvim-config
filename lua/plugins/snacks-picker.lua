return {
  enable = true,
  win = {
    input = {
      keys = {
        ["<Esc>"] = { "close", mode = { "n", "i" } },
      },
      b = {
        minipairs_disable = true,
      },
    },
  },
  projects = {
    finder = "recent_projects",
    format = "file",
    dev = { "~/dev", "~/projects" },
    confirm = "load_session",
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "package.json", "Makefile" },
    recent = true,
    matcher = {
      frecency = true, -- use frecency boosting
      sort_empty = true, -- sort even when the filter is empty
      cwd_bonus = false,
    },
  },
}
