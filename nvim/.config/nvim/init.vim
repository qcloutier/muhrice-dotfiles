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

" Hide buffers without saving
set hidden

" Mouse support
set mouse=a

" Bindings for copy and paste
vnoremap <C-c> "+y
map <C-v> "+P

" Default tabs and indents to two spaces
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Use regular tabs for makefiles
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" Delete trailing whitespace before saving
autocmd BufWritePre * %s/\s\+$//e

"
" PLUGINS
"

" Install vim-plug if not present
if empty(glob(system('printf $HOME').'/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data').'/plugged')

" Syntastic for syntax checking
Plug 'vim-syntastic/syntastic'

" Deoplete for completions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'

" Neosnippet for snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" DelimitMate for pairing brackets and quotes
Plug 'Raimondi/delimitMate'

" NERDTree as a file browser
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Wintabs for buffer management
Plug 'zefei/vim-wintabs'

" Airline as a statusbar
Plug 'vim-airline/vim-airline'

" Wal to use terminal colours as colourscheme
Plug 'dylanaraps/wal.vim'

" Vimtex for LaTeX support
Plug 'lervag/vimtex'

call plug#end()

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Deoplete settings
let g:deoplete#enable_at_startup = 1

" DelimitMate settings
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:},<:>"

" NERDTree settings
autocmd vimenter * NERDTree
map <C-f> :NERDTreeToggle<CR>

" Wintabs settings
map <C-t>h <Plug>(wintabs_previous)
map <C-t>l <Plug>(wintabs_next)
map <C-t>c <Plug>(wintabs_close)
map <C-t>u <Plug>(wintabs_undo)

" Wal settings
colorscheme wal
hi Normal ctermbg=NONE ctermfg=7
hi VertSplit ctermbg=0 ctermfg=0
hi TabLine ctermbg=NONE ctermfg=0
hi TabLineFill ctermbg=NONE ctermfg=0

" Vimtex settings
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'qpdfview'
map <C-b> :VimtexCompileSS<CR>
