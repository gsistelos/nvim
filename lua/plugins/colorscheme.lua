return {
    'rose-pine/neovim',
    priority = 9999, -- Make sure to load this before all the other start plugins
    init = function()
        vim.cmd.colorscheme 'rose-pine'
        -- Transparent background
        vim.cmd('hi normal guibg=none')
    end,
}
