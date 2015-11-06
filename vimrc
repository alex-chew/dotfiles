set nocompatible
set t_Co=256
set showcmd
set laststatus=2

" Color scheme
let base16colorspace=256
set background=dark
color base16-ocean

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

" Better wrapping behavior
set breakindent
let &showbreak = '↳ '

" Line highlighting/numbering
set number
set relativenumber
set cursorline

" Show 80th column
set colorcolumn=80

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

" Completion options
set wildmode=longest,list,full
set wildmenu

" Bells
set noerrorbells
set visualbell
set t_vb=

" Backup/swap files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Path for :find
set path=.,**



" Leader mappings
let mapleader=","
nnoremap <leader>l :setlocal invrelativenumber<CR>
nnoremap <leader>p :setlocal invspell<CR>
nnoremap <leader>n :noh<CR>
nnoremap <leader>f :find *
nnoremap <leader>b :bnext<CR>
nnoremap <leader>B :bprevious<CR>

" Misc mappings
nnoremap <F2> :buffers<CR>:b
nnoremap <F3> :registers<CR>



" Custom file types
au BufRead,BufNewFile *.ino set filetype=arduino



" Plugins

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'

call plug#end()

