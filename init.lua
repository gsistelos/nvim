local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('github/copilot.vim')
Plug('vim-airline/vim-airline')

-- Theme
Plug('dracula/vim')

-- Git diff
Plug('airblade/vim-gitgutter')

-- Fuzzy finder dependencies
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})

-- Fuzzy finder
Plug('nvim-telescope/telescope.nvim')

-- Language parser; Syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- LSP support
Plug('neovim/nvim-lspconfig')

-- LSP server manager
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

-- LSP completion
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

-- LSP snippets
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

vim.call('plug#end')

-- Keymaps
require('keymaps')

-- Vim settings
vim.cmd('set nu')

vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')
