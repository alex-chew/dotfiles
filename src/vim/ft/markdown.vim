" If called on a single header line (starts with #), increments/decrements
" header level (if dec is zero/nonzero). Otherwise, defers to regular
" indentation behavior.
function! s:headerInc(dec) range
  let line = getline(a:firstline)
  if a:firstline != a:lastline || match(line, '^\s*#') == -1
    execute a:firstline . ',' . a:lastline . (a:dec ? '<' : '>')
  else
    let line = a:dec
          \ ? substitute(line, '^\s*\zs##', '#', "")
          \ : substitute(line, '^\s*\zs#', '##', "")
    call setline('.', line)
  endif

  " Go to start of first line, to match >/>> range behavior
  call cursor(a:firstline, 0)
  normal! ^
endfunction

function! s:toggleLineCheckbox()
  let line = getline('.')

  if match(line, '\[ \] \| \[x\]') != -1
    let line = substitute(line, '\(\[ \]\|\[x\]\)\s*', '', "")
  elseif match(line, '^\s*[-*+]') != -1
    let line = substitute(line, '\([-*+]\)\s*', '\1 [ ] ', "")
  else
    let line = substitute(line, '^\s*\zs', '- [ ] ', "")
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

" 1. Autolink without angle brackets.
" 2. Autolink with angle brackets.
" 3. Inline link.
let s:linkRegex =
      \ '<\@<!https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z0-9][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*'.'\|'.
      \ '\\\@<!<\ze[a-z][a-z0-9,.-]\{1,22}:\/\/[^> ]*>'.'\|'.
      \ '\[.\+\](.\+)'
function! s:searchLink(backward)
  let searchflags = 'sw' . (a:backward ? 'b' : '')
  call search(s:linkRegex, searchflags)
endfunction

nnoremap <silent> >> :call <SID>headerInc(0)<CR>
nnoremap <silent> << :call <SID>headerInc(1)<CR>

nnoremap <silent> <leader>c :call <SID>toggleLineCheckbox()<CR>
inoremap <silent> <leader>c <C-o>:call <SID>toggleLineCheckbox()<CR>
vnoremap <silent> <leader>c :'<,'>call <SID>toggleLineCheckbox()<CR>

nnoremap <silent> <leader>x :call <SID>toggleChecked()<CR>
inoremap <silent> <leader>x <C-o>:call <SID>toggleChecked()<CR>
vnoremap <silent> <leader>x :'<,'>call <SID>toggleChecked()<CR>

nnoremap <silent> <right> :call <SID>searchLink(0)<CR>
nnoremap <silent> <left> :call <SID>searchLink(1)<CR>
