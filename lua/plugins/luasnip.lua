return {
  "L3MON4D3/LuaSnip",
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
    -- require("snippets.javascript")
    -- require("snippets.javascriptreact")

    for _, filetype in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
      ls.add_snippets(filetype, require("snippets.javascript"))
    end

    for _, filetype in ipairs({ "javascriptreact", "typescriptreact" }) do
      ls.add_snippets(filetype, require("snippets.javascriptreact"))
    end

    -- require("luasnip").filetype_extend("typescript", { "javascript" })
    -- require("luasnip").filetype_extend("javascriptreact", { "javascript" })
    -- require("luasnip").filetype_extend("typescriptreact", { "javascriptreact" })
  end,
}
