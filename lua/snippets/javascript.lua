local ls = require("luasnip")
local s = ls.snippet
-- local f = ls.function_node
local t = ls.text_node
local i = ls.insert_node

return {
  -- stylua: ignore start
  s("fn", {
    t("const "), i(1), t(" = ("), i(2), t({ ") => {", "\t" }),
    i(3),
    t({ "", "}" }),
  }),

  s("aaf", {
    t("("), i(1, ""), t(") => {"), i(2, ""), t("}"),
  }),

  s(".log", {
    t("console.log("), i(1, ""), t(")"),
  }),
}
