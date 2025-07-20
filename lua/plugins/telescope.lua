local function config()
	local telescope = require('telescope')

	telescope.setup({})
	telescope.load_extension('fzf')

	--- @param lhs string
	--- @param rhs string | function
	--- @param desc string
	local function map(lhs, rhs, desc)
		vim.keymap.set('n', lhs, rhs, { desc = desc })
	end

	local builtin = require('telescope.builtin')

	map('<leader>ff', builtin.find_files, 'Find files')
	map('<leader>fg', builtin.live_grep, 'Find by grep')
	map('<leader>fp', builtin.oldfiles, 'Find previous files')
	map('<leader>fd', builtin.diagnostics, 'Find diagnostics')

	map('<leader>gr', builtin.lsp_definitions, 'Go to definitions')
	map('<leader>gr', builtin.lsp_references, 'Go to references')
end

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
	config = config,
}
