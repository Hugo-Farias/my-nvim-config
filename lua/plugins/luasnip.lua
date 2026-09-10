return {
  "L3MON4D3/LuaSnip",
  lazy = false,
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  dependencies = {
    -- "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local ls = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load() -- Load snippets from friendly-snippets

    for _, filetype in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
      ls.add_snippets(filetype, require("snippets.javascript"))
    end

    for _, filetype in ipairs({ "javascriptreact", "typescriptreact" }) do
      ls.add_snippets(filetype, require("snippets.javascriptreact"))
    end

    for _, filetype in ipairs({ "json", "jsonc" }) do
      ls.add_snippets(filetype, require("snippets.json"))
    end
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
    {
      "<C-f>",
      function()
        if require("luasnip").in_snippet() then
          return require("luasnip").jump(1)
        else
          vim.api.nvim_feedkeys("a", "i", false)
        end
      end,
      expr = false,
      desc = "LuaSnip: Jump forward",
      mode = { "i" },
    },
    {
      "<C-b>",
      function()
        if require("luasnip").in_snippet() then
          return require("luasnip").jump(-1)
        else
          vim.api.nvim_feedkeys("h", "i", false)
        end
      end,
      expr = false,
      desc = "LuaSnip: Jump Backwards",
      mode = { "i" },
    },
  },
}
