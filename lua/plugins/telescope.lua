return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable('make') == 1
			end,
		},
		'nvim-telescope/telescope-ui-select.nvim',
	},
	config = function()
		local telescope = require('telescope')

		telescope.setup({
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(telescope.load_extension, 'fzf')
		pcall(telescope.load_extension, 'ui-select')

		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find by grep' })
		vim.keymap.set('n', '<leader>fp', builtin.oldfiles, { desc = 'Find previous files' })
		vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find diagnostics' })
	end,
}
