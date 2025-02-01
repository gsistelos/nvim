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
	'github/copilot.vim',

	{
		'lewis6991/gitsigns.nvim', -- Git stuff
		opts = {},
	},
	{
		'nvim-lualine/lualine.nvim', -- Status line
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {},
	},
	{
		'tanvirtin/monokai.nvim', -- Colorscheme
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
	{
		'folke/which-key.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		event = 'VeryLazy',
		opts = {
			spec = {
				{ '<leader>f', group = 'Find' },
				{ '<leader>t', group = 'Toggle' },
			},
		},
	},
	{
		'nvim-treesitter/nvim-treesitter', -- Syntax highlighting, edit and indent
		build = ':TSUpdate',
	},

	require('plugins.nvim-cmp'), -- Autocomplete
	require('plugins.nvim-lspconfig'), -- LSP
	require('plugins.telescope'), -- Fuzzy finder
}

require('lazy').setup({
	spec = plugins,
	checker = { enabled = true },
})
