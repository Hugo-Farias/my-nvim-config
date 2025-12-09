local ls = require("luasnip")
local postfix = require("luasnip.extras.postfix").postfix
local f = ls.function_node
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

  -- s({
  --   trig = ".log",
  --   wordTrig = false,
  -- }, {
  --   t("console.log("), i(1), t(")"),
  -- }),

  postfix({ trig = ".log", match_pattern = "[%w%._()%[%]{}]+" }, {
    f(function(_, parent)
      return "console.log(" .. parent.snippet.env.POSTFIX_MATCH .. ")"
    end),
  }),

  s(".imp", {
    t("import "), i(2), t(" from '"), i(1), t("';"),
  }),

  -- querySelector
  s(".qs", {
    t('document.querySelector("'),
    i(1),
    t('")'),
  }),

  -- querySelectorAll
  s(".qsa", {
    t('document.querySelectorAll("'),
    i(1),
    t('")'),
  }),
}
