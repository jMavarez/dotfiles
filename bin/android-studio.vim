set visualbell 
set noerrorbells 
set number
set relativenumber
set incsearch
set showmode

let mapleader = " "

# Navigation
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

# LSP
nnoremap <leader>ff :call FindUsages()<CR>
nnoremap <leader>fu :action FindUsages<CR>
nnoremap <leader>ga :action GotoAction<CR>
nnoremap <leader>gd :action GotoDeclaration<CR>
nnoremap <leader>gi :action GotoImplementation<CR>
nnoremap <leader>gs :action GotoSuperMethod<CR>

# Code editting
nnoremap <leader>/ :action CommentByLineComment<CR>
vnoremap <leader>/ :action CommentByLineComment<CR>
nnoremap <leader>pr :action RenameElement<CR>
nnoremap <leader>pf :action ReformatCode<CR>
vnoremap <leader>pf :action ReformatCode<CR>

