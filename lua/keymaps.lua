--- @param lhs string
--- @param rhs string | function
--- @param desc string
local function map(lhs, rhs, desc)
	vim.keymap.set('n', lhs, rhs, { desc = desc })
end

map('<Esc>', '<cmd>nohlsearch<CR>', 'Disable highlight')

map('<leader>e', '<cmd>Explore<CR>', 'Explore (Netrw)')
map('<leader>tw', '<cmd>set list!<CR>', 'Toggle visual whitespaces')

map('J', vim.diagnostic.open_float, 'Show diagnostic')
