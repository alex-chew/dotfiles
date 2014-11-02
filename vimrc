set nocompatible
set t_Co=256
set showcmd
 
" Correct backspace/movement wrapping
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]
 
" Indentation
set autoindent
set tabstop=4
set shiftwidth=4
set noexpandtab
 
" Line highlighting/numbering
set number
hi LineNr ctermfg=8
set cursorline
hi clear CursorLine
hi CursorLine term=NONE cterm=NONE
hi CursorLineNr term=bold cterm=bold ctermfg=white guifg=white
 
" Matching brackets
set showmatch
 
" Scrolloff
set scrolloff=5
set sidescrolloff=5
 
" Filetype extras
filetype on
filetype indent on
"filetype plugin on
 
" Search
set incsearch
set hlsearch
set ignorecase
set smartcase
 
" Bells
set noerrorbells
set visualbell
set t_vb=
 
" Cursor movement on wrapped lines
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

