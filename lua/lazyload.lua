require("lazy").setup({
  { "nvim-lua/plenary.nvim" },

  { require("lsp") },
  { require("plugins.mason") },
  { require("plugins.snacks") },
  -- { require("plugins.luarocks") },

  { require("plugins.color-picker") },
  { require("plugins.vim-smartword") },
  { "tpope/vim-commentary" },
  { require("plugins.harpoon") },
  { require("plugins.undotree") },
  { require("plugins.flash") },
  { require("plugins.which-key") },
  { require("plugins.gitsigns") },
  { require("plugins.timber") },
  -- { require("plugins.nvim-dap") },
  -- { require("plugins.comfy-line-numbers") },
  { require("plugins.todo-comments") },
  -- { require("plugins.render-markdown") },

  ---- Multi Cursor ----
  { require("plugins.multicursor") },
  -- { "mg979/vim-visual-multi" },

  ---- Formatter ----
  -- { require("plugins.null-ls") },
  { require("plugins.conform") },
  { require("plugins.nvim-ts-autotag") },

  { require("plugins.treesitter") },
  { require("plugins.treesitter-context") },
  { "HiPhish/rainbow-delimiters.nvim" },

  ---- Project Manager ----
  -- { require("plugins.project") },

  ---- AutoComplete ----
  -- { require("plugins.blink-cmp") },
  { require("plugins.nvim-cmp") },

  ---- Snippets ----
  { require("plugins.luasnip") },

  ---- AI assistant ----
  -- { require("plugins.windsurf") },
  -- { "github/copilot.vim" },
  { require("plugins.zbirenbaum-copilot") },
  -- { require("plugins.avante") },

  ---- Mini Compilation ----
  { require("plugins.mini-icons") },
  { require("plugins.mini-surround") },

  ---- Text Objects ----
  { require("plugins.mini-ai") },

  ---- Color Preview ----
  { require("plugins.nvim-highlight-colors") },

  ---- Buffer/Tab line ----
  -- { require("plugins.mini-tabline") },
  { require("plugins.bufferline") },

  ---- Status Line ----
  { require("plugins.lualine") },
  -- { require("plugins.mini-statusline") },

  ---- Language Support ----
  { "kmonad/kmonad-vim" },

  ---- Colors ----
  require("colors"),
})
