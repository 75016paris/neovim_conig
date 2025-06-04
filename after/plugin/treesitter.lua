require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "python" },
  highlight = { enable = true },
}

-- Force l'activation
vim.cmd('TSEnable highlight')
