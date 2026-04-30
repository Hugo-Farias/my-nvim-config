return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  branch = "main",
  cmd = {
    "TSInstall",
    "TSBufEnable",
    "TSBufDisable",
    "TSModuleInfo",
    "TSUpdate",
    "TSUpdateSync",
    "TSUninstall",
  },
  keys = {
    -- { "<leader>th", "<cmd>TSHighlightCapturesUnderCursor<CR>", desc = "TS highlight group under cursor" },
  },
  opts = {
    -- TSConfig equivalent: passed to require("nvim-treesitter.configs").setup(opts)
    ensure_installed = {
      "lua",
      "glimmer_javascript",
      "glimmer_typescript",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
      "yaml",
      "html",
      "css",
    },
    sync_install = true,
    auto_install = true,
    -- ignore_install = { "powershell" }, -- e.g., { "php" }
    modules = {}, -- for disabling or overriding module defaults if needed
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
      -- disable = { "powershell" },
    },
    indent = {
      enable = true,
      -- disable = { "powershell" },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.config").setup(opts)

    -- vim.api.nvim_create_autocmd("FileType", {
    --   callback = function(ev)
    --     local lang = vim.treesitter.language.get_lang(ev.match)
    --     local available_langs = require("nvim-treesitter").get_available()
    --     local is_available = vim.tbl_contains(available_langs, lang)
    --
    --     if is_available then
    --       local installed_langs = require("nvim-treesitter").get_installed()
    --       local installed = vim.tbl_contains(installed_langs, lang)
    --       if not installed then
    --         -- require("nvim-treesitter").install(lang):wait()
    --         require("nvim-treesitter").install(lang)
    --       end
    --       vim.treesitter.start()
    --       require("nvim-treesitter").indentexpr()
    --     end
    --   end,
    -- })
  end,
}
