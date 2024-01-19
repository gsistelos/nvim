-- Line numbers
vim.cmd('set nu')

-- Tab
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')

-- Visual whitespaces
vim.cmd('set listchars=space:•,tab:__,eol:⏎')

-- Format on save with :W
vim.cmd('command! Format :lua vim.lsp.buf.format()')
vim.cmd('command! W :exec "Format" | w')
