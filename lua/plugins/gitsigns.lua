return {
	-- Deep buffer integration for Git
	'lewis6991/gitsigns.nvim',
	opts = {
		signcolumn = true,
		numhl = true, -- Highlight line number
		on_attach = function(buf)
			local gitsigns = require('gitsigns')

			-- Local function to create keymaps
			local map = function(mode, keys, func, desc)
				vim.keymap.set(mode, keys, func, {
					buffer = buf,
					desc = desc
				})
			end

			map('n', '<leader>gb', gitsigns.toggle_current_line_blame, 'Toggle line blame')

			map('n', '<leader>gn', function()
				gitsigns.nav_hunk('next')
			end, 'Jump to next hunk')

			map('n', '<leader>gp', function()
				gitsigns.nav_hunk('prev')
			end, 'Jump to previous hunk')

			map('n', '<leader>gs', gitsigns.stage_hunk, 'Stage/Unstage hunk')
			map('n', '<leader>gr', gitsigns.reset_hunk, 'Reset hunk')

			map('v', '<leader>gs', function()
				gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, 'Stage/Unstage hunk')

			map('v', '<leader>gr', function()
				gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, 'Reset hunk')

			map('n', '<leader>gd', gitsigns.preview_hunk, 'Preview hunk')
		end,
	},
}
