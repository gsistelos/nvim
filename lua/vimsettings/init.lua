-- Line numbers
vim.cmd('set nu')

-- Tab
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')

-- Visual whitespaces
vim.cmd('set listchars=space:•,tab:__,eol:⏎')

-- Format on save
vim.cmd('autocmd BufWritePre * lua vim.lsp.buf.format()')