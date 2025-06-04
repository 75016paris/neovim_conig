-- set space as <leader>
vim.g.mapleader = " "
-- <leader>pv show explorer / <leader>pf show the fuzzier finder
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })

-- REVERSE j & k
vim.keymap.set("n", "j", "k", { desc = "Move up" })
vim.keymap.set("n", "k", "j", { desc = "Move down" })
vim.keymap.set("v", "j", "k", { desc = "Move up" })
vim.keymap.set("v", "k", "j", { desc = "Move down" })

-- move selected block to new position (ajusté pour la nouvelle logique)
vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv")  -- J majuscule = vers le haut
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")  -- K majuscule = vers le bas

-- 
vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")  -- Join lines (pas de changement)

-- ctrl+d ctrl+u half page jumping - keep cursor in center 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search / keep the result in the center 
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- <leader>p delete the current selected + keep the old yank
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to the system clipboard (<leader>y pour copier)
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Quickfix list (ajusté pour la nouvelle logique)
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")     -- j=haut donc prev
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")     -- k=bas donc next
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz") -- j=haut donc prev
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz") -- k=bas donc next

-- Select and replace (<leader>s)
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>")

-- Make the file executable (<leader>x)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

