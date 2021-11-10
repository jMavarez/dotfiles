set path+=**

" Ignore files
set wildignore+=**/.git/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*

" Plugins!
call plug#begin('~/.vim/plugged')

" Visuals
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Telescope stuff
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Tree Sitter stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP stuff
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

call plug#end()

" Setting theme here because of lsp's highlight... -,-
let g:material_theme_style = 'darker'
colorscheme material

lua require("avarez")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } } 

let loaded_martchparen=1
