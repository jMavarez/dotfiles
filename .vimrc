" Basic Settings
syntax on
color gummybears
set wrap
set number
set encoding=utf-8
set cursorline
set showmatch
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" Airline
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 0 
let g:airline#extensions#branch#enabled = 1 
let g:airline_left_sep = ' Ω '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = ' ✗ ' 
let g:airline_section_y = '' 
let g:airline_section_x = '' 
set laststatus=2

" Mapping
map <C-b> :NERDTreeToggle<CR>
map <C-h> <C-W>h
map <C-l> <C-W>l

" Pathogen
execute pathogen#infect()
call pathogen#helptags()

set noruler
set noshowmode
set hidden
