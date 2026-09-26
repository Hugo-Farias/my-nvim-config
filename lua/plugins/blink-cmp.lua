---@param direction "next" | "prev"
local function blink_open(direction, cmp)
  if cmp.is_visible() then
    if direction == "next" then
      cmp.select_next()
    else
      cmp.select_prev()
    end
  else
    cmp.show()
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", {
      link = "FloatBorder",
    })
  end,
})

return { -- optional blink completion source for require statements and module annotations
  "saghen/blink.cmp",
  version = "*",
  lazy = false,
  dependencies = {
    -- "giuxtaposition/blink-cmp-copilot",
    require("plugins.lazydev"),
  },
  opts = {
    completion = {
      menu = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
      },
      documentation = {
        window = {
          border = "rounded",
          -- winblend = 100,
        },
      },
    },
    snippets = {
      preset = "luasnip",
    },
    -- ensure you have the `snippets` source (enabled by default)
    sources = {
      -- add lazydev to your completion providers
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
        -- lsp = {
        --   trigger_characters = { ".", ":", "->" }, -- force trigger on dot
        -- },
      },
    },
    keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = "none",

      ["<Up>"] = { "select_prev", "fallback" },
      -- ["<C-k>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      -- ["<C-j>"] = { "select_next", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },

      -- ["<Tab>"] = { "none", "fallback" },

      -- disable a keymap from the preset
      -- ["<C-e>"] = false, -- or {}

      ["<C-e>"] = { "hide", "fallback" },

      ["<C- >"] = { "show_documentation", "fallback" },

      -- ["<Right>"] = { "show_documentation", "fallback" },
      -- ["<C-h>"] = { "hide_documentation", "fallback" },
      -- ["<Left>"] = { "hide_documentation", "fallback" },

      -- ["<C-n>"] = { "show", "fallback" },
      -- ["<C-p>"] = { "show", "fallback" },
      --

      -- show with a list of providers
      -- ["<C-space>"] = {
      --   function(cmp)
      --     cmp.show({ providers = { "snippets" } })
      --   end,
      -- },
    },
  },
  keys = function()
    local cmp = require("blink.cmp")
    local out = {
      {
        "<C-p>",
        function()
          blink_open("prev", cmp)
        end,
        mode = { "i", "c" },
        desc = "Show menu or select previous item",
      },
      {
        "<C-n>",
        function()
          blink_open("next", cmp)
        end,
        mode = { "i", "c" },
        desc = "Show menu or select next item",
      },
      {
        "<C-l>",
        function()
          if cmp.is_visible() then
            -- cmp.accept()
            vim.api.nvim_feedkeys("", "c", false)
          else
            cmp.show()
          end
        end,
        mode = "c",
        desc = "Select item",
      },
    }
    return out
  end,
}
