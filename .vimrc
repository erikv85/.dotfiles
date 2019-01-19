syntax on
set cindent
filetype plugin on
filetype plugin indent on
"set tabstop=4
"set shiftwidth=4
set expandtab

inoremap ö {
inoremap ä }
imap Ö [
imap Ä ]

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set number
set relativenumber

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

inoremap ( ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap [ []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

set clipboard=unnamedplus

highlight ColorColumn ctermbg=gray
set colorcolumn=101

set nowrap

" no banner in netrw
let g:netrw_banner = 0
" open files from netrw in previous window
let g:netrw_browse_split = 4
let g:netrw_winsize = 10

set path+=**

if filereadable(expand('~/.workvimrc'))
        source ~/.workvimrc
endif
