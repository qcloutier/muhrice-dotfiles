"
" ~/.config/nvim/init.vim
"

"
" GENERAL
"

" Enable syntax highlighting
filetype indent plugin on
syntax on

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

" Toggle a terminal
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(width)
    if win_gotoid(g:term_win)
        hide
    else
        botright vnew
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction
augroup Terminal
    au!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
nnoremap <C-x> :call TermToggle(20)<CR>

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

" Airline as a statusbar
Plug 'vim-airline/vim-airline'

" Better colourscheme using terminal colours
Plug 'dylanaraps/wal.vim'

call plug#end()

" Deoplete settings
let g:deoplete#enable_at_startup = 1

" DelimitMate settings
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:},<:>"

" NERDTree settings
autocmd vimenter * NERDTree
map <C-f> :NERDTreeToggle<CR>

" Wal settings
colorscheme wal
