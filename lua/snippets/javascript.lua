local ls = require("luasnip")
local s = ls.snippet
-- local f = ls.function_node
local t = ls.text_node
local i = ls.insert_node

return {
  -- stylua: ignore
  s("fn", {
    t("const "), i(1), t(" = ("), i(2), t({ ") => {", "\t" }),
    i(3),
    t({ "", "}" }),
  }),
}
