-- Show line numbers
vim.opt.number = true

vim.opt.tabstop = 4

-- Enable undofile
-- :help 'undofile'
vim.opt.undofile = true

-- Enable mouse
-- :help 'mouse'
vim.opt.mouse = 'a'

-- Line offset from cursor
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 15

-- Disable line wrap
vim.opt.wrap = false

-- Highlight cursor line
vim.opt.cursorline = true

-- Show column at 100th position
vim.opt.colorcolumn = "100"

-- Visual whitespaces
vim.opt.listchars = { tab = '» ', space = '·' }

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

-- Format with :F
vim.cmd('command! F :lua vim.lsp.buf.format()')

-- Format and save with :W
vim.cmd('command! W :exec "F" | w')
