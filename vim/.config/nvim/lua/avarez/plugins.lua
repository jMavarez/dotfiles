require 'lazy'.setup {
    -- Code editing
    -- 'github/copilot.vim',
    'tpope/vim-sleuth',                           -- Detect tabstop and shiftwidth automatically
    { 'numToStr/Comment.nvim',       opts = {} }, -- Comment visual regions/lines

    -- Fuzzy Finder (files, etc)
    {
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { -- If encountering errors, see telescope-fzf-native README for installation instructions
                'nvim-telescope/telescope-fzf-native.nvim',

                -- `build` is used to run some command when the plugin is installed/updated.
                -- This is only run then, not every time Neovim starts up.
                build = 'make',

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
        },
    },
    'theprimeagen/harpoon',
    {
        "kndndrj/nvim-dbee",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        build = function()
            -- Install tries to automatically detect the install method.
            -- if it fails, try calling it with one of these parameters:
            --    "curl", "wget", "bitsadmin", "go"
            require("dbee").install()
        end,
        config = function()
            require("dbee").setup( --[[optional config]])
        end,
    },

    -- LSP Configuration & Plugins
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for Neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            -- Useful status updates for LSP.
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', opts = {} },

            -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
            -- used for completion, annotations and signatures of Neovim apis
            { 'folke/neodev.nvim', opts = {} },
        },
    },
    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                    -- Build Step is needed for regex support in snippets.
                    -- This step is not supported in many windows environments.
                    -- Remove the below condition to re-enable on windows.
                    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                        return
                    end
                    return 'make install_jsregexp'
                end)()
            },
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
        }
    },
    { -- Highlight, edit, annavigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },


    -- Visuals
    'lewis6991/gitsigns.nvim',
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false }
    },

    -- Colorschemes
    {
        'folke/tokyonight.nvim',
        priority = 1000,
    },
    {
        'pgdouyon/vim-yin-yang',
        priority = 1000,
    },
    {
        'yunlingz/equinusocio-material.vim',
        priority = 1000,
    },
    {
        'dzfrias/noir.nvim',
        priority = 1000,
    },
    {
        'projekt0n/caret.nvim',
        priority = 1000,
    },
    {
        'axvr/photon.vim',
        priority = 1000,
    },
    {
        'jaredgorski/fogbell.vim',
        priority = 1000,
    },
    {
        'elianiva/gitgud.nvim',
        priority = 1000,
    },

    -- Utils
    'echasnovski/mini.nvim',

    -- Personal Plugins
    { dir = '~/personal/adbops.nvim' },
}
