require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'javascript' },
    sync_install = false,
    auto_install = false, -- Install new parsers with :TSInstall
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
})
