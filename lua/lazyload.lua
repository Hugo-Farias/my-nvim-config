require("lazy").setup({
  -- { "nvim-lua/plenary.nvim" },

  { require("plugins.treesitter") },
  { require("plugins.treesitter-context") },
  -- { require("plugins.treesitter-textobjects") },
  { require("lsp") },
  { require("plugins.mason") },
  { require("plugins.todo-comments") },
  { require("plugins.snacks") },

  { require("plugins.nvim-spider") },
  { require("plugins.harpoon") },
  { require("plugins.which-key") },
  { require("plugins.gitsigns") },
  { require("plugins.timber") },
  -- { "Aasim-A/scrollEOF.nvim", event = { "CursorMoved", "WinScrolled" }, opts = {} },
  { require("plugins.neoscroll") }, -- Smooth Scrolling
  -- { require("plugins.render-markdown") },

  -- { require("plugins.noice") },
  -- { require("plugins.notify") },

  ---- File Explorer ----
  { require("plugins.yazi") },
  -- { require("plugins.mini-files") },

  ---- Multi Cursor ----
  { require("plugins.multicursor") },

  ---- Formatter ----
  { require("plugins.conform") },
  { require("plugins.nvim-ts-autotag") },
  { require("plugins.rainbow-delimiters") },

  ---- AutoComplete ----
  { require("plugins.nvim-cmp") },
  -- { require("plugins.blink-cmp") },

  ---- Snippets ----
  { require("plugins.luasnip") },

  ---- AI assistant ----
  { require("plugins.zbirenbaum-copilot") },
  -- { require("plugins.windsurf") },

  ---- Mini Compilation ----
  -- { require("plugins.mini-icons") },
  { require("plugins.mini-surround") },
  { require("plugins.mini-pairs") },
  { require("plugins.mini-ai") },
  { require("plugins.mini-splitjoin") },

  ---- Color Preview/Pickers ----
  { require("plugins.ccc") },
  { require("plugins.nvim-highlight-colors") },
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
