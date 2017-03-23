function! s:toggleChecked()
  let line = getline('.')

  if match(line, "\\[ \\]") != -1
    let line = substitute(line, "\\[ \\]", "[x]", "")
  elseif match(line, "\\[x\\]") != -1
    let line = substitute(line, "\\[x\\]", "[ ]", "")
  endif

  call setline('.', line)
endfunction

nnoremap <silent> <C-Space> :call <SID>toggleChecked()<CR>
inoremap <silent> <C-Space> <C-o>:call <SID>toggleChecked()<CR>
vnoremap <silent> <C-Space> :'<,'>call <SID>toggleChecked()<CR>