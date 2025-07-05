local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- stylua: ignore start
return {
  s("fn", {
    t("const "), i(1, "name"), t(" = ("), i(2), t({ ") => {", "\t" }),
    i(3),
    t({ "", "}" }),
  }),
}
