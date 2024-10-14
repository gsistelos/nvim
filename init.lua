require('settings')
require('keymaps')

-- Set lazy.nvim path
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Ensure lazy.nvim is installed
if not vim.uv.fs_stat(lazypath) then
	local out = vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- Latest stable release
		lazypath
	})
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end

-- Add lazy.nvim to runtimepath
vim.opt.rtp:prepend(lazypath)

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
		'rose-pine/neovim', -- Colorscheme
		priority = 9999, -- Make sure to load this before all the other start plugins
		init = function()
			vim.cmd.colorscheme('rose-pine')
			-- Transparent background
			vim.cmd('hi normal guibg=none')
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter', -- Syntax highlighting, edit and indent
		build = ':TSUpdate',
	},

	require('plugins.harpoon'),     -- Blazingly fast
	require('plugins.nvim-cmp'),    -- Autocomplete
	require('plugins.nvim-lspconfig'), -- LSP
	require('plugins.telescope'),   -- Fuzzy finder
}

local opts = {}

require('lazy').setup(plugins, opts)
