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

Plug 'chrisbra/csv.vim'
Plug 'cohama/lexima.vim'
Plug 'dylanaraps/wal.vim'
Plug 'junegunn/goyo.vim'
Plug 'moll/vim-bbye'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'

Plug 'lervag/vimtex'
Plug 'mattn/vim-lsp-settings'
Plug 'mcchrish/nnn.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'tpope/vim-fugitive'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'

call plug#end()

" Set a nice colourscheme
colorscheme wal
hi NonText   cterm=NONE ctermbg=NONE ctermfg=8
hi Split     cterm=NONE ctermbg=NONE ctermfg=8
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=8

" Make LSP inline text less ugly
hi link LspErrorText       Debug
hi link LspHintText        Debug
hi link LspInformationText Debug
hi link LspWarningText     Debug
hi link LspErrorHighlight       Underlined
hi link LspHintHighlight        Underlined
hi link LspInformationHighlight Underlined
hi link LspWarningHighlight     Underlined

" List buffers on the tabline
let g:airline#extensions#tabline#enabled=1
set hidden

" Easily switch buffers
map <silent> <C-j> :bprevious<CR>
map <silent> <C-k> :bnext<CR>
map <silent> <C-x> :Bdelete<CR>

" Comfy LaTeX editing
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='zathura'

" Auto generate PDFs from R Markdown
autocmd BufNewFile,BufFilePre,BufRead *.Rmd,*.rmd set filetype=rmarkdown
autocmd BufWritePost *.Rmd,*.rmd :RMarkdown pdf

" Quickly open a file browser
let g:nnn#layout = { 'window': { 'width': 0.4, 'height': 0.6, 'highlight': 'Comment' } }
map <silent> <C-q> :NnnPicker<CR>

" Typical completion keybinds
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Workaround a conflict between asyncomplete and lexima
let g:lexima_no_default_rules = 1
call lexima#set_default_rules()
call lexima#insmode#map_hook('before', '<CR>', '')
function! s:cr_glue() abort
	return pumvisible() ? asyncomplete#close_popup()."\<CR>" : lexima#expand('<CR>', 'i')
endfunction
inoremap <silent> <CR> <C-r>=<SID>cr_glue()<CR>
