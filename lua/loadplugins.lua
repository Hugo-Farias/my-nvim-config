return {
  { "nvim-tree/nvim-web-devicons" },
  { "rcarriga/nvim-notify", require("plugins.notify") },
  { "kana/vim-smartword", require("plugins.vim-smartword") },
  -- { "folke/noice.nvim", require('config.noice') },
  { "tpope/vim-commentary" },
  { "nvim-treesitter/nvim-treesitter", require("plugins.treesitter") },
  { "nvim-lua/plenary.nvim" },
  { "mbbill/undotree", require("plugins.undotree") },
  { "folke/flash.nvim", require("plugins.flash") },
  { "folke/which-key.nvim", require("plugins.which-key") },
  { "folke/snacks.nvim", require("plugins.snacks") },
  { "lewis6991/gitsigns.nvim", require("plugins.gitsigns") },
  { "windwp/nvim-autopairs", require("plugins.autopairs") },
  -- { "echasnovski/mini.nvim", require("plugins.mini") },
  { "echasnovski/mini.surround", version="*", require("plugins.mini-surround") },
  { "echasnovski/mini.ai", require("plugins.mini-ai") },
  { "ziontee113/color-picker.nvim", require("plugins.color-picker") },

  ---- Buffer/Tab line ----
  -- { "echasnovski/mini.tabline", require("plugins.mini-tabline") },
  { "akinsho/bufferline.nvim", require("plugins.bufferline") },

  ---- Status Line ----
  -- { "nvim-lualine/lualine.nvim", require("plugins.lualine") },
  { "echasnovski/mini.statusline", require("plugins.mini-statusline") },

  ---- Language Support ----
  { "kmonad/kmonad-vim" },
  -- { "jose-elias-alvarez/null-ls.nvim", require("plugins.null-ls") },

  ---- Formatter ----
  { "stevearc/conform.nvim", require("plugins.conform") },

  ---- LSP ----
  { "mason-org/mason.nvim", require("plugins.mason") },
  { "neovim/nvim-lspconfig", require("lsp") },
}
