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
		vim.keymap.set('n', '<leader>1', function()
			harpoon:list():select(1)
		end, { desc = 'harpoon select [1]' })

		vim.keymap.set('n', '<leader>2', function()
			harpoon:list():select(2)
		end, { desc = 'harpoon select [2]' })

		vim.keymap.set('n', '<leader>3', function()
			harpoon:list():select(3)
		end, { desc = 'harpoon select [3]' })

		vim.keymap.set('n', '<leader>4', function()
			harpoon:list():select(4)
		end, { desc = 'harpoon select [4]' })
	end,
}
