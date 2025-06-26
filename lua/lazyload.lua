require("lazy").setup({
  ---- LSP ----
  { "mason-org/mason.nvim", require("plugins.mason") },
  { "neovim/nvim-lspconfig", require("lsp") },

  -- { "nvim-tree/nvim-web-devicons" },
  -- { "rcarriga/nvim-notify", require("plugins.notify") },
  { "kana/vim-smartword", require("plugins.vim-smartword") },
  -- { "folke/noice.nvim", require("plugins.noice") },
  { "tpope/vim-commentary" },
  -- { "ThePrimeagen/harpoon" },
  { "nvim-treesitter/nvim-treesitter", require("plugins.treesitter") },
  { "nvim-treesitter/nvim-treesitter-context", require("plugins.treesitter-context") },
  { "nvim-lua/plenary.nvim" },
  { "mbbill/undotree", require("plugins.undotree") },
  { "folke/flash.nvim", require("plugins.flash") },
  { "folke/which-key.nvim", require("plugins.which-key") },
  { "folke/snacks.nvim", require("plugins.snacks") },
  { "lewis6991/gitsigns.nvim", require("plugins.gitsigns") },
  { "windwp/nvim-autopairs", require("plugins.autopairs") },

  ---- Mini Compilation ----
  { "echasnovski/mini.icons", require("plugins.mini-icons") },
  { "echasnovski/mini.surround", require("plugins.mini-surround") },
  { "echasnovski/mini.ai", require("plugins.mini-ai") },
  { "ziontee113/color-picker.nvim", require("plugins.color-picker") },
  -- { "echasnovski/mini.indentscope", require("plugins.mini-indentscope") },

  ---- Buffer/Tab line ----
  -- { "echasnovski/mini.tabline", require("plugins.mini-tabline") },
  { "akinsho/bufferline.nvim", require("plugins.bufferline") },

  ---- Status Line ----
  -- { "nvim-lualine/lualine.nvim", require("plugins.lualine") },
  { "echasnovski/mini.statusline", require("plugins.mini-statusline") },

  ---- Language Support ----
  { "kmonad/kmonad-vim" },
  -- { "jose-elias-alvarez/nLogull-ls.nvim", require("plugins.null-ls") },

  ---- Formatter ----
  { "stevearc/conform.nvim", require("plugins.conform") },
  { "windwp/nvim-ts-autotag", require("plugins.nvim-ts-autotag") },

  ---- Colors ----
  require("colors"),
})
