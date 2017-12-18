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
set nowrap sidescroll=5
set undofile
set undodir=$TEMP,$TMP,.
set listchars=eol:$,tab:>-,nbsp:~,trail:-,extends:>,precedes:<
" latex rubbish
set wildignore=*.bcf,*.nav,*.run.xml,*.snm,*.latexmain,*.aux,*.bbl,*.blg,*.log,*.fdb_latexmk,*.fls,*.out,*.synctex.gz,*.toc
" }}}

" Map {{{
nmap     Q              gq
inoremap <c-c>          <Esc>
nnoremap <c-g>          :nohlsearch<CR><C-G>
let      mapleader      =  "\<Space>"
let      maplocalleader =  "\\"
map      H              ^
map      L              $
map      <c-j>          <Plug>(edgemotion-j)
map      <c-k>          <Plug>(edgemotion-k)
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
nnoremap <a             :SidewaysLeft<cr>
nnoremap >a             :SidewaysRight<cr>
omap     aa             <Plug>SidewaysArgumentTextobjA
xmap     aa             <Plug>SidewaysArgumentTextobjA
omap     ia             <Plug>SidewaysArgumentTextobjI
xmap     ia             <Plug>SidewaysArgumentTextobjI
nmap     <leader>af     <Plug>(ale_fix)
nmap     <leader>an     <Plug>(ale_next_wrap)
nmap     <leader>ap     <Plug>(ale_previous_wrap)
nmap     <leader>gs     :Gstatus<CR>
nmap     <leader>gp     :Gpush<CR>


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
