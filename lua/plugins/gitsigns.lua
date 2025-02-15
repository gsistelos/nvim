return {
	-- Deep buffer integration for Git
	'lewis6991/gitsigns.nvim',
	opts = {
		signcolumn = true,
		attach_to_untracked = true,
		-- Highlight line number
		numhl = true,
		signs = {},
		on_attach = function(bufnr)
			local gitsigns = require('gitsigns')

			local function map(mode, lhs, rhs, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, lhs, rhs, opts)
			end

			map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = 'Git blame' })

			map('n', '<leader>gn', gitsigns.next_hunk, { desc = 'Git next hunk' })
			map('n', '<leader>gp', gitsigns.prev_hunk, { desc = 'Git previous hunk' })

			map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Git toggle stage hunk' })
			map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Git reset hunk' })

			map('v', '<leader>gs', function()
				gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, { desc = 'Git toggle stage hunk' })

			map('v', '<leader>gr', function()
				gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, { desc = 'Git reset hunk' })

			map('n', '<leader>gd', gitsigns.toggle_deleted, { desc = 'Git toggle deleted' })
		end,
	},
}
