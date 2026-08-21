local M = {}

-- function M.set_colorscheme(color)
--   if not color then
--     return nil
--   end
--
--   vim.cmd.colorscheme(color)
--   -- vim.o.background = "dark"
--
--   -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--   -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--   -- vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#00b3b3" }) -- teal
--   -- vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#91e18a" }) -- pink
--
--   vim.api.nvim_set_hl(0, "LineNr", { fg = "#E6E6E6" })
--   vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#666666" })
--   vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#666666" })
-- end

function M.close_all_splits()
  vim.api.nvim_feedkeys("q", "n", false)
  vim.api.nvim_feedkeys("", "n", false)
  vim.cmd("wincmd h")
  vim.cmd("wincmd k")
  vim.cmd("wincmd o")
  vim.cmd("silent! close")
end

-- Change location to git root if found, otherwise to file's location
function M.smart_change_dir()
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

-- Get the session's directory path
function M.session_name(path)
  local session_dir = vim.fn.stdpath("data") .. "/sessions/"
  local session_name = path:gsub("[:/\\]", "%%") .. ".vim"
  return session_dir .. session_name
end

-- Save session in nvim-data/session with name based on the current working directory
-- if no files are associated with the buffers, delete the session file
function M.smart_save_session()
  if not IsProject then
    return
  end

  local cwd = vim.fn.getcwd()
  local git_dir = cwd .. "/.git"

  if not vim.loop.fs_stat(git_dir) then
    return
  end

  local session_path = M.session_name(cwd)

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

  if has_real_files then
    vim.cmd("mksession! " .. vim.fn.fnameescape(session_path))
  else
    -- Delete session file
    if vim.loop.fs_stat(session_path) then
      vim.loop.fs_unlink(session_path)
    end
  end
end

-- Command to diff current buffer with saved file on disk
function M.diff_saved()
  local file = vim.fn.expand("%:p")
  local type = vim.bo.filetype
  local diff = vim.wo.diff

  if diff then
    vim.cmd("wincmd o")
    return
  end

  vim.cmd("vert new")
  vim.cmd("read " .. file)
  vim.cmd("0d_") -- Removed empty first line

  vim.cmd("setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile")
  vim.cmd("setlocal readonly nomodifiable")
  vim.cmd("set filetype=" .. type)
  vim.cmd("diffthis")

  vim.cmd("wincmd p")
  vim.cmd("diffthis")
  vim.cmd("wincmd H")
  -- vim.cmd("wincmd |")
end

return M
