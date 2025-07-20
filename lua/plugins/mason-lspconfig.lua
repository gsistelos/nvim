--- @type table<string, vim.lsp.Config>
local servers = {
	asm_lsp = {},
	bashls = {},
	biome = {},
	clangd = {},
	cssls = {},
	dockerls = {},
	docker_compose_language_service = {},
	eslint = {},
	gopls = {},
	html = {},
	pylsp = {},
	rust_analyzer = {},
	terraformls = {},
	ts_ls = {},
	lua_ls = {
		Lua = {
			diagnostics = {
				-- Disable the global variable 'vim' warning
				globals = { 'vim' },
			},
		},
	},
}

local function lsp_attach(event)
	--- @param lhs string
	--- @param rhs string | function
	--- @param desc string
	local function map(lhs, rhs, desc)
		vim.keymap.set('n', lhs, rhs, {
			buffer = event.buf,
			desc = 'LSP: ' .. desc
		})
	end

	map('gd', vim.lsp.buf.definition, 'Go to definition')

	map('<leader>r', vim.lsp.buf.rename, 'Rename')
	map('<leader>a', vim.lsp.buf.code_action, 'Code action')

	local client = vim.lsp.get_client_by_id(event.data.client_id)
	local textDocument_inlayHint = vim.lsp.protocol.Methods.textDocument_inlayHint

	if client and client:supports_method(textDocument_inlayHint, event.buf) then
		local function toggle_inlay_hints()
			local is_enabled = vim.lsp.inlay_hint.is_enabled({
				bufnr = event.buf
			})

			vim.lsp.inlay_hint.enable(not is_enabled)
		end

		map('<leader>th', toggle_inlay_hints, 'Toggle inlay hints')
	end
end

local function config()
	require('mason-lspconfig').setup({
		ensure_installed = vim.tbl_keys(servers)
	})

	for server_name, settings in pairs(servers) do
		vim.lsp.config(server_name, {
			settings = settings,
		})
	end


	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
		callback = lsp_attach,
	})
end

return {
	'mason-org/mason-lspconfig.nvim',
	dependencies = {
		{ 'mason-org/mason.nvim', opts = {} },
		'neovim/nvim-lspconfig',
	},
	config = config,
}
