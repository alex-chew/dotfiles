let s:pandoc_args = {
      \ 'html5': '-s --mathjax',
      \ 'pdf': '-V geometry:margin=1in'
      \ }

py3 << EOF
from vim_pandoc.command import PandocHelpParser
import re

formats_table = PandocHelpParser.get_output_formats_table()
def output_ext(fmt):
    return formats_table[re.split('[-+]', fmt)[0]]
EOF

if !exists('b:pandoc_continuous')
  let b:pandoc_continuous = 0
endif

if !exists('b:pandoc_output_format')
  let b:pandoc_output_format = 'pdf'
endif

function! s:status(msg)
  echohl ModeMsg
  echon 'pandoc: '
  echohl Statement
  echon a:msg
  echohl None
endfunction

function! s:continuousStatus()
  if b:pandoc_continuous
    let msg = 'continuously converting to ' . b:pandoc_output_format
  else
    let msg = 'continuous conversion disabled ('
          \ . b:pandoc_output_format . ')'
  endif
  call s:status(msg)
endfunction

function! s:updateCommand()
  if b:pandoc_continuous
    let b:pandoc_command_autoexec_command =
          \ 'Pandoc -F ~/.pandoc/filters/checklist.py '
          \ . b:pandoc_output_format
    if has_key(s:pandoc_args, b:pandoc_output_format)
      let b:pandoc_command_autoexec_command .=
            \ ' ' . get(s:pandoc_args, b:pandoc_output_format)
    endif
  else
    let b:pandoc_command_autoexec_command = ''
  endif
endfunction

function! s:toggleContinuous()
  let b:pandoc_continuous = !b:pandoc_continuous
  call s:updateCommand()
  exe b:pandoc_command_autoexec_command
  call s:continuousStatus()
endfunction

function! s:openOutput()
  let fname = expand('%:r') . '.'
        \ . py3eval('output_ext("' . b:pandoc_output_format . '")')
  if filereadable(fname)
    silent exe '!xdg-open ' . fname . ' &'
  else
    call s:status('could not open ' . fname)
  endif
endfunction

function! s:setFormat(fmt)
  let b:pandoc_output_format = a:fmt
  call s:updateCommand()
  call s:continuousStatus()
endfunction

" Bindings inspired by vimtex
nnoremap <silent> <localleader>lg :call <SID>continuousStatus()<CR>
nnoremap <silent> <localleader>ll :call <SID>toggleContinuous()<CR>
nnoremap <silent> <localleader>lv :call <SID>openOutput()<CR>

nnoremap <silent> <localleader>lh :call <SID>setFormat('html5')<CR>
nnoremap <silent> <localleader>lp :call <SID>setFormat('pdf')<CR>

" Broken mapping from vim-pandoc...
nunmap <buffer> <localleader>xi

call s:updateCommand()
