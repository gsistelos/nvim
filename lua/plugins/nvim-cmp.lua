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
			completion = { completeopt = 'menu,menuone,noinsert' },
			mapping = cmp.mapping.preset.insert({
				-- [p]revious
				['<C-p>'] = cmp.mapping.select_prev_item(),
				-- [n]ext
				['<C-n>'] = cmp.mapping.select_next_item(),

				-- [b]ack
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				-- [f]orward
				['<C-f>'] = cmp.mapping.scroll_docs(4),

				-- [c]ancel
				['<C-c>'] = cmp.mapping.abort(),
				-- [a]ccept
				['<C-a>'] = cmp.mapping.confirm({ select = true }),

				-- Manually trigger a completion from nvim-cmp
				-- [s]how
				['<C-s>'] = cmp.mapping.complete(),
			}),
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'path' },
			},
		})
	end,
}
