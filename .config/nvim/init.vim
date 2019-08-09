" Syntax highlighting based on filetype.
filetype plugin on
syntax on

" Display relative line numbers.
set number
set relativenumber

" Bindings for copy and paste.
vnoremap <C-c> "+y
map <C-v> "+P

" Default tabs and indents to four spaces.
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" Use regular tabs for certain types of files.
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" Delete trailing whitespace before saving.
autocmd BufWritePre * %s/\s\+$//e
