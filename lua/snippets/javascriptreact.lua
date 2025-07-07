local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  -- stylua: ignore
  s("!hot", {
    t({
      "if (import.meta.hot) {",
      '  import.meta.hot.on("vite:beforeUpdate", () => console.clear());',
      "}",
    }),
 }),
}
