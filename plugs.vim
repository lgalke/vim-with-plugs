call plug#begin('~/.vim/plugged')

" tpope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vividchalk'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-jdaddy'

" AndrewRadev
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/dsf.vim'
Plug 'AndrewRadev/splitjoin.vim'

" Helpers
Plug 'Olical/vim-enmasse'


" Statusline
Plug 'vim-airline/vim-airline'

" Linter
Plug 'w0rp/ale' 

" junegunn
Plug 'junegunn/vim-easy-align'

" haya14busa
Plug 'haya14busa/vim-edgemotion'
Plug 'haya14busa/vim-auto-programming'

" FileType-specific
Plug 'lervag/vimtex'
Plug 'leafgarland/typescript-vim'


" Colors
Plug 'ap/vim-css-color'
Plug 'AlessandroYorba/Alduin'

" Misc
Plug 'tweekmonster/startuptime.vim'


call plug#end()

" Plugin Configuration {{{

let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_view_general_viewer = 'SumatraPDF'
" add cygwin path prefix /cygwin64/
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line /cygwin64/@pdf'
let g:vimtex_compiler_latexmk = {
  \ 'backend' : 'jobs',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 0,
    \ 'continuous' : 0,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-pdf',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

let g:airline#extensions#ale#enabled = 1
" let g:ale_linters = { 'typescript': ['tsserver'] }
"
function! s:latexSurround()
   let b:surround_{char2nr("e")}
     \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
   let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction
augroup plugs_ex
  au!
  au FileType tex call s:latexSurround()
  au FileType typescript setlocal fdm=syntax
augroup END

function! s:power_safe_mode(on)
  if a:on
    echom "Turning Power Safe mode ON"
    let g:ale_lint_on_text_changed = "never"
    let g:instant_markdown_slow = 1
  else
    echom "Turning Power Safe mode OFF"
    let g:ale_lint_on_text_changed = "always"
    let g:instant_markdown_slow = 0
  endif
endfunction

command! -bang PowerSafe call <SID>power_safe_mode(<bang>1)
" }}}
