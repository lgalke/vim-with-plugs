function! sentence#format()
  " Called due to textwidth, use default format
  " At most one sentence per line (but could be less)
  " Sentence regexp derived from `:help sentence`

  " If formatexpr is called due to autoformat or textwidth, do nothing.
  if mode() =~# '[iR]' | return -1 | endif

  " TODO FIXME should not format comments...

  let l:save_cursor = getcurpos()
  execute v:lnum . 'smagic/[.!?][])"'']\{-}\zs\s\+/\r/eg ' . v:count
  call setpos('.', save_cursor)
endfunction
