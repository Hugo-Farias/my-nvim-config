-- TODO: fix luasnip deleting characters issue
return {
  "L3MON4D3/LuaSnip",
  lazy = false,
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local ls = require("luasnip")

    for _, filetype in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
      ls.add_snippets(filetype, require("snippets.javascript"))
    end

    for _, filetype in ipairs({ "javascriptreact", "typescriptreact" }) do
      ls.add_snippets(filetype, require("snippets.javascriptreact"))
    end

    ls.add_snippets("json", require("snippets.json"))

    -- require("luasnip").filetype_extend("typescript", { "javascript" })
    -- require("luasnip").filetype_extend("javascriptreact", { "javascript" })
    -- require("luasnip").filetype_extend("typescriptreact", { "javascriptreact" })
  end,
  keys = {
    {
      "<C-t>",
      function()
        return require("luasnip").jump(1)
      end,
      expr = true,
      desc = "LuaSnip: Jump forward",
    },
    -- {
    --   "<S-Tab>",
    --   function()
    --     return require("luasnip").jump(-1)
    --   end,
    --   expr = true,
    --   desc = "LuaSnip: Jump backward",
    -- },
  },
}
