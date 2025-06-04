-- after/plugin/cmp.lua
local lsp_zero = require('lsp-zero')
lsp_zero.extend_cmp()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- Navigation CMP
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    
    -- Ouvrir menu CMP avec Ctrl+o
    ['<C-o>'] = cmp.mapping.complete(),
    
    -- Enter pour accepter CMP
    ['<CR>'] = cmp.mapping.confirm({ 
      behavior = cmp.ConfirmBehavior.Replace,
      select = false 
    }),
    
    -- Ctrl+Y intelligent : priorité à Copilot, sinon CMP
    ['<C-y>'] = cmp.mapping(function(fallback)
      -- Si Copilot a une suggestion visible, l'accepter
      local has_copilot, copilot_suggestion = pcall(require, 'copilot.suggestion')
      if has_copilot and copilot_suggestion.is_visible() then
        copilot_suggestion.accept()
      -- Sinon, si CMP est ouvert, accepter CMP
      elseif cmp.visible() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
  
  -- Désactiver ghost_text pour éviter conflit avec Copilot
  experimental = {
    ghost_text = false,
  },
})
