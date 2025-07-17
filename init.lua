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

-- Colorscheme
vim.cmd.colorscheme("unokai")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

local plugins = {
	{ -- Status line
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {},
	},
	{ -- Indentation guides, even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = { scope = { enabled = false } },
	},
	{ -- Syntax highlighting, edit and indent
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		-- Install parsers with :TSInstall <language>
	},
	{ -- configures LuaLS for editing Neovim config
		'folke/lazydev.nvim',
		ft = 'lua',
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
			},
		},
	},

	require('plugins.gitsigns'), -- Git stuff
	require('plugins.nvim-cmp'), -- Autocomplete
	require('plugins.nvim-lspconfig'), -- LSP
	require('plugins.telescope'), -- Fuzzy finder
	require('plugins.which-key'), -- Keybindings
}

require('lazy').setup({
	spec = plugins,
	checker = { enabled = true },
})
