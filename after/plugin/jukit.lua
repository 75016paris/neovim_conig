local handle = io.popen("pyenv which ipython 2>/dev/null")
local ipython_path = handle:read("*a"):gsub("%s+", "")
handle:close()

if ipython_path and ipython_path ~= "" then
    vim.g.jukit_shell_cmd = ipython_path
else
    vim.g.jukit_shell_cmd = 'ipython'  -- fallback
end

-- Initialisation complète des variables Jukit (après la détection IPython)
vim.g.jukit_output_title = 'Output'
vim.g.jukit_outhist_title = 'Out History'  
vim.g.jukit_hist_title = 'History'
vim.g.jukit_terminal_title = 'Terminal'
vim.g.jukit_split_height = 0.3
vim.g.jukit_split_width = 0.5

-- Configuration vim-jukit complète
-- vim.g.jukit_shell_cmd = '/Users/pr/.pyenv/versions/lewagon/bin/ipython'
vim.g.jukit_terminal = 'kitty'

-- Options de base
vim.g.jukit_auto_output_hist = 0
vim.g.jukit_use_tcomment = 0
vim.g.jukit_comment_mark = '#'
vim.g.jukit_mappings = 1
vim.g.jukit_mappings_ext_enabled = {'py', 'ipynb'}

-- Gestion des conversions
vim.g.jukit_notebook_viewer = 'jupyter-notebook'
vim.g.jukit_convert_overwrite_default = 1  -- Toujours écraser
vim.g.jukit_convert_open_default = 0       -- Ne pas ouvrir automatiquement
vim.g.jukit_file_encodings = 'utf-8'

-- Configuration de l'affichage
vim.g.jukit_highlight_markers = 1
vim.g.jukit_enable_textcell_bg_hl = 1
vim.g.jukit_enable_textcell_syntax = 1

-- Configuration matplotlib pour Kitty
vim.g.jukit_inline_plotting = 1
vim.g.jukit_mpl_block = 1
vim.g.jukit_savefig_dpi = 150

-- Sauvegarde des outputs
vim.g.jukit_save_output = 1
vim.g.jukit_show_prompt = 0

-- Layout des splits
vim.g.jukit_layout = {
    split = 'horizontal',
    p1 = 0.7,
    val = {
        'file_content',
        {
            split = 'vertical',
            p1 = 0.7,
            val = {'output', 'output_history'}
        }
    }
}

-- === KEYMAPS ===

-- Gestion des splits
vim.keymap.set('n', '<leader>os', '<cmd>call jukit#splits#output()<cr>', { desc = 'Open output split' })
vim.keymap.set('n', '<leader>ts', '<cmd>call jukit#splits#term()<cr>', { desc = 'Open terminal split' })
vim.keymap.set('n', '<leader>hs', '<cmd>call jukit#splits#history()<cr>', { desc = 'Open history split' })
vim.keymap.set('n', '<leader>ohs', '<cmd>call jukit#splits#output_and_history()<cr>', { desc = 'Open output and history' })

-- Fermeture des splits
vim.keymap.set('n', '<leader>hd', '<cmd>call jukit#splits#close_history()<cr>', { desc = 'Close history' })
vim.keymap.set('n', '<leader>od', '<cmd>call jukit#splits#close_output_split()<cr>', { desc = 'Close output' })
vim.keymap.set('n', '<leader>ohd', '<cmd>call jukit#splits#close_output_and_history(1)<cr>', { desc = 'Close output and history' })

-- Navigation dans l'historique
vim.keymap.set('n', '<leader>so', '<cmd>call jukit#splits#show_last_cell_output(1)<cr>', { desc = 'Show cell output' })
vim.keymap.set('n', '<leader>j', '<cmd>call jukit#splits#out_hist_scroll(1)<cr>', { desc = 'Scroll down history' })
vim.keymap.set('n', '<leader>k', '<cmd>call jukit#splits#out_hist_scroll(0)<cr>', { desc = 'Scroll up history' })

