local function on_attach(buf)
	local gitsigns = require('gitsigns')

	--- @param lhs string
	--- @param rhs string | function
	--- @param desc string
	local function map(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, {
			buffer = buf,
			desc = desc
		})
	end

	--- @param lhs string
	--- @param action string
	--- @param desc string
	local function map_nav(lhs, action, desc)
		map('n', lhs, function()
			--- @diagnostic disable-next-line
			gitsigns.nav_hunk(action)
		end, desc)
	end

	map('n', '<leader>gb', gitsigns.toggle_current_line_blame, 'Toggle line blame')
	map('n', '<leader>gd', gitsigns.preview_hunk, 'Preview hunk')

	map('n', '<leader>gs', gitsigns.stage_hunk, 'Stage/Unstage hunk')
	map('v', '<leader>gs', function()
		gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
	end, 'Stage/Unstage hunk')

	map_nav('<leader>gn', 'next', 'Jump to next hunk')
	map_nav('<leader>gp', 'prev', 'Jump to previous hunk')
end

return {
	'lewis6991/gitsigns.nvim',
	opts = {
		numhl = true, -- Highlight line number
		on_attach = on_attach,
	},
}
