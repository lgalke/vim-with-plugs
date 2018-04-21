function! sentence#format()
  " Called due to textwidth, use default format
  " At most one sentence per line (but could be less)
  " Sentence regexp derived from `:help sentence`
  if mode() =~# '[iR]' | return -1 | endif
  let l:save_cursor = getcurpos()
  " execute v:lnum .','.(v:lnum + v:count - 1) . 'smagic/[.!?][])"'']\{-}\zs\s\+/\r/g'
  execute v:lnum . 'smagic/[.!?][])"'']\{-}\zs\s\+/\r/eg ' . v:count
  call setpos('.', save_cursor)
endfunction
