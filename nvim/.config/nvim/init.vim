"
" ~/.config/nvim/init.vim
"

" Basic stuff
filetype indent plugin on
syntax on
set mouse=a
set number relativenumber
set splitbelow splitright

" Some useful mappings
map <silent> <C-h> :bp<CR>
map <silent> <C-l> :bn<CR>
map <silent> <C-c> :bd<CR>
map <C-y> "+y
map <C-p> "+P

" Use tabs at the margin
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set listchars=tab:▏\  list

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Make netrw into a fancy sidebar
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 20
let g:NetrwIsOpen=0
function! ToggleNetrw()
	if g:NetrwIsOpen
		let i = bufnr("$")
		while (i >= 1)
			if (getbufvar(i, "&filetype") == "netrw")
				silent exe "bwipeout " . i
			endif
			let i-=1
		endwhile
		let g:NetrwIsOpen=0
	else
		let g:NetrwIsOpen=1
		silent Lexplore
	endif
endfunction
map <silent> <C-x> :call ToggleNetrw()<CR>
autocmd BufEnter * silent! lcd %:p:h

" Install vim-plug if not present
if empty(glob(system('printf $HOME').'/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Activate plugins
call plug#begin(stdpath('data').'/plugged')
Plug 'dylanaraps/wal.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'vim-airline/vim-airline'
call plug#end()

" Colourscheme tweaks
colorscheme wal
hi Split cterm=NONE ctermbg=NONE ctermfg=0
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=0

" LaTeX settings
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'zathura'

" Check syntax
call neomake#configure#automake('nrw', 500)

" Suggest completions
let g:apc_enable_ft = {'*':1}
let g:apc_min_length = 3
set completeopt=menu,menuone,noselect
set cpt=.,k,w,b
set shortmess+=c

let g:airline#extensions#tabline#enabled = 1
set hidden
