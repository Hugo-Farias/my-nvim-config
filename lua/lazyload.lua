require("lazy").setup({
  { "nvim-lua/plenary.nvim" },

  { require("lsp") },
  { require("plugins.mason") },
  { require("plugins.snacks") },
  -- { require("plugins.luarocks") },

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
  -- { require('plugins.codecompanion') },
  -- { require("plugins.windsurf") },
  -- { "github/copilot.vim" },
  { require("plugins.zbirenbaum-copilot") },
  -- { require("plugins.avante") },

  ---- Mini Compilation ----
  { require("plugins.mini-icons") },
  { require("plugins.mini-surround") },
  { require("plugins.mini-ai") },

  { require("plugins.color-picker") },
  { require("plugins.vim-smartword") },
  { "tpope/vim-commentary" },
  { require("plugins.harpoon") },
  { require("plugins.undotree") },
  { require("plugins.flash") },
  { require("plugins.which-key") },
  { require("plugins.gitsigns") },
  { require("plugins.vim-visual-multi") },
  { require("plugins.timber") },
  -- { require("plugins.nvim-dap") },

  ---- Buffer/Tab line ----
  -- { require("plugins.mini-tabline") },
  { require("plugins.bufferline") },

  ---- Status Line ----
  -- { require("plugins.lualine") },
  { require("plugins.mini-statusline") },

  ---- Language Support ----
  { "kmonad/kmonad-vim" },

  ---- Colors ----
  require("colors"),
})
