-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
-- If you are experiencing weird indenting issues, add the language to
-- the list of additional_vim_regex_highlighting and disabled languages for indent.
local disable = { 'ruby' }

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline' },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = disable,
        },
        indent = { enable = true, disable = disable },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}
