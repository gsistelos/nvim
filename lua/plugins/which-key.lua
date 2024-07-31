return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
        require('which-key').add({
            { '<leader>c', group = '[c]ode' },
            { '<leader>d', group = '[d]ocument' },
            { '<leader>f', group = '[f]ind' },
            { '<leader>w', group = '[w]orkspace' },
            { '<leader>t', group = '[t]oggle' },
        })
    end,
}
