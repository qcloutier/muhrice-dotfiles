"
" ~/.config/nvim/init.vim
"

" Basic stuff
filetype indent plugin on
set omnifunc=syntaxcomplete#Complete
syntax on
set number relativenumber
set splitbelow splitright
map <C-j> :wincmd w<CR>
map <C-k> :wincmd p<CR>
map <C-q> :wincmd c<CR>
map <C-c> "+y
map <C-v> "+P
set mouse=a
autocmd BufWritePre * %s/\s\+$//e

" Install vim-plug if not present
if empty(glob(system('printf $HOME').'/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Activate plugins
call plug#begin(stdpath('data').'/plugged')
Plug 'dylanaraps/wal.vim'
Plug 'ervandew/supertab'
Plug 'lervag/vimtex'
Plug 'neomake/neomake'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'vim-airline/vim-airline'
call plug#end()

" Colourscheme tweaks
colorscheme wal
hi Split cterm=NONE ctermbg=NONE ctermfg=8
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=8

" LaTeX settings
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'zathura'
map <C-b> :VimtexCompileSS<CR>

" Check syntax on reads and writes
call neomake#configure#automake('rw')

" Automatically expand blocks
let delimitMate_expand_cr = 1

" Popout file browser
map <C-f> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree

" Use tabs at the margin
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set listchars=tab:▏\  list

" Enable a fancy tabline
let g:airline#extensions#tabline#enabled = 1
map <C-h> :bp<CR>
map <C-l> :bn<CR>
map <C-d> :bd<CR>
set hidden
