-- Visuals
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.colorcolumn = '100'

-- Format
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 15
vim.opt.wrap = false

-- Misc
vim.opt.mouse = 'a'
vim.opt.undofile = true
vim.opt.listchars = { tab = '» ', space = '·' }
vim.opt.showmode = false

-- Yank to clipboard
vim.opt.clipboard:append('unnamedplus')

-- Use virtual text for diagnostics
vim.diagnostic.config({
	virtual_text = true,
})
