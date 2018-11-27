" Either '.vim' on unix or 'vimfiles' on windows.
let s:vimdir = fnamemodify(expand('$MYVIMRC'), ':h:t')

call plug#begin('~/' . s:vimdir . '/plugged')

" tpope 
" Sensible defaults
Plug 'tpope/vim-sensible'
" The surround map
Plug 'tpope/vim-surround'
" Repeating more operations via dot (.)
Plug 'tpope/vim-repeat'

" Operator-pending commenting via gc
Plug 'tpope/vim-commentary'

" JSON formatting
Plug 'tpope/vim-jdaddy'

" Project-wide configs, alternate files and so on
Plug 'tpope/vim-projectionist'

" Provides `SudoWrite` and `SudoEdit`
Plug 'tpope/vim-eunuch'

" Encoding info for char under cursor
Plug 'tpope/vim-characterize'

" Make and dispatch builds
Plug 'tpope/vim-dispatch'
nnoremap <leader>m :Make<CR>
nnoremap <leader>d :Dispatch<CR>

" Some scripting utilities such as zS to find highlighting group
Plug 'tpope/vim-scriptease'


" Basic git integration
Plug 'tpope/vim-fugitive'
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gm :Gmerge<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gw :Gwrite<CR>

" Provides `GBrowse` for Github
Plug 'tpope/vim-rhubarb'
nnoremap <leader>gb :Gbrowse<CR>
" Extension for gitlab
Plug 'shumphrey/fugitive-gitlab.vim'
let g:fugitive_gitlab_domains = ['https://git.kd.informatik.uni-kiel.de', 'https://git.informatik.uni-kiel.de', 'https://gitlab.com']

Plug 'junegunn/gv.vim'
" Guess shiftwidth and other file-specific options
Plug 'tpope/vim-sleuth'
" Short-hand to toggle some options such as `con` to `set number!`
Plug 'tpope/vim-unimpaired'
" Maps - and provides some improvements over netrw
Plug 'tpope/vim-vinegar'
" Read-line interface within command mode
Plug 'tpope/vim-rsi'
" Auto-close some blocks
Plug 'tpope/vim-endwise'
" Adjust dates with <C-A> and <C-X>
Plug 'tpope/vim-speeddating'

" Auto closing tags via <C-X>/
Plug 'tpope/vim-ragtag'
" Maps recommended by ragtag
inoremap <M-o> <Esc>o
inoremap <C-j> <Down>
let g:ragtag_global_maps = 1

" Provides `Subvert` and `Abolish`
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-jdaddy'

" Database connection
Plug 'tpope/vim-dadbod'
" 

" Statusline 
" Plug 'sunaku/vim-modusline'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" " This absolutely kills opening mildly large (150MB) csv files.
" " Fix:
" let g:airline#extensions#whitespace#enabled = 0
" 

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

" 

" File movement 
" CtrlP maps <C-P> (of course)
" Plug 'ctrlpvim/ctrlp.vim'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


" Try fzf once again, since junegunns plugins are neat
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-P> :FZF<CR>
" Ferret maps <leader>s
Plug 'wincent/ferret'
" Editing within quickfix
Plug 'Olical/vim-enmasse'

" 

" Movement 
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

" Snippets 
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jvanja/vim-bootstrap4-snippets'

let g:UltiSnipsExpandTrigger = "<c-l>"
let g:UltiSnipsListSnippets = "<c-k><c-l>"
"

" Writing
Plug 'reedes/vim-wordy'
" Use Abolish instead
" Plug 'reedes/vim-litecorrect'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
Plug 'lgalke/vim-ernest'

" Raises errors in some colorscheme
" autocmd! User GoyoEnter ALEDisable | Limelight
" autocmd! User GoyoLeave Limelight! | ALEEnable

" 

" Folding 
Plug 'Konfekt/FastFold'
"

" Python {{{
" Omnicompletion
Plug 'davidhalter/jedi-vim'
" No auto-start on dot input
let g:jedi#completions_enabled = 0
" Leave preview window open
let g:jedi#auto_close_doc = 0
" Do not auto-insert import stuff
let g:jedi#smart_auto_mappings = 0

" Folding
" Try coiled snake over simpylfold
Plug 'kalekundert/vim-coiled-snake'
" Plug 'tmhedberg/SimpylFold'
" Indent
Plug 'Vimjas/vim-python-pep8-indent'
" }}}


" Pandoc 
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#biblio#use_bibtool = 1
let g:pandoc#completion#bib#mode = "citeproc"
" 

" Linting 
Plug 'w0rp/ale' 
let g:ale_echo_msg_format = '[%linter%/%severity%] %...code...%: %s'
let g:ale_linters = { 'python': ['pyls', 'pylint'], 'text': ['writegood', 'proselint']}
let g:ale_fixers = { 'markdown': [ 'remove_trailing_lines', 'trim_whitespace' ] }
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>an :ALENextWrap<CR>
nnoremap <leader>ap :ALEPrevWrap<CR>
nnoremap <leader>ai :ALEInfo<CR>
" 

" Align 
Plug 'godlygeek/Tabular'
" 

" TODO remove?
Plug 'haya14busa/vim-auto-programming'
set completefunc=autoprogramming#complete

" Latex 
Plug 'lervag/vimtex'
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_format_enabled = 0
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
" Surround map recommended by vimtex
function! s:latexSurround()
   let b:surround_{char2nr("e")}
     \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
   let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction
augroup plugs_ex
  au!
  au FileType tex call s:latexSurround()
augroup END

"
"  Typescript 

" Syntax
Plug 'leafgarland/typescript-vim'
" Omnicompletion
Plug 'Quramy/tsuquyomi'
" 


" Colors {{{
Plug 'tpope/vim-vividchalk'
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
Plug 'AlessandroYorba/Alduin'
Plug 'junegunn/seoul256.vim'
Plug 'reedes/vim-colors-pencil'

" Highlight css colors always
Plug 'ap/vim-css-color'

" Plain monotone
Plug 'Lokaltog/vim-monotone'
Plug 'fxn/vim-monochrome'
"  }}}

" Misc 
Plug 'mhinz/vim-signify'
Plug 'tweekmonster/startuptime.vim'
" 

" Organizing {{{
Plug 'freitass/todo.txt-vim'
Plug 'lgalke/gather-todo.txt-vim'

Plug 'vimwiki/vimwiki'
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_folding = 'expr'
augroup vimwiki_autocommands
  au!
  au BufRead *diary.wiki VimwikiDiaryGenerateLinks
augroup END

" }}}

call plug#end()



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
silent PowerSafe
