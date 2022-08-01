"execute pathogen#infect()
syntax on
set cindent
filetype plugin on
filetype plugin indent on
set expandtab

" FIXME: only when java
set tabstop=4
set shiftwidth=4

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
set wildignore+=**/node_modules/**

inoremap <Tab> <Esc>

if filereadable(expand('~/.workvimrc'))
        source ~/.workvimrc
endif

"set termguicolors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"colorscheme gruvbox
set background=dark

" Backspace stopped working properly when
" I uninstalled Ubuntu's vim (vim-tiny?)
" and installed vim from src
" TODO: what does this actually do?
set backspace=2

set ruler

" Calculate expression in line.
" Example: line equals (w/o apostrophes)
" '   1+  1  '
" Then this macro would transform the line to (w/o apostrophes)
" '   1+  1   2'
" TODO: misc tweaking, like what key and reg to use
nnoremap == 0y$A <C-R>=<C-R>+<CR><ESC>
