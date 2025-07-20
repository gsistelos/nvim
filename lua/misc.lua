vim.cmd('command! F :lua vim.lsp.buf.format()')
vim.cmd('command! W :exec "F" | w')

--- @param lhs string
--- @param rhs string | function
--- @param desc string
local function map(lhs, rhs, desc)
	vim.keymap.set('v', lhs, rhs, { desc = desc })
end

map('<', '<gv', 'Indent left and reselect')
map('>', '>gv', 'Indent right and reselect')

--- @param pattern string | string[]
--- @param filetype string
local function set_filetype(pattern, filetype)
	vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
		group = vim.api.nvim_create_augroup('set-filetype', { clear = true }),
		pattern = pattern,
		command = 'set filetype=' .. filetype,
	})
end

set_filetype({
	'docker-compose.yml',
	'docker-compose.yaml',
}, 'yaml.docker-compose')
