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
    'rose-pine/neovim',                    -- Colorscheme
    'github/copilot.vim',                  -- Copilot
    'lewis6991/gitsigns.nvim',             -- Git signs
    'norcalli/nvim-colorizer.lua',         -- Color highlighting
    'neovim/nvim-lspconfig',               -- LSP
    'nvim-lua/plenary.nvim',               -- Dependency library
    'nvim-lualine/lualine.nvim',           -- Status line
    'nvim-tree/nvim-web-devicons',         -- Icons
    'williamboman/mason.nvim',             -- Package manager
    'williamboman/mason-lspconfig.nvim',   -- Mason and LSP bridge
    {
        'nvim-treesitter/nvim-treesitter', -- Syntax highlighting
        build = ':TSUpdate'
    },
    {
        'nvim-telescope/telescope.nvim', -- Fuzzy finder
        dependencies = {
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make'
            }
        }
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2'
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

local opts = {}

vim.g.mapleader = ' '

require('lazy').setup(plugins, opts)

-- Keymaps
require('keymaps')

-- Vim settings
require('vimsettings')

-- Colors
require('colors')