-- Envoi de code
vim.keymap.set('n', '<leader><space>', '<cmd>call jukit#send#section(0)<cr>', { desc = 'Send current cell' })
vim.keymap.set('n', '<cr>', '<cmd>call jukit#send#line()<cr>', { desc = 'Send current line' })
vim.keymap.set('v', '<cr>', ':<C-U>call jukit#send#selection()<cr>', { desc = 'Send selection' })
vim.keymap.set('n', '<leader>cc', '<cmd>call jukit#send#until_current_section()<cr>', { desc = 'Send until current cell' })
vim.keymap.set('n', '<leader>all', '<cmd>call jukit#send#all()<cr>', { desc = 'Send all cells' })

-- Gestion des cellules
vim.keymap.set('n', '<leader>co', '<cmd>call jukit#cells#create_below(0)<cr>', { desc = 'Create code cell below' })
vim.keymap.set('n', '<leader>cO', '<cmd>call jukit#cells#create_above(0)<cr>', { desc = 'Create code cell above' })
vim.keymap.set('n', '<leader>ct', '<cmd>call jukit#cells#create_below(1)<cr>', { desc = 'Create text cell below' })
vim.keymap.set('n', '<leader>cT', '<cmd>call jukit#cells#create_above(1)<cr>', { desc = 'Create text cell above' })
vim.keymap.set('n', '<leader>cd', '<cmd>call jukit#cells#delete()<cr>', { desc = 'Delete cell' })
vim.keymap.set('n', '<leader>cs', '<cmd>call jukit#cells#split()<cr>', { desc = 'Split cell' })
vim.keymap.set('n', '<leader>cM', '<cmd>call jukit#cells#merge_above()<cr>', { desc = 'Merge with cell above' })
vim.keymap.set('n', '<leader>cm', '<cmd>call jukit#cells#merge_below()<cr>', { desc = 'Merge with cell below' })

-- Déplacement des cellules
vim.keymap.set('n', '<leader>ck', '<cmd>call jukit#cells#move_up()<cr>', { desc = 'Move cell up' })
vim.keymap.set('n', '<leader>cj', '<cmd>call jukit#cells#move_down()<cr>', { desc = 'Move cell down' })
vim.keymap.set('n', '<leader>J', '<cmd>call jukit#cells#jump_to_next_cell()<cr>', { desc = 'Jump to next cell' })
vim.keymap.set('n', '<leader>K', '<cmd>call jukit#cells#jump_to_previous_cell()<cr>', { desc = 'Jump to previous cell' })

-- Gestion des outputs
vim.keymap.set('n', '<leader>ddo', '<cmd>call jukit#cells#delete_outputs(0)<cr>', { desc = 'Delete current cell output' })
vim.keymap.set('n', '<leader>dda', '<cmd>call jukit#cells#delete_outputs(1)<cr>', { desc = 'Delete all outputs' })

-- Conversion
vim.keymap.set('n', '<leader>np', '<cmd>call jukit#convert#notebook_convert("jupyter-notebook")<cr>', { desc = 'Convert py/ipynb' })

-- Kernel Restart <leader>rk
vim.keymap.set('n', '<leader>rk', function()
  -- Fermer individuellement
  vim.cmd('call jukit#splits#close_output_split()')
  vim.cmd('call jukit#splits#close_history()')
  vim.fn.system('sleep 2')  -- Plus de temps
  vim.cmd('call jukit#splits#output()')
  -- Pas de history automatique, vous l'ouvrez manuellement si besoin
end, { desc = 'Restart kernel' })


-- Détection automatique du socket Kitty actuel
local function get_kitty_socket()
    local handle = io.popen("ls -t /tmp/kitty_* 2>/dev/null | head -1")
    local socket_path = handle:read("*a"):gsub("%s+", "")
    handle:close()
    return socket_path
end

-- Configuration du socket
local kitty_socket = get_kitty_socket()
if kitty_socket and kitty_socket ~= "" then
    vim.g.jukit_kitty_socket = kitty_socket
end
