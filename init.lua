-- Set lazy.nvim path
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Ensure lazy.nvim is installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'

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

-- Load opts
require('opts')
-- Load misc
require('misc')

-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
	-- Automatically import all plugins from 'plugins' directory
	spec = { import = 'plugins' },
	-- Check for plugin updates when opening Neovim
	checker = { enabled = true },
})

-- Load keymaps
require('keymaps')
