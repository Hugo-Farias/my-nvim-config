local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- stylua: ignore start
  s({
    trig = ".fn",
    wordTrig = false,
  }, {
    t("const "), i(1), t(" = ("), i(2), t({ ") => {", "\t" }),
    i(3),
    t({ "", "}" }),
  }),
  s({
    trig = ".af",
    wordTrig = false,
  }, {
    t("("), i(1), t(") => {"), i(2), t("}"),
  }),
  s({
    trig = ".log",
    wordTrig = false,
  }, {
    t("console.log("), i(1), t(")"),
  }),
}
