return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "ts_ls" },
    })

    local lspconfig = require("lspconfig")
    for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
      lspconfig[server].setup({})
    end
  end
}
