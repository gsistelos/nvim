return {
    'neovim/nvim-lspconfig',
    dependencies = {
        {
            'williamboman/mason.nvim',
            opts = {},
        },
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        --  This function gets run when an LSP attaches to a particular buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function(event)
                -- Function to easily define mappings specific for LSP related items
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                local builtin = require('telescope.builtin')

                map('gd', builtin.lsp_definitions, '[g]oto [d]efinition')
                map('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
                map('gi', builtin.lsp_implementations, '[g]oto [i]mplementation')
                map('gr', builtin.lsp_references, '[g]oto [r]eferences')
                map('gt', builtin.lsp_type_definitions, '[g]oto [t]ype definition')

                map('<leader>r', vim.lsp.buf.rename, '[r]ename')

                map('<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')
                map('<leader>ds', builtin.lsp_document_symbols, '[d]ocument [s]ymbols')
                map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[w]orkspace [s]ymbols')

                -- The following code creates a keymap to toggle inlay hints in your
                -- code, if the language server you are using supports them
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                    map('<leader>th', function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                    end, '[t]oggle inlay [h]ints')
                end
            end,
        })

        -- Extend LSP capabilities with nvim cmp
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        local servers = {
            bashls = {},
            biome = {},
            clangd = {},
            cssls = {},
            eslint = {},
            gopls = {},
            html = {},
            pylsp = {},
            rust_analyzer = {},
            lua_ls = {
                settings = {
                    Lua = {
                        -- Disable the global variable 'vim' warning
                        diagnostics = { globals = { 'vim' } },
                    },
                },
            },
        }

        require('mason').setup()

        local lspconfig = require('lspconfig')

        require('mason-lspconfig').setup({
            ensure_installed = vim.tbl_keys(servers or {}),
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}

                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    lspconfig[server_name].setup(server)
                end,
            },
        })
    end,
}
