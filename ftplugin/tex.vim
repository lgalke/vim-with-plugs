" Markdown like bold font
inoremap <buffer> ** \textbf{}<Left>

" Custom sentence format expression
setlocal formatexpr=sentence#format()
nnoremap <buffer> Q vipJgqq

" Autoformat
" setlocal fo+=a

setlocal textwidth=80

function! s:DeleteAllComments() range
  let l:save = winsaveview() " Save cursor position
  " First: Remove full comment lines completely (to retain formatting)
  global/\m^\s*%.*$/delete
  " Second: Remove trailing comments (but dont match literal \%)
  %smagic/[^\\]\zs%.*//eI
  " Third: Join multiple blank lines to one (aesthetics)
  %smagic/\(\n\s*\)\{3,}/\r\r/eI
  call winrestview(l:save) " Restore cursor position
endfunction

command! -buffer -nargs=0 DeleteAllComments :call <SID>DeleteAllComments()
