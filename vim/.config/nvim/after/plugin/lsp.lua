-- Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementations')
        map('<leader>rn', function() vim.lsp.buf.rename() end, '[R]e[N]ame')
        map('<leader>df', function() vim.lsp.buf.format() end, '[D]o [F]ormat')
        map('K', function() vim.lsp.buf.hover() end, 'Hover documentation')
    end
})

-- Language Servers
local servers = {
    clangd = {},
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    },
    kotlin_language_server = {},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

require 'mason'.setup {}

local ensure_installed = vim.tbl_keys(servers or {})

require 'mason-tool-installer'.setup { ensure_installed = ensure_installed }
require 'mason-lspconfig'.setup {
    handlers = {
        function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
        end,
    },
}
local cmp = require 'cmp'
cmp.setup {
    completion = { completeopt = 'menu,menuone,noinsert' },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-p>'] = cmp.mapping.select_prev_item {},
        ['<C-n>'] = cmp.mapping.select_next_item {},
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {},
    },
    snippets = {},
}

-- local cmp = require('cmp')
-- local cmp_mappings = {
--     ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
--     ['<C-n>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
--     ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--     ['<C-Space>'] = cmp.mapping.complete(),
-- }
--
-- cmp.setup({
--     sources = {
--         { name = 'nvim_lsp' },
--     },
--     mapping = cmp_mappings,
--     snippets = {},
-- })
--