function! sentence#format()
  " At most one sentence per line (but could be less)
  " Sentence regexp derived from `:help sentence`
  execute v:lnum .','.(v:lnum + v:count - 1) . 'substitute/\m[.!?][])"'']\{-}\zs\s\+/\r/g'
endfunction
