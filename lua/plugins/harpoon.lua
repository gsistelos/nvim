return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local harpoon = require('harpoon')

		harpoon:setup()

		-- Actions
		vim.keymap.set('n', '<leader>ha', function()
			harpoon:list():add()
		end, { desc = '[h]arpoon [a]dd' })

		vim.keymap.set('n', '<leader>hs', function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = '[h]arpoon [s]how' })

		-- Navigation
		vim.keymap.set('n', '<leader>h1', function()
			harpoon:list():select(1)
		end, { desc = '[h]arpoon select [1]' })

		vim.keymap.set('n', '<leader>h2', function()
			harpoon:list():select(2)
		end, { desc = '[h]arpoon select [2]' })

		vim.keymap.set('n', '<leader>h3', function()
			harpoon:list():select(3)
		end, { desc = '[h]arpoon select [3]' })

		vim.keymap.set('n', '<leader>h4', function()
			harpoon:list():select(4)
		end, { desc = '[h]arpoon select [4]' })
	end,
}
