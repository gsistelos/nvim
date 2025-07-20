local function init()
	vim.cmd.colorscheme('gruvbox')
end

return {
	'ellisonleao/gruvbox.nvim',
	-- Load before all other plugins
	lazy = false,
	priority = 1000,
	init = init,
}
