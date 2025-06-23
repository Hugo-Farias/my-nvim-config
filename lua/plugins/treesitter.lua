return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
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
    { "<leader>th", "<cmd>TSHighlightCapturesUnderCursor<CR>", desc = "TS highlight group under cursor" },
  },
  opts = {
    -- TSConfig equivalent: passed to require("nvim-treesitter.configs").setup(opts)
    ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
    },
    sync_install = false,
    auto_install = true,
    ignore_install = {}, -- e.g., { "php" }
    modules = {}, -- for disabling or overriding module defaults if needed
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
