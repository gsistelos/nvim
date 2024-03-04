vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>e', ':E<CR>')
vim.keymap.set('n', '<leader>t', ':set list!<CR>')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
