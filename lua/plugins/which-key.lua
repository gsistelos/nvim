return {
	'folke/which-key.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = 'VeryLazy',
	opts = {
		spec = {
			{ '<leader>g', group = 'Git' },
			{ '<leader>f', group = 'Find' },
			{ '<leader>t', group = 'Toggle' },
		},
	},
}
