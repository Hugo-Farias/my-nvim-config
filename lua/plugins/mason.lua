return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      automatic_enable = false,
      ensure_installed = { "lua_ls" },
    })

    local lspconfig = require("lspconfig")
    for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
      lspconfig[server].setup({})
    end
  end,
}
