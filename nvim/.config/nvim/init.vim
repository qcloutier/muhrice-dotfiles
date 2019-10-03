"
" ~/.config/nvim/init.vim
"

" Syntax highlighting based on filetype.
filetype plugin on
syntax on

" Colour scheme.
colo ron

" Display relative line numbers.
set number
set relativenumber

" Select with mouse support.
set mouse=a
vnoremap <LeftRelease> "*ygv

" Bindings for copy and paste.
vnoremap <C-c> "+y
map <C-v> "+P

" Default tabs and indents to four spaces.
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" Use regular tabs for certain types of files.
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" Delete trailing whitespace before saving.
autocmd BufWritePre * %s/\s\+$//e

" DelimitMate settings.
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:},<:>"
filetype indent plugin on
