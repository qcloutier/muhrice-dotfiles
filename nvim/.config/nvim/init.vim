" General
filetype indent plugin on
set listchars=tab:▏\  list
set mouse=a
set number relativenumber
set signcolumn=number
set splitbelow splitright
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
syntax on

" Plugins
if empty(glob(stdpath('data').'/site/autoload/plug.vim'))
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin(stdpath('data').'/plugged')
Plug 'chrisbra/csv.vim'
Plug 'cohama/lexima.vim'
Plug 'dylanaraps/wal.vim'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
Plug 'moll/vim-bbye'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'towolf/vim-helm'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vifm/vifm.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'ziglang/zig.vim'
call plug#end()

" Autocmds
autocmd BufNewFile,BufFilePre,BufRead *.Rmd,*.rmd set filetype=rmarkdown
autocmd BufWritePost *.Rmd,*.rmd :RMarkdown pdf
autocmd BufWritePre * %s/\s\+$//e
autocmd FileType yaml setl indentkeys-=<:>
autocmd TermOpen * setlocal nonumber norelativenumber

" Commands
command! -nargs=0 CocFormat :call CocAction('format')
command! -nargs=0 CocOrganize :call CocAction('runCommand', 'editor.action.organizeImport')

" Keybinds
map <c-c> "+y
map <c-v> "+p
map <leader>cr <Plug>(coc-rename)
map <silent><c-t>h :bprevious<cr>
map <silent><c-t>l :bnext<cr>
map <silent><c-t>x :Bdelete<cr>
map <silent><leader>fb :Buffers<cr>
map <silent><leader>ff :Files<cr>
map <silent><leader>fr :Rg<cr>
map <silent><leader>v :Vifm<cr>
map [g <Plug>(coc-diagnostic-prev)
map ]g <Plug>(coc-diagnostic-next)
map gd <Plug>(coc-definition)
map gi <Plug>(coc-implementation)
map gr <Plug>(coc-references)
map gy <Plug>(coc-type-definition)

" Language servers
let g:coc_global_extensions = [
  \'coc-clangd',
  \'coc-go',
  \'coc-java',
  \'coc-json',
  \'coc-marketplace',
  \'coc-pyls',
  \'coc-sh',
  \'coc-texlab',
  \'coc-tsserver',
  \'coc-yaml'
\]

" Tab completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
inoremap <silent><expr><tab>
  \ pumvisible() ? "\<c-n>" :
  \ <sid>check_back_space() ? "\<tab>" :
  \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"

" Miscellaneous
colorscheme wal
highlight Comment gui=italic
let g:airline#extensions#tabline#enabled=1
let g:airline_left_alt_sep=''
let g:airline_left_sep=""
let g:airline_powerline_fonts=1
let g:airline_right_alt_sep=''
let g:airline_right_sep=""
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='zathura'
set hidden
