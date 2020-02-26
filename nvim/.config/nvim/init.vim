"
" ~/.config/nvim/init.vim
"

" Basic stuff
filetype indent plugin on
syntax on
set number relativenumber
set splitbelow splitright
set mouse=a
map <C-c> "+y
map <C-v> "+P
autocmd BufWritePre * %s/\s\+$//e

" Install vim-plug if not present
if empty(glob(system('printf $HOME').'/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data').'/plugged')

" Syntastic for syntax checking
Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Deoplete for completions
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/neco-syntax'
"let g:deoplete#enable_at_startup = 1

" Neosnippet for snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" DelimitMate for pairing brackets and quotes
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1

" IndentLine to display indentation
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '▏'
let g:indentLine_color_term = 0

" Sleuth to keep indentation consistent
Plug 'tpope/vim-sleuth'
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set listchars=tab:▏\  list

" NERDTree as a file browser
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
autocmd vimenter * NERDTree
map <C-f> :NERDTreeToggle<CR>

" Wintabs for buffer management
Plug 'zefei/vim-wintabs'
map <C-t>h <Plug>(wintabs_previous)
map <C-t>l <Plug>(wintabs_next)
map <C-t>c <Plug>(wintabs_close)
map <C-t>u <Plug>(wintabs_undo)
set hidden

" Airline as a statusbar
Plug 'vim-airline/vim-airline'

" Wal to use terminal colours as colourscheme
Plug 'dylanaraps/wal.vim'

" Vimtex for LaTeX support
Plug 'lervag/vimtex'
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'qpdfview'
map <C-b> :VimtexCompileSS<CR>

call plug#end()

" Apply a nice colourscheme
colorscheme wal
hi Normal ctermbg=NONE ctermfg=7
hi VertSplit ctermbg=0 ctermfg=0
hi TabLine ctermbg=NONE ctermfg=0
hi TabLineFill ctermbg=NONE ctermfg=0
