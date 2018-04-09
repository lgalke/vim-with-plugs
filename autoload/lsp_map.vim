function! lsp_map#init()
  nnoremap <buffer> gd :LspDefinition<CR>
  setlocal keywordprg=:LspHover
  setlocal omnifunc=lsp#complete
endfunction


