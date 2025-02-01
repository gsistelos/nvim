-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Open vim's builtin file explorer: `Netrw`
vim.keymap.set('n', '<C-e>', '<cmd>Explore<CR>', { desc = 'Explore' })

-- Toggle visual whitespaces
vim.keymap.set('n', '<leader>tw', '<cmd>set list!<CR>', { desc = 'Toggle whitespaces' })
