let g:pandoc_continuous = 0
let g:pandoc_output_format = 'pdf'

function! s:status(msg)
  echohl ModeMsg
  echon 'pandoc: '
  echohl Statement
  echon a:msg
  echohl None
endfunction

function! s:toggleContinuous()
  let g:pandoc_continuous = !g:pandoc_continuous
  if g:pandoc_continuous
    let b:pandoc_command_autoexec_command = 'Pandoc ' . g:pandoc_output_format
    call s:status('started continuous compilation to ' . g:pandoc_output_format)
    exe b:pandoc_command_autoexec_command
  else
    let b:pandoc_command_autoexec_command = ''
    call s:status('stopped continuous compilation')
  endif
endfunction

function! s:openOutput()
  let fname = expand('%:r') . '.' . g:pandoc_output_format
  if filereadable(fname)
    silent exe '!xdg-open ' . fname . ' &'
  else
    call s:status('could not open ' . fname)
  endif
endfunction

" Bindings inspired by vimtex
nnoremap <silent> <localleader>ll :call <SID>toggleContinuous()<CR>
nnoremap <silent> <localleader>lv :call <SID>openOutput()<CR>
