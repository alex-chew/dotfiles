function! s:toggleLineCheckbox()
  let line = getline('.')

  if match(line, '\[ \] \| \[x\]') != -1
    let line = substitute(line, '\(\[ \]\|\[x\]\)\s*', '', "")
  elseif match(line, '^\s*[-*+]') != -1
    let line = substitute(line, '\([-*+]\)\s*', '\1 [ ] ', "")
  else
    let line = substitute(line, '^\s*', '- [ ] ', "")
  endif

  call setline('.', line)
endfunction

function! s:toggleChecked()
  let line = getline('.')

  if match(line, "\\[ \\]") != -1
    let line = substitute(line, "\\[ \\]", "[x]", "")
  elseif match(line, "\\[x\\]") != -1
    let line = substitute(line, "\\[x\\]", "[ ]", "")
  endif

  call setline('.', line)
endfunction

nnoremap <silent> <leader>c :call <SID>toggleLineCheckbox()<CR>
inoremap <silent> <leader>c <C-o>:call <SID>toggleLineCheckbox()<CR>
vnoremap <silent> <leader>c :'<,'>call <SID>toggleLineCheckbox()<CR>

nnoremap <silent> <C-Space> :call <SID>toggleChecked()<CR>
inoremap <silent> <C-Space> <C-o>:call <SID>toggleChecked()<CR>
vnoremap <silent> <C-Space> :'<,'>call <SID>toggleChecked()<CR>
