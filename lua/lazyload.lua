require("lazy").setup({
  ---- LSP ----
  { require("plugins.mason") },
  { require("lsp") },

  { require("plugins.treesitter") },
  { require("plugins.treesitter-context") },
  { "nvim-lua/plenary.nvim" },

  ---- AutoComplete ----
  { require("plugins.blink-cmp") },
  -- { require("plugins.nvim-cmp") },

  ---- AI assistant ----
  -- { require('plugins.codecompanion') },
  -- { require("plugins.windsurf") },
  { "github/copilot.vim" },

  ---- Mini Compilation ----
  { require("plugins.mini-icons") },
  { require("plugins.mini-surround") },
  { require("plugins.mini-ai") },

  { require("plugins.color-picker") },
  { require("plugins.snacks") },
  { require("plugins.vim-smartword") },
  { "tpope/vim-commentary" },
  -- { "ThePrimeagen/harpoon" },
  { require("plugins.undotree") },
  { require("plugins.flash") },
  { require("plugins.which-key") },
  { require("plugins.gitsigns") },

  ---- Buffer/Tab line ----
  -- { require("plugins.mini-tabline") },
  { require("plugins.bufferline") },

  ---- Status Line ----
  -- { require("plugins.lualine") },
  { require("plugins.mini-statusline") },

  ---- Language Support ----
  { "kmonad/kmonad-vim" },
  -- { require("plugins.null-ls") },

  ---- Formatter ----
  { require("plugins.conform") },
  { require("plugins.nvim-ts-autotag") },

  ---- Colors ----
  require("colors"),
})
