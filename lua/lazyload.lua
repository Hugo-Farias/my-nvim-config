require("lazy").setup({
  { "nvim-lua/plenary.nvim" },

  { require("lsp") },
  { require("plugins.mason") },
  { require("plugins.schemastore") },
  { require("plugins.treesitter") },
  { require("plugins.treesitter-context") },
  { require("plugins.todo-comments") },
  { require("plugins.snacks") },
  { require("plugins.nvim-spider") },
  { require("plugins.harpoon") },
  -- { require("plugins.harpoon2") },
  { require("plugins.which-key") },
  { require("plugins.gitsigns") },
  { require("plugins.timber") },
  { "j-hui/fidget.nvim", version = "*", opts = {} },

  ---- Language Support ----
  { "kmonad/kmonad-vim" },
  { "MeanderingProgrammer/render-markdown.nvim" },

  ---- General Editing ----
  { require("plugins.vim-camelsnek") },
  { require("plugins.nvim-toggler") },
  { require("plugins.nvim-ts-autotag") },
  { require("plugins.multicursor") },
  { require("plugins.rainbow-delimiters") },
  { require("plugins.mini-surround") },
  { require("plugins.tabout") },
  { require("plugins.mini-ai") },
  { require("plugins.mini-splitjoin") },
  { require("plugins.mini-align") },
  -- { require("plugins.mini-pairs") },

  ---- Runners ----
  { require("plugins.jaq") },

  ---- File Explorer ----
  { require("plugins.yazi") },

  ---- Formatter ----
  { require("plugins.conform") },

  ---- AutoComplete ----
  -- { require("plugins.nvim-cmp") },
  { require("plugins.blink-cmp") },

  ---- Snippets ----
  { require("plugins.luasnip") },

  ---- Assistant Agent ----
  { require("plugins.zbirenbaum-copilot") },
  -- { require("plugins.windsurf") },

  ---- Color Preview/Pickers ----
  { require("plugins.ccc") },
  { require("plugins.color-converter") },

  ---- Status Line ----
  { require("plugins.lualine") },

  ---- Colors ----
  require("colors"),
})
