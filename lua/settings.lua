-- Show line numbers
vim.opt.number = true

-- Enable undofile
-- :help 'undofile'
vim.opt.undofile = true

-- Enable mouse
-- :help 'mouse'
vim.opt.mouse = 'a'

-- Line offset from cursor
vim.opt.scrolloff = 10

-- Highlight cursor line
-- vim.opt.cursorline = true

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
