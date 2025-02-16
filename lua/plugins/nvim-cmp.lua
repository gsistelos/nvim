return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
	},
	config = function()
		local cmp = require('cmp')

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-p>'] = cmp.mapping.select_prev_item(),

				['<C-c>'] = cmp.mapping.abort(),
				['<C-a>'] = cmp.mapping.confirm({ select = true }),

				-- Manually trigger a completion from nvim-cmp
				['<C-s>'] = cmp.mapping.complete(),
			}),
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'path' },
			},
		})
	end,
}
