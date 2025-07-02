-- Change location to git root if found, otherwise to file's location
function SmartChangeDir()
  local file = vim.api.nvim_buf_get_name(0)
  if vim.fn.filereadable(file) ~= 1 then
    return
  end

  local dir = vim.fn.fnamemodify(file, ":h")
  local git_root = nil

  while dir ~= "" and dir ~= "/" do
    if vim.fn.isdirectory(dir .. "/.git") == 1 then
      git_root = dir
      break
    end

    -- Go one level up
    local parent = vim.fn.fnamemodify(dir, ":h")
    if parent == dir then
      break
    end
    dir = parent
  end

  if git_root then
    vim.cmd.lcd(git_root)
  else
    -- fallback to file's directory
    vim.cmd.lcd(vim.fn.fnamemodify(file, ":h"))
  end
  vim.cmd("pwd")
end

-- Save session in the git root directory with a name based on the current working directory
-- if no files are associated with the buffers, delete the session file
function SmartSaveSession()
  if not IsProject then
    return
  end

  vim.notify("Saving session...", vim.log.levels.INFO, { title = "Session" })

  local cwd = vim.fn.getcwd()
  local git_dir = cwd .. "/.git"

  ---@diagnostic disable-next-line: undefined-field
  if not vim.loop.fs_stat(git_dir) then
    return
  end

  local session_path = SessionName(cwd)

  -- Check for listed buffers that are associated with a real file on disk
  local has_real_files = false
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if
      vim.api.nvim_buf_is_loaded(buf)
      and vim.api.nvim_buf_get_name(buf) ~= ""
      and vim.loop.fs_stat(vim.api.nvim_buf_get_name(buf))
    then
      has_real_files = true
      break
    end
  end

  -- vim.notify("Has real files: " .. tostring(has_real_files), vim.log.levels.INFO, { title = "Session" })

  if has_real_files then
    vim.cmd("mksession! " .. vim.fn.fnameescape(session_path))
  else
    -- Delete session file if it no buffers associated with files exist
    if vim.loop.fs_stat(session_path) then
      ---@diagnostic disable-next-line: undefined-field
      vim.loop.fs_unlink(session_path)
    end
  end
end
