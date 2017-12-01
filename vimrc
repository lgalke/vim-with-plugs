set nocompatible
source ~/.vim/plugs.vim

runtime ftplugin/man.vim

" {{{ Basic Options

set autowriteall
set completefunc=autoprogramming#complete
" sub-directories for find
set path+=**
set virtualedit+=block
set foldopen+=jump
set conceallevel=2
set ignorecase smartcase
set undofile
set undodir=$TEMP,.
" latex rubbish
set wildignore=*.bcf,*.nav,*.run.xml,*.snm,*.latexmain,*.aux,*.bbl,*.blg,*.log,*.fdb_latexmk,*.fls,*.out,*.synctex.gz,*.toc

" }}}
" Map {{{
"
nnoremap <c-g>          :nohlsearch<CR><C-G>
let      mapleader      =  "\<Space>"
let      maplocalleader =  "\\"
map      H              ^
map      L              $
map      <c-j>          <Plug>(edgemotion-j)
map      <c-k>          <Plug>(edgemotion-k)
nnoremap <c-h>          :SidewaysLeft<cr>
nnoremap <c-l>          :SidewaysRight<cr>
xmap     <              <gv
xmap     >              >gv
nnoremap <leader>f      :find<Space>
nnoremap <leader>v      :e $MYVIMRC<CR>
nnoremap <leader>b      :ls<CR>:b<Space>
xmap     ga             <Plug>(EasyAlign)
nmap     ga             <Plug>(EasyAlign)
nnoremap <F9>           :Dispatch<CR>
nnoremap s              :w<CR>
" Text objects
omap     aa             <Plug>SidewaysArgumentTextobjA
xmap     aa             <Plug>SidewaysArgumentTextobjA
omap     ia             <Plug>SidewaysArgumentTextobjI
xmap     ia             <Plug>SidewaysArgumentTextobjI
inoremap <C-C>          <Esc>

" }}}
" {{{ Functions
" }}}

" Autocommands {{{
augroup vimrc_ex
  au!
  au FileType vim setlocal fdm=marker
  au FileType qf,help nnoremap <buffer> q :q!<CR>
augroup END
" }}}

" Closing words {{{
set termguicolors
filetype plugin indent on
syntax enable
" Cycle through colors
let g:alduin_Contract_Vampirism = 1
let g:alduin_Shout_Fire_Breath = 1
let g:alduin_Shout_Aura_Whisper = 0
silent! colo alduin
" }}}
