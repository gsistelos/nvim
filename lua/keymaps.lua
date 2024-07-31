-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>e', ':Ex<CR>', { desc = '[e]xplore' })

-- Toggle visual whitespaces
vim.keymap.set('n', '<leader>tl', ':set list!<CR>', { desc = '[t]oggle [l]ist' })
