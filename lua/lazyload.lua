require("lazy").setup({
  -- { "nvim-lua/plenary.nvim" },

  { require("lsp") },
  { require("plugins.mason") },
  { require("plugins.todo-comments") },
  { require("plugins.snacks") },

  -- { require("plugins.vim-smartword") },
  { require("plugins.nvim-spider") },
  { require("plugins.harpoon") },
  -- { require("plugins.undotree") },
  -- { require("plugins.flash") },
  { require("plugins.which-key") },
  { require("plugins.gitsigns") },
  { require("plugins.timber") },
  { "Aasim-A/scrollEOF.nvim", event = { "CursorMoved", "WinScrolled" }, opts = {} },
  { require("plugins.neoscroll") }, -- Smooth Scrolling
  -- { require("plugins.render-markdown") },
  -- { require("plugins.oil") },

  ---- Multi Cursor ----
  { require("plugins.multicursor") },

  ---- Formatter ----
  { require("plugins.conform") },
  -- { require("plugins.nvim-ts-autotag") },
  { require("plugins.treesitter") },
  { require("plugins.treesitter-context") },
  { "HiPhish/rainbow-delimiters.nvim" },

  ---- AutoComplete ----
  -- { require("plugins.nvim-cmp") },
  { require("plugins.blink-cmp") },

  ---- Snippets ----
  { require("plugins.luasnip") },

  ---- AI assistant ----
  { require("plugins.zbirenbaum-copilot") },
  -- { require("plugins.windsurf") },

  ---- Mini Compilation ----
  { require("plugins.mini-icons") },
  { require("plugins.mini-surround") },
  { require("plugins.mini-pairs") },
  ---- Text Objects ----
  { require("plugins.mini-ai") },

  ---- Color Preview/Pickers ----
  -- { require("plugins.oklch-color-picker") },
  { require("plugins.ccc") },
  { require("plugins.nvim-highlight-colors") },
  -- { require("plugins.color-picker") },
  { require("plugins.color-converter") },

  ---- Buffer/Tab line ----
  -- { require("plugins.bufferline") },
  -- { require("plugins.mini-tabline") },

  ---- Status Line ----
  -- { require("plugins.mini-statusline") },
  { require("plugins.lualine") },

  ---- Language Support ----
  { "kmonad/kmonad-vim" },

  ---- Colors ----
  require("colors"),
})

-- { require("plugins.nvim-dap") },
-- { require("plugins.comfy-line-numbers") },
-- { require("plugins.luarocks") },
-- { require("plugins.null-ls") },
-- { "github/copilot.vim" },
-- { require("plugins.mini-files") },
