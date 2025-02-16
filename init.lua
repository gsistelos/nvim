-- Set lazy.nvim path
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Ensure lazy.nvim is installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim'

	-- Clone lazy.nvim
	local out = vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--branch=stable',
		lazyrepo,
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		-- Display a pretty error message
		vim.api.nvim_echo({
			{ 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
			{ out,                            'WarningMsg' },
			{ '\nPress any key to exit...' },
		}, true, {})

		-- Wait for user input before exit
		vim.fn.getchar()
		os.exit(1)
	end
end

-- Add lazy.nvim to runtimepath
vim.opt.rtp:prepend(lazypath)

require('settings')
require('keymaps')

local plugins = {
	{ -- Colorscheme
		'tanvirtin/monokai.nvim',
		-- Make sure to load before all the other start plugins
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd('colorscheme monokai')
			-- Transparent background
			vim.cmd('hi Normal guibg=none')
			vim.cmd('hi LineNr guibg=none')
			vim.cmd('hi SignColumn guibg=none')
		end,
	},
	{ -- Status line
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {},
	},
	{ -- Syntax highlighting, edit and indent
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		-- Install parsers with :TSInstall <language>
	},

	require('plugins.which-key'), -- Keybindings
	require('plugins.gitsigns'), -- Git stuff
	require('plugins.nvim-cmp'), -- Autocomplete
	require('plugins.nvim-lspconfig'), -- LSP
	require('plugins.telescope'), -- Fuzzy finder
}

require('lazy').setup({
	spec = plugins,
	checker = { enabled = true },
})
