syntax on
filetype indent on
filetype plugin on

" Basic stuff
set noerrorbells
set nowrap
set nu
set rnu
set encoding=utf-8
set cursorline
set showmatch
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smartindent
set smartcase
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=0
set noruler
set noshowmode
set hidden
set nohlsearch

" Git exists, who needs swap files
set nobackup
set nowb
set noswapfile

" Plugins baby!
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/sudar/vim-arduino-syntax'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'stephpy/vim-yaml'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'ThePrimeagen/vim-be-good'

call plug#end()

" Theme
let g:material_theme_style = 'darker'
colorscheme material
set termguicolors

" Airline
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 0 
let g:airline#extensions#branch#enabled = 1 
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_warning = ' ✗ ' 
let g:airline_section_y = '' 
let g:airline_section_x = '' 

" Rust
let g:rustfmt_autosave = 1

" Get me those keymaps!
let mapleader=" "

nnoremap <leader>b :NERDTreeToggle<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>

nnoremap <Leader>fg <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <Leader>ff <cmd>lua require'telescope.builtin'.find_files{}<CR>

