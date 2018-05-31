set nocompatible
let      mapleader      =  "\<Space>"
let      maplocalleader =  "\\"
runtime plugs.vim
runtime ftplugin/man.vim
let g:ft_man_folding_enable = 1

" {{{ Basic Options
" Dont ask whether to write but just do it
set autowriteall
" Yes I want permanent undo, but not in cwd...
set undofile
set undodir=/tmp,.

" Disable mouse
set mouse=

" Fancy numbers
" set number relativenumber
" Highlight current cursor line
" set cursorline
" sub-directories for find
set path+=**
" Virtual in Block mode
set virtualedit+=block
" Open the folds on jumps
set foldopen+=jump
" Initial fold level
set foldlevel=2
" Conceal if possible
set conceallevel=2
set nowrap
set visualbell

set backupdir=~/tmp,.,~/

set listchars=eol:$,tab:>-,nbsp:~,trail:-,extends:>,precedes:<
" latex rubbish
set wildignore=*.bcf,*.nav,*.run.xml,*.snm,*.aux,*.bbl,*.blg,*.fdb_latexmk,*.fls,*.out,*.synctex.gz,*.toc,node_modules
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

nnoremap <leader>fw :%s/\m,\zs\ze\S)/<Space>/eg<CR>:%s/\m\s\+$//eg<CR>
inoremap <C-U> <C-G>u<C-U>

" }}}
" {{{ Commands
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
" }}}

" Autocommands {{{
augroup vimrc_ex
  au!
  au FileType vim setlocal fdm=marker
  au FileType qf,help nnoremap <buffer> q :q!<CR>
  au FileType tex,markdown,txt,rst
        \ setlocal spell
        \ | setlocal nonumber
        \ | setlocal norelativenumber
        \ | setlocal isk+=-
          \ | call litecorrect#init()
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"zvzz" |
    \ endif
augroup END
" }}}

" Closing words {{{
if has("termguicolors")
  set termguicolors
endif
filetype plugin indent on
syntax enable
silent! colo default
set bg=dark

if filereadable(expand("~/vimrc.local"))
  source ~/vimrc.local
endif

" }}}
