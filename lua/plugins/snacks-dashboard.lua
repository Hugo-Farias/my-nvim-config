vim.api.nvim_create_user_command("MkProject", function()
  SmartChangeDir()
  IsProject = true
end, {})

function SessionName(path)
  local session_dir = "C:/Users/Hugo/AppData/Local/nvim-data/sessions/"
  local session_name = path:gsub("[:/\\]", "%%") .. ".vim"
  return session_dir .. session_name
end

function LoadSession(picker, item)
  local session_path = SessionName(item.file)
  vim.cmd("tcd " .. item.file)
  picker:close()

  IsProject = true

  if vim.loop.fs_stat(session_path) then
    vim.cmd("silent! source " .. vim.fn.fnameescape(session_path))
  else
    vim.schedule(function()
      vim.cmd("lua Snacks.dashboard.pick('files')")
    end)
  end
end

local function loadPreviousSession()
  local session_dir = "C:/Users/Hugo/AppData/Local/nvim-data/sessions/"
  local files = vim.fn.glob(session_dir .. "*.vim", false, true)
  if #files == 0 then
    return
  end
  table.sort(files, function(a, b)
    return vim.loop.fs_stat(a).mtime.sec > vim.loop.fs_stat(b).mtime.sec
  end)
  local last_session = files[1]
  if last_session then
    vim.cmd("silent! source " .. vim.fn.fnameescape(last_session))
  end
end

---@class snacks.dashboard.Config
return {
  enabled = true,
  width = 60,
  row = nil, -- dashboard position. nil for center
  col = nil, -- dashboard position. nil for center
  pane_gap = 4, -- empty columns between vertical panes
  autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
  -- These settings are used by some built-in sections
  preset = {
    -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
    ---@type fun(cmd:string, opts:table)|nil
    pick = nil,
    -- Used by the `keys` section to show keymaps.
    -- Set your custom keymaps here.
    -- When using a function, the `items` argument are the default keymaps.
    -- -@type snacks.dashboard.Item[]
    keys = {
      { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
      {
        icon = " ",
        key = "c",
        desc = "Config",
        action = "<cmd>lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})<CR>",
      },
      -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      {
        icon = " ",
        key = "p",
        desc = "Projects",
        action = function()
          require("snacks").picker.projects({
            confirm = LoadSession,
          })
        end,
        -- action = ":lua Snacks.dashboard.pick('projects')",
      },
      {
        icon = " ",
        key = "s",
        desc = "Previously Opened Session",
        action = function()
          loadPreviousSession()
        end,
      },
      { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },
  },
  formats = {
    -- icon = function(item)
    --   if item.file and item.icon == "file" or item.icon == "directory" then
    --     return M.icon(item.file, item.icon)
    --   end
    --   return { item.icon, width = 2, hl = "icon" }
    -- end,
    footer = { "%s", align = "center" },
    header = { "%s", align = "center" },
    file = function(item, ctx)
      local fname = vim.fn.fnamemodify(item.file, ":~")
      fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
      if #fname > ctx.width then
        local dir = vim.fn.fnamemodify(fname, ":h")
        local file = vim.fn.fnamemodify(fname, ":t")
        if dir and file then
          file = file:sub(-(ctx.width - #dir - 2))
          fname = dir .. "/…" .. file
        end
      end
      local dir, file = fname:match("^(.*)/(.+)$")
      return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
    end,
  },
  sections = {
    { section = "header" },
    { section = "keys", gap = 1, padding = 1 },
    { section = "startup" },
  },
}
