"
" ~/.config/nvim/init.vim
"

" Some sensible defaults
filetype indent plugin on
syntax on
set mouse=a
set number relativenumber
set splitbelow splitright

" Typical system clipboard keybinds
map <C-c> "+y
map <C-v> "+p

" Use tabs at the margin
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set listchars=tab:▏\  list

" Hide the borders on splits
set stl=\  fcs=stl:\ ,stlnc:\ ,vert:\ "

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Install vim-plug if not present
if empty(glob(system('printf $HOME').'/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Activate plugins
call plug#begin(stdpath('data').'/plugged')
Plug 'cohama/lexima.vim'
Plug 'dylanaraps/wal.vim'
Plug 'lervag/vimtex'
Plug 'ludovicchabant/vim-gutentags'
Plug 'moll/vim-bbye'
Plug 'neomake/neomake'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'vim-airline/vim-airline'
Plug 'yami-beta/asyncomplete-omni.vim'
call plug#end()

" Set a nice colourscheme
colorscheme wal
hi NonText cterm=NONE ctermbg=NONE ctermfg=8
hi Split cterm=NONE ctermbg=NONE ctermfg=8
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=8

" List buffers on the tabline
let g:airline#extensions#tabline#enabled=1
set hidden

" Easily switch buffers
map <silent> <C-h> :bprevious<CR>
map <silent> <C-l> :bnext<CR>
map <silent> <C-q> :Bdelete<CR>

" Toggle the nerdtree
map <silent> <C-x> :NERDTreeToggle<CR>

" Automatically do syntax checks
call neomake#configure#automake('nrw', 500)

" Enable a completion engine
set omnifunc=syntaxcomplete#Complete
call asyncomplete#register_source(
	\ asyncomplete#sources#omni#get_source_options({
		\ 'name': 'omni',
		\ 'whitelist': ['*'],
		\ 'blacklist': [],
		\ 'completor': function('asyncomplete#sources#omni#completor')
	\ })
\ )

" Typical completion keybinds
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"

" Comfy LaTeX editing
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='zathura'
