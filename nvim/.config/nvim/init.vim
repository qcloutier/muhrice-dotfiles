"
" ~/.config/nvim/init.vim
"

"
" GENERAL
"

" Enable syntax highlighting
filetype indent plugin on
syntax on
colorscheme slate

" Display relative line numbers
set number
set relativenumber

" Open split panes below or on the right
set splitbelow
set splitright

" Select with mouse support
set mouse=a
vnoremap <LeftRelease> "*ygv

" Bindings for copy and paste
vnoremap <C-c> "+y
map <C-v> "+P

" Default tabs and indents to four spaces
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" Use regular tabs for makefiles
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" Delete trailing whitespace before saving
autocmd BufWritePre * %s/\s\+$//e

" Terminal settings
augroup Terminal
    au!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
noremap <C-x> :vsplit <bar> terminal<CR>

"
" PLUGINS
"

call plug#begin(stdpath('data').'/plugged')

" Deoplete for completions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" DelimitMate for pairing brackets and quotes
Plug 'Raimondi/delimitMate'

" NERDTree as a file browser
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Wintabs for buffer management
Plug 'zefei/vim-wintabs'

call plug#end()

" Deoplete settings
let g:deoplete#enable_at_startup = 1

" DelimitMate settings
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:},<:>"

" NERDTree settings
autocmd vimenter * NERDTree
map <C-f> :NERDTreeToggle<CR>
