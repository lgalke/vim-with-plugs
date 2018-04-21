" Markdown like bold font
inoremap <buffer> ** \textbf{}<Left>

" Custom sentence format expression
setlocal formatexpr=sentence#format()

" Autoformat
" setlocal fo+=a

setlocal textwidth=80
