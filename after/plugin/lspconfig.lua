require('mason').setup()

local servers = { 'lua_ls', 'bashls', 'clangd', 'tsserver' }

require('mason-lspconfig').setup({
    ensure_installed = servers
})

require('cmp').setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'luasnip' },
        { name = 'luasnip_choice' }
    }
})

local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({ capabilities = capabilities })
end
