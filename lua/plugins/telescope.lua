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
	},
	config = function()
		local telescope = require('telescope')

		telescope.setup()
		telescope.load_extension('fzf')

		local map = function(keys, func, desc)
			vim.keymap.set('n', keys, func, { desc = desc })
		end

		local builtin = require('telescope.builtin')

		map('<leader>ff', builtin.find_files, 'Find files')
		map('<leader>fg', builtin.live_grep, 'Find by grep')
		map('<leader>fp', builtin.oldfiles, 'Find previous files')
		map('<leader>fd', builtin.diagnostics, 'Find diagnostics')
	end,
}
