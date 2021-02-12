" Some sensible defaults
filetype indent plugin on
syntax on
set mouse=a
set number relativenumber
set splitbelow splitright

" Typical system clipboard keybinds
map <C-c> "+y
map <C-v> "+p

" Use tabs at the margin by default
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set listchars=tab:▏\  list

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" No line numbers in terminal
autocmd TermOpen * setlocal nonumber norelativenumber

" Install vim-plug if not present
if empty(glob(system('printf $HOME').'/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data').'/plugged')

" Vimscript
Plug 'chrisbra/csv.vim'
Plug 'cohama/lexima.vim'
Plug 'dylanaraps/wal.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
Plug 'moll/vim-bbye'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vifm/vifm.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'

" Lua
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'steelsojka/completion-buffers'

call plug#end()

" Match the terminal colourscheme
colorscheme wal
highlight Comment gui=italic

" Fancy tabline and statusline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_left_sep=""
let g:airline_left_alt_sep=''
let g:airline_right_sep=""
let g:airline_right_alt_sep=''
set hidden

" Easily manage buffers
map <silent><c-t>h :bprevious<cr>
map <silent><c-t>l :bnext<cr>
map <silent><c-t>x :Bdelete<cr>

" File explorer
map <silent><leader>f :Vifm<cr>

" Fuzzy finder
map <silent><leader>s :Files<cr>
map <silent><leader>r :Rg<cr>

" Comfy LaTeX editing
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='zathura'

" Auto generate PDFs from R Markdown
autocmd BufNewFile,BufFilePre,BufRead *.Rmd,*.rmd set filetype=rmarkdown
autocmd BufWritePost *.Rmd,*.rmd :RMarkdown pdf

" Auto completion for LSP and buffers
autocmd BufEnter * lua require'completion'.on_attach()
set completeopt=menuone,noinsert,noselect
set shortmess+=c
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

lua <<EOF

-- Tree sitters, requires a C compiler
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "c", "css", "go", "html", "java",
    "javascript", "json", "lua", "python", "yaml",
  },
  highlight = { enable = true },
  indent    = { enable = true },
}

-- Language servers, must be manually installed
require'lspconfig'.bashls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.pyls.setup{}
require'lspconfig'.rome.setup{}
require'lspconfig'.texlab.setup{}

EOF
