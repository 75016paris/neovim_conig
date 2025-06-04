-- Configuration GitHub Copilot
-- Reset complet avec <leader>co

-- <leader>co + i → Déclencher suggestion
vim.keymap.set('i', '<leader>coi', '<Plug>(copilot-suggest)', { desc = 'Trigger Copilot suggestion' })

-- <leader>co + a → Accepter suggestion
vim.keymap.set('i', '<leader>coa', 'copilot#Accept("\\<CR>")', { 
    expr = true, 
    replace_keycodes = false,
    desc = 'Accept Copilot suggestion'
})

-- <leader>co + n → Suggestion suivante
vim.keymap.set('i', '<leader>con', '<Plug>(copilot-next)', { desc = 'Next Copilot suggestion' })

-- <leader>co + p → Suggestion précédente  
vim.keymap.set('i', '<leader>cop', '<Plug>(copilot-previous)', { desc = 'Previous Copilot suggestion' })

-- <leader>co + d → Rejeter/dismiss suggestion
vim.keymap.set('i', '<leader>cod', '<Plug>(copilot-dismiss)', { desc = 'Dismiss Copilot suggestion' })

-- <leader>co + c → Chat/Panel Copilot
vim.keymap.set('n', '<leader>coc', '<cmd>Copilot panel<cr>', { desc = 'Copilot chat panel' })

-- <leader>co + e → Enable Copilot
vim.keymap.set('n', '<leader>coe', '<cmd>Copilot enable<cr>', { desc = 'Enable Copilot' })

-- <leader>co + x → Disable Copilot  
vim.keymap.set('n', '<leader>cox', '<cmd>Copilot disable<cr>', { desc = 'Disable Copilot' })

-- <leader>co + s → Status Copilot
vim.keymap.set('n', '<leader>cos', '<cmd>Copilot status<cr>', { desc = 'Copilot status' })
