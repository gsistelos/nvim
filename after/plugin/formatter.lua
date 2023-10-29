local clang_format = {
	exe = 'clang-format',
	args = {
		"--assume-filename",
		vim.api.nvim_buf_get_name(0),
		"--style=Google"
	},
	stdin = true,
}

require('formatter').setup({
	logging = true,

	filetype = {
		c = { clang_format },
		cpp = {	clang_format },
	}
})
