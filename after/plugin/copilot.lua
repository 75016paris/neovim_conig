-- after/plugin/copilot.lua
-- after/plugin/copilot.lua (Raccourcis seulement - config dans packer.lua)

-- Vérifier si copilot.lua est chargé
local has_copilot, copilot = pcall(require, "copilot")
if not has_copilot then
  print("Copilot.lua not loaded yet.")
  return
end

-- Raccourcis et fonctions utilitaires
vim.keymap.set('i', '<leader>debug', function()
  local suggestion = require('copilot.suggestion')
  local config = require('copilot.config').get()
  print("Suggestion enabled:", config.suggestion.enabled)
  print("Auto trigger:", config.suggestion.auto_trigger)
  print("Is visible:", suggestion.is_visible())
  print("Filetype:", vim.bo.filetype)
end, { desc = 'Debug Copilot' })

vim.keymap.set('i', '<C-u>', function()
  require('copilot.suggestion').dismiss()
  vim.defer_fn(function()
    require('copilot.suggestion').next()
  end, 100)
end, { desc = 'Force Copilot suggestion' })

vim.keymap.set('i', '<C-y>', function()
  require('copilot.suggestion').accept()
end, { desc = 'Accept Copilot suggestion' })

-- Alternative Ctrl+Enter si Shift+Enter ne marche pas
vim.keymap.set('i', '<C-CR>', function()
  require('copilot.suggestion').accept()
end, { desc = 'Accept Copilot suggestion (Ctrl+Enter)' })

vim.keymap.set('i', '<leader>cn', function()
  require('copilot.suggestion').next()
end, { desc = 'Next Copilot suggestion' })

vim.keymap.set('i', '<leader>cp', function()
  require('copilot.suggestion').prev()
end, { desc = 'Previous Copilot suggestion' })

-- Mode normal
vim.keymap.set('n', '<leader>cs', '<cmd>Copilot status<cr>', { desc = 'Copilot status' })
vim.keymap.set('n', '<leader>ce', '<cmd>Copilot enable<cr>', { desc = 'Enable Copilot' })
vim.keymap.set('n', '<leader>cx', '<cmd>Copilot disable<cr>', { desc = 'Disable Copilot' })

vim.keymap.set('n', '<leader>cP', function()
  require('copilot.panel').open()
end, { desc = 'Copilot panel' })
