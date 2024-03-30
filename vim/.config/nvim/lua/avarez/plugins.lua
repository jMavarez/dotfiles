require 'lazy'.setup {
    -- Code editing
    'github/copilot.vim',
    'tpope/vim-sleuth',                    -- Detect tabstop and shiftwidth automatically
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
        event = 'InsertEnter',
        dependencies = {
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

    -- Utils
    'echasnovski/mini.nvim',

    -- Personal Plugins
    { dir = '~/personal/adbops.nvim' },
}
