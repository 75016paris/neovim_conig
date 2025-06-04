-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

-- Telescope
use {
'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

-- Color Theme
use({
  "ellisonleao/gruvbox.nvim",
  config = function()
      vim.opt.termguicolors =true

      require("gruvbox").setup({
--          terminal_colors = true,
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

-- Formatter + Linter (for black & ruff)
use 'nvimtools/none-ls.nvim' 


use {
    'nvim-tree/nvim-tree.lua',
    requires = {
        'nvim-tree/nvim-web-devicons', -- icônes de fichiers
    },
}


use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use('nvim-treesitter/playground')
use('theprimeagen/harpoon')
use('mbbill/undotree')
use('tpope/vim-fugitive')
use('luk400/vim-jukit')
use('github/copilot.vim')
end)

