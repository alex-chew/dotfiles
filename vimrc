set nocompatible
set t_Co=256
set showcmd

" Correct backspace/movement wrapping
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]

" Cursor movement on wrapped lines
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Indentation
set autoindent
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab

" Show whitespace
set list
set listchars=tab:»\ ,trail:·

" Line highlighting/numbering
set number
"hi LineNr ctermfg=8
set cursorline
"hi clear CursorLine
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorLineNr term=bold cterm=bold ctermfg=6 guifg=8

" Matching brackets
set showmatch

" Scrolloff
set scrolloff=5
set sidescrolloff=5

" Filetype extras
filetype on
filetype indent on
"filetype plugin on

" X clipboard is the + register
set clipboard=unnamedplus

" Search
set incsearch
set hlsearch
set ignorecase smartcase

" Bells
set noerrorbells
set visualbell
set t_vb=

" Backup/swap files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Color scheme
color Tomorrow-Night-Eighties

" Custom file types
au BufRead,BufNewFile *.ino set filetype=arduino

