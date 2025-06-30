vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- Forcer noreadonly plus agressivement
vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
    pattern = "*",
    callback = function()
        vim.opt_local.readonly = false
    end,
})


-- vim.opt.guicursor = ""
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.termguicolors = true

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Override ignorecase if search contain cap

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"
vim.opt.timeoutlen = 800

vim.g.mapleader = " "

-- Disable swap files  for [No Name]
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.buftype == "" and vim.fn.expand("%") == "" then
            vim.bo.modified = false
        end
    end,
})
