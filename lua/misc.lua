vim.cmd('command! F :lua vim.lsp.buf.format()')
vim.cmd('command! W :exec "F" | w')

vim.cmd.colorscheme('retrobox')

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
