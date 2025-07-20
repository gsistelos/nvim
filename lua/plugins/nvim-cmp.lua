local function config()
	local cmp = require('cmp')

	local mapping = {
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),

		['<C-c>'] = cmp.mapping.abort(),
		['<C-a>'] = cmp.mapping.confirm({ select = true }),

		-- Manually trigger a completion from nvim-cmp
		['<C-s>'] = cmp.mapping.complete(),
	}

	local sources = {
		{ name = 'nvim_lsp' },
		{ name = 'path' },
	}

	cmp.setup({
		mapping = mapping,
		sources = sources,
	})
end

return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
	},
	config = config,
}
