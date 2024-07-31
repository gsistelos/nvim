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
    'github/copilot.vim',               -- Copilot
    'tpope/vim-sleuth',                 -- Detect tabstop and shiftwidth automatically

    require('plugins.colorscheme'),     -- Colorscheme
    require('plugins.gitsigns'),        -- Git stuff
    require('plugins.harpoon'),         -- Blazingly fast
    require('plugins.lualine'),         -- Status line
    require('plugins.nvim-cmp'),        -- Autocomplete
    require('plugins.nvim-colorizer'),  -- Color highlighting
    require('plugins.nvim-lspconfig'),  -- LSP
    require('plugins.nvim-treesitter'), -- Highlighting, edit and navigate code
    require('plugins.telescope'),       -- Fuzzy finder
    require('plugins.which-key'),       -- Show keymaps
}

local opts = {}

require('lazy').setup(plugins, opts)
