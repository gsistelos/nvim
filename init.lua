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
    'github/copilot.vim', -- Copilot
    'tpope/vim-sleuth',   -- Detect tabstop and shiftwidth automatically

    {
        'lukas-reineke/indent-blankline.nvim', -- Indent lines
        main = 'ibl',
        opts = {},
    },
    {
        'nvim-lualine/lualine.nvim', -- Status line
        opts = {},
    },
    {
        'rose-pine/neovim', -- Colorscheme
        priority = 9999,    -- Make sure to load this before all the other start plugins
        init = function()
            vim.cmd.colorscheme('rose-pine')
        end,
    },
    {
        'norcalli/nvim-colorizer.lua', -- Color highlighting
        init = function()
            vim.cmd.set('termguicolors')
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter', -- Syntax highlighting, edit and indent
        build = ':TSUpdate',
    },
    {
        'folke/todo-comments.nvim', -- Comments highlighting
        opts = {},
    },

    require('plugins.gitsigns'),       -- Git stuff
    require('plugins.harpoon'),        -- Blazingly fast
    require('plugins.nvim-cmp'),       -- Autocomplete
    require('plugins.nvim-lspconfig'), -- LSP
    require('plugins.telescope'),      -- Fuzzy finder
    require('plugins.which-key'),      -- Show keymaps
}

local opts = {}

require('lazy').setup(plugins, opts)
