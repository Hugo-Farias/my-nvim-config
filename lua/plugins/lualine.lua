-- local function unsaved_buffers()
--   local unsaved = {}
--   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--     if vim.api.nvim_buf_get_option(buf, "modified") then
--       local name = vim.api.nvim_buf_get_name(buf)
--       if name == "" then
--         name = "[No Name]"
--       else
--         name = vim.fn.fnamemodify(name, ":t") -- only filename
--       end
--       table.insert(unsaved, name)
--     end
--   end
--
--   if #unsaved > 0 then
--     return " " .. table.concat(unsaved, ", ")
--   end
--   return ""
-- end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
  event = "VeryLazy",
  config = function()
    -- Custom Lualine component to show attached language server
    local clients_lsp = function()
      -- local bufnr = vim.api.nvim_get_current_buf()

      local clients = vim.lsp.get_clients()
      if next(clients) == nil then
        return ""
      end

      local c = {}
      for _, client in pairs(clients) do
        table.insert(c, client.name)
      end
      -- return " " .. table.concat(c, "|")
      return " " .. table.concat(c, "|")
    end

    -- local custom_catppuccin = require("lualine.themes.catppuccin")

    -- Custom colours
    -- custom_catppuccin.normal.b.fg = "#cad3f5"
    -- custom_catppuccin.insert.b.fg = "#cad3f5"
    -- custom_catppuccin.visual.b.fg = "#cad3f5"
    -- custom_catppuccin.replace.b.fg = "#cad3f5"
    -- custom_catppuccin.command.b.fg = "#cad3f5"
    -- custom_catppuccin.inactive.b.fg = "#cad3f5"
    --
    -- custom_catppuccin.normal.c.fg = "#6e738d"
    -- custom_catppuccin.normal.c.bg = "#1e2030"

    require("lualine").setup({
      options = {
        -- theme = custom_catppuccin,
        component_separators = "",
        -- section_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "Outline" },
      },
      sections = {
        lualine_a = {
          { "mode", icon = "" },
          -- { "mode", separator = { left = " ", right = "" }, icon = "" },
          -- { "mode", separator = { left = "", right = "" }, icon = "" },
        },
        lualine_b = {
          {
            "filetype",
            icon_only = true,
            padding = { left = 1, right = 0 },
            colored = false,
          },
          {
            "filename",
            path = 1,
            -- symbols = { modified = "🟡" },
          },
        },
        lualine_c = {
          {
            "branch",
            icon = "",
          },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            colored = false,
          },
        },
        lualine_x = {
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            update_in_insert = true,
          },
          -- {
          --   unsaved_buffers,
          --   "encoding",
          --   "fileformat",
          --   "filetype",
          -- },
        },
        lualine_y = { clients_lsp },
        lualine_z = {
          { "location", icon = "" },
          -- { "location", separator = { left = "", right = " " }, icon = "" },
          -- { "location", separator = { left = "", right = "" }, icon = "" },
        },
      },
      -- inactive_sections = {
      --   lualine_a = { "filename" },
      --   lualine_b = {},
      --   lualine_c = {},
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = { "location" },
      -- },
      -- extensions = { "toggleterm", "trouble" },
    })
  end,
}
