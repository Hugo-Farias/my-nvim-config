return {
  { "nvim-tree/nvim-web-devicons" },
  { "rcarriga/nvim-notify", require("plugins.notify") },
  { "kana/vim-smartword", require("plugins.vim-smartword") },
  { "nvim-lualine/lualine.nvim", require("plugins.lualine") },
  -- { "folke/noice.nvim", require('config.noice') },
  { "tpope/vim-commentary" },
  { "nvim-treesitter/nvim-treesitter", require("plugins.treesitter") },
  -- { "echasnovski/mini.nvim", require("plugins.mini") },
  { "echasnovski/mini.surround", version="*", require("plugins.mini-surround") },
  { "nvim-lua/plenary.nvim" },
  { "ThePrimeagen/harpoon", require("plugins.harpoon") },
  { "mbbill/undotree", require("plugins.undotree") },
  -- { "nvim-telescope/telescope.nvim", require("plugins.telescope") }, 
  { "akinsho/bufferline.nvim", require("plugins.bufferline") },
  { "folke/flash.nvim", require("plugins.flash") },
  { "folke/which-key.nvim", require("plugins.which-key") },
  { "folke/snacks.nvim", require("plugins.snacks") },
  { "lewis6991/gitsigns.nvim", require("plugins.gitsigns") },
  { "stevearc/conform.nvim" },
  { "windwp/nvim-autopairs", require("plugins.autopairs") },

  ---- Language Support ----
  { "kmonad/kmonad-vim" },
  -- { "jose-elias-alvarez/null-ls.nvim", require("plugins.null-ls") },

  ---- LSP ----
  { "mason-org/mason.nvim", require("plugins.mason") },
  { "neovim/nvim-lspconfig", require("lsp") },
}
