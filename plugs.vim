call plug#begin('~/.vim/plugged')

" tpope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vividchalk'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
nnoremap <leader>m :Make<CR>
nnoremap <leader>d :Dispatch<CR>
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-fugitive'
nnoremap <leader>gb :Gbrowse<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gm :Gmerge<CR>
nnoremap <leader>gp :Gpush<CR>
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
nnoremap <a :SidewaysLeft<cr>
nnoremap >a :SidewaysRight<cr>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI


Plug 'AndrewRadev/dsf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'

" Movement
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

" Helpers
Plug 'Olical/vim-enmasse'

" Statusline
Plug 'vim-airline/vim-airline'

" Python
Plug 'Vimjas/vim-python-pep8-indent'

" Prose
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-litecorrect'

" Typescript
Plug 'leafgarland/typescript-vim'

" Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#biblio#use_bibtool = 1
let g:pandoc#completion#bib#mode = "citeproc"

" Linter
Plug 'w0rp/ale' 
let g:ale_echo_msg_format = '[%linter%/%severity%] %code: %%s'
let g:ale_linters = { 'python' : ['flake8','pylint']}
let g:ale_fixers = { 'markdown' : [ 'remove_trailing_lines', 'trim_whitespace' ] }
" Ale in Airline
let g:airline#extensions#ale#enabled = 1
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" junegunn
Plug 'junegunn/vim-easy-align'

" haya14busa
Plug 'haya14busa/vim-edgemotion'
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)


Plug 'haya14busa/vim-auto-programming'
set completefunc=autoprogramming#complete

" FileType-specific
Plug 'lervag/vimtex'
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_format_enabled = 1
" Should move to local
" let g:vimtex_view_general_viewer = 'SumatraPDF'
" " add cygwin path prefix /cygwin64/
" let g:vimtex_view_general_options
"     \ = '-reuse-instance -forward-search @tex @line /cygwin64/@pdf'
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



" Colors
Plug 'ap/vim-css-color'
Plug 'AlessandroYorba/Alduin'
Plug 'morhetz/gruvbox'

" Testing
Plug 'kannokanno/previm'
let g:previm_open_cmd = 'xdg-open'

" Misc
Plug 'tweekmonster/startuptime.vim'


call plug#end()

" Plugin Configuration {{{





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
    echom "Turning Power Safe mode: ON"
    let g:ale_lint_on_text_changed = "never"
  else
    echom "Turning Power Safe mode: OFF"
    let g:ale_lint_on_text_changed = "always"
  endif
endfunction
command! -bang PowerSafe call <SID>power_safe_mode(<bang>1) | doautoall BufReadPost,BufEnter
" silent PowerSafe
" }}}
