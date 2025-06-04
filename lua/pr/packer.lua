-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer peut se gérer lui-même
  use 'wbthomason/packer.nvim'
  
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  -- Color Theme
  use({
    "ellisonleao/gruvbox.nvim",
    config = function()
        vim.opt.termguicolors = true
        require("gruvbox").setup({
            contrast = "",
      })
      vim.opt.background = "dark"
      vim.cmd("colorscheme gruvbox")
    end
  })
  
  -- lsp-zero v3
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }
  
  -- Copilot.lua (charger automatiquement avec configuration)
  use {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",  -- Charger au démarrage
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<C-y>",      -- Corrigé avec Ctrl+Y qui fonctionne
            accept_word = false,
            accept_line = false,
            next = "<C-j>",
            prev = "<C-k>",
            dismiss = "<C-e>",
          },
        },
        filetypes = {
          ["*"] = true,
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node',
        server_opts_overrides = {},
      })
    end,
  }
  
  -- CopilotChat pour la fonctionnalité de dialogue (AJOUTÉ ICI)
  use {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    requires = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("CopilotChat").setup {
        debug = false,
      }
    end,
  }
  
  -- Formatter + Linter (for black & ruff)
  use 'nvimtools/none-ls.nvim' 
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons',
      },
  }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('luk400/vim-jukit')
end)  -- Cette parenthèse ferme la fonction startup()
