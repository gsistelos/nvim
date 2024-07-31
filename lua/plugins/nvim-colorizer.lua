return {
    'norcalli/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup()
        vim.cmd.set 'termguicolors'
    end,
}
