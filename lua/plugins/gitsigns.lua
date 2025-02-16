return {
	-- Deep buffer integration for Git
	'lewis6991/gitsigns.nvim',
	opts = {
		signcolumn = true,
		attach_to_untracked = true,
		-- Highlight line number
		numhl = true,
		on_attach = function(buf)
			local gitsigns = require('gitsigns')

			local map = function(mode, keys, func, desc)
				vim.keymap.set(mode, keys, func, {
					buffer = buf,
					desc = desc
				})
			end

			map('n', '<leader>gb', gitsigns.toggle_current_line_blame, 'Git blame')

			map('n', '<leader>gn', gitsigns.next_hunk, 'Git next hunk')
			map('n', '<leader>gp', gitsigns.prev_hunk, 'Git previous hunk')

			map('n', '<leader>gs', gitsigns.stage_hunk, 'Git toggle stage hunk')
			map('n', '<leader>gr', gitsigns.reset_hunk, 'Git reset hunk')

			map('v', '<leader>gs', function()
				gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, 'Git toggle stage hunk')

			map('v', '<leader>gr', function()
				gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, 'Git reset hunk')

			map('n', '<leader>gS', gitsigns.stage_buffer, 'Git stage buffer')

			map('n', '<leader>gd', gitsigns.toggle_deleted, 'Git toggle deleted')
		end,
	},
}
