require("lazy").setup({
  { "nvim-lua/plenary.nvim" },

  ---- LSP Related ----
  { require("lsp") },
  { require("plugins.mason") },

  { require("plugins.snacks") },
  { require("plugins.treesitter") },
  { require("plugins.treesitter-context") },
  { require("plugins.schemastore") },
  { require("plugins.gitsigns") },

  ---- General Editing ----
  { require("plugins.mini-ai") },
  { require("plugins.vim-camelsnek") },
  { require("plugins.nvim-toggler") },
  { require("plugins.nvim-ts-autotag") },
  { require("plugins.multicursor") },
  { require("plugins.rainbow-delimiters") },
  { require("plugins.mini-surround") },
  { require("plugins.tabout") },
  { require("plugins.mini-splitjoin") },
  { require("plugins.mini-align") },
  { require("plugins.timber") },
  { require("plugins.nvim-spider") },
  { require("plugins.todo-comments") },
  { require("plugins.mini-pairs") },

  ---- UI ----
  { "j-hui/fidget.nvim", version = "*", opts = {} },
  { require("plugins.which-key") },

  ---- Language Support ----
  { "kmonad/kmonad-vim" },
  { "MeanderingProgrammer/render-markdown.nvim" },

  ---- File Nav ----
  -- { require("plugins.harpoon") },
  { require("plugins.grapple") },
  -- { require("plugins.harpoon2") },

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
  { require("plugins.prompt-yank") },
  { require("plugins.zbirenbaum-copilot") },
  -- { require("plugins.windsurf") },

  ---- Color Preview/Pickers ----
  { require("plugins.ccc") },
  { require("plugins.color-converter") },

  ---- Status Line ----
  { require("plugins.lualine") },

  ---- Colors ----
  { require("schemes.cyberdream") },
  { require("schemes.tokyonight") },
  -- { "catppuccin/nvim", priority = 1000 },
  -- { require("colors") },
})
