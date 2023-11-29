-- Set lazy.nvim path
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Ensure lazy.nvim is installed
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- Latest stable release
        lazypath
    })
end

-- Add lazy.nvim to runtimepath
vim.opt.rtp:prepend(lazypath)

-- Plugins
local plugins = {
    'dracula/vim', -- Dracula theme
    'github/copilot.vim', -- Copilot
    'lewis6991/gitsigns.nvim', -- Git signs
    'williamboman/mason.nvim', -- Package manager
    'williamboman/mason-lspconfig.nvim', -- Mason and LSP bridge
    'neovim/nvim-lspconfig', -- LSP
    {
        'nvim-lualine/lualine.nvim', -- Status line
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'stevearc/oil.nvim', -- File explorer
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'nvim-treesitter/nvim-treesitter', -- Syntax highlighting
        build = ':TSUpdate'
    },
    {
        'nvim-telescope/telescope.nvim', -- Fuzzy finder
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make'
            }
        }
    },
    {
        'hrsh7th/nvim-cmp', -- Autocompletion
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip', -- Snippets
            'saadparwaiz1/cmp_luasnip'
        }
    }
}

local opts = { }

require("lazy").setup(plugins, opts)

-- Keymaps
require('keymaps')

-- Vim settings
require('vimsettings')

-- Colors
require('colors')
