local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local t = ls.text_node
local i = ls.insert_node

return {
  -- stylua: ignore
  s("fn", {
    t("const "), i(1, "name"), t(" = ("), i(2), t({ ") => {", "\t" }),
    i(3),
    t({ "", "}" }),
  }),

  s("!hot", {
    t({
      "if (import.meta.hot) {",
      '  import.meta.hot.on("vite:beforeUpdate", () => console.clear());',
      "}",
    }),
  }),

  s({ trig = "log", wordTrig = true }, {
    t("console.log("),
    i(1),
    t(");"),
  }),

  -- s({ trig = ".log", wordTrig = true }, {
  --   t("console.log("),
  --   i(1),
  --   t(");"),
  -- }),

  s({
    trig = "([%w_%.%[%]%(%)]+)%.log", -- matches var.log, obj.method().log, arr[0].log etc.
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
  }, {
    f(function(_, snip)
      return "console.log(" .. snip.captures[1] .. ");"
    end, {}),
  }),
}
