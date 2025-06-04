-- after/plugin/copilot-chat.lua

-- Vérifier si CopilotChat est disponible
local has_chat, chat = pcall(require, "CopilotChat")
if not has_chat then
  return
end

-- Configuration des prompts personnalisés
chat.setup({
  question_header = "## User ",
  answer_header = "## Copilot ",
  error_header = "## Error ",
  prompts = {
    Explain = {
      prompt = "/COPILOT_EXPLAIN Explique le code sélectionné",
    },
    Review = {
      prompt = "/COPILOT_REVIEW Révise le code sélectionné",
    },
    Fix = {
      prompt = "/COPILOT_GENERATE Il y a un problème dans ce code. Réécris le code pour le corriger.",
    },
    Optimize = {
      prompt = "/COPILOT_GENERATE Optimise le code sélectionné pour améliorer les performances et la lisibilité.",
    },
    Docs = {
      prompt = "/COPILOT_GENERATE Écris la documentation pour le code sélectionné.",
    },
    Tests = {
      prompt = "/COPILOT_GENERATE Génère des tests pour mon code",
    },
  },
})

-- Raccourcis principaux
vim.keymap.set({'n', 'v'}, '<leader>cc', '<cmd>CopilotChat<cr>', { desc = 'CopilotChat - Open chat' })
vim.keymap.set({'n', 'v'}, '<leader>cx', '<cmd>CopilotChatExplain<cr>', { desc = 'CopilotChat - Explain code' })
vim.keymap.set({'n', 'v'}, '<leader>cf', '<cmd>CopilotChatFix<cr>', { desc = 'CopilotChat - Fix code' })
vim.keymap.set({'n', 'v'}, '<leader>co', '<cmd>CopilotChatOptimize<cr>', { desc = 'CopilotChat - Optimize code' })
vim.keymap.set({'n', 'v'}, '<leader>cd', '<cmd>CopilotChatDocs<cr>', { desc = 'CopilotChat - Generate docs' })
vim.keymap.set({'n', 'v'}, '<leader>ct', '<cmd>CopilotChatTests<cr>', { desc = 'CopilotChat - Generate tests' })

-- Configuration pour chat en bas (ligne de commande)
local select = require("CopilotChat.select")

-- Chat simple avec input en bas
vim.keymap.set('v', '<C-i>', function()
  local input = vim.fn.input("Ask Copilot: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { 
      selection = select.visual,
      window = {
        layout = 'horizontal',   -- Horizontal en bas
        width = 1.0,            -- Pleine largeur
        height = 0.3,           -- 30% de hauteur en bas
      }
    })
  end
end, { desc = 'CopilotChat - Quick chat' })

-- Fix rapide
vim.keymap.set('v', '<leader>fix', function()
  require("CopilotChat").ask("Fix this code", { 
    selection = select.visual,
    window = {
      layout = 'horizontal',
      width = 1.0,
      height = 0.3,
    }
  })
end, { desc = 'Fix code' })

-- Explain rapide  
vim.keymap.set('v', '<leader>cx', function()
  require("CopilotChat").ask("Explain this code", { 
    selection = select.visual,
    window = {
      layout = 'horizontal',
      width = 1.0,
      height = 0.3,
    }
  })
end, { desc = 'Explain code' })

-- Optimize rapide
vim.keymap.set('v', '<leader>co', function()
  require("CopilotChat").ask("Optimize this code", { 
    selection = select.visual,
    window = {
      layout = 'horizontal',
      width = 1.0,
      height = 0.3,
    }
  })
end, { desc = 'Optimize code' })

-- Chat général (sans sélection)
vim.keymap.set('n', '<leader>cc', function()
  require("CopilotChat").toggle({
    window = {
      layout = 'horizontal',
      width = 1.0,
      height = 0.3,
    }
  })
end, { desc = 'Toggle Copilot Chat' })

-- Raccourcis directs sans prompt
vim.keymap.set({'n', 'v'}, '<leader>cf', '<cmd>CopilotChatFix<cr>', { desc = 'CopilotChat - Fix code' })
vim.keymap.set({'n', 'v'}, '<leader>ct', '<cmd>CopilotChatTests<cr>', { desc = 'CopilotChat - Generate tests' })
vim.keymap.set({'n', 'v'}, '<leader>cd', '<cmd>CopilotChatDocs<cr>', { desc = 'CopilotChat - Generate docs' })
