return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        less = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        ["markdown.mdx"] = { "prettierd" },
        graphql = { "prettierd" },
        vue = { "prettierd" },
        handlebars = { "prettierd" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters = {
        stylua = {
          inherit = false,
          command = "stylua",
          args = {
            "--search-parent-directories",
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--stdin-filepath",
            "$FILENAME",
            "-",
          },
        },
      },
      vim.keymap.set({ "n", "x" }, "<C-f>", function()
        require("conform").format({ async = true })
      end, { desc = "Format file with Conform" }),
    })
  end,
}
