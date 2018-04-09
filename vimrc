set nocompatible
let      mapleader      =  "\<Space>"
let      maplocalleader =  "\\"
runtime plugs.vim
runtime ftplugin/man.vim

" {{{ Basic Options

set number relativenumber
set cursorline
set autowriteall
" sub-directories for find
set path+=**
" Virtual in Block mode
set virtualedit+=block
" Open the folds on jumps
set foldopen+=jump
set conceallevel=2
set nowrap
" Undo config
set undofile
set undodir=$TEMP,$TMP,.
set listchars=eol:$,tab:>-,nbsp:~,trail:-,extends:>,precedes:<
" latex rubbish
set wildignore=*.bcf,*.nav,*.run.xml,*.snm,*.aux,*.bbl,*.blg,*.fdb_latexmk,*.fls,*.out,*.synctex.gz,*.toc
" Always show tabline
set showtabline=2
set guioptions-=e
" Search and Replace
set incsearch hlsearch
set ignorecase smartcase

let g:markdown_fenced_languages = ["sh", "python", "sql", "vim"]
" }}}

" Map {{{
nmap     Q              gq
nnoremap <C-s>          :w<CR>
inoremap <c-c>          <Esc>
map      H              ^
map      L              $
xmap     <              <gv
xmap     >              >gv
nnoremap <leader>f      :find<Space>
nnoremap <leader>v      :e $MYVIMRC<CR>
nnoremap <leader>b      :ls<CR>:b<Space>
" Text objects

nnoremap <leader>fw :%s/\m,\zs\ze\S)/<Space>/eg<CR>:%s/\m\s\+$//eg<CR>

" }}}
" {{{ Functions
" }}}

" Autocommands {{{
augroup vimrc_ex
  au!
  au FileType vim setlocal fdm=marker
  au FileType qf,help nnoremap <buffer> q :q!<CR>
  au FileType sql setlocal fdm=syntax
  au FileType tex,markdown,txt,rst
        \ setlocal spell
        \ | setlocal nonumber
        \ | setlocal norelativenumber
        \ | setlocal isk+=-
        \ | call litecorrect#init()
  au FileType python setlocal fdm=indent
augroup END
" }}}

" Closing words {{{
if has("termguicolors")
  set termguicolors
endif
filetype plugin indent on
syntax enable
" Cycle through colors
let g:alduin_Shout_Fire_Breath = 1
" let g:alduin_Shout_Aura_Whisper = 1
silent! colo murphy

if filereadable(expand("~/vimrc.local"))
  source ~/vimrc.local
endif

" }}}
