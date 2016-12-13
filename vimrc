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
nnoremap j gj
nnoremap k gk

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
set display=lastline

" Don't automatically fold
set foldlevelstart=99

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

" Switch buffers without write
set hidden

" Backup/swap files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Path for :find
set path=.,**



" Auto-closing mappings
inoremap (<Tab> ()<Esc>i
inoremap (<CR> (<CR>)<Esc>O
inoremap [<Tab> []<Esc>i
inoremap [<CR> [<CR>]<Esc>O
inoremap {<Tab> {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap '<Tab> ''<Esc>i
inoremap "<Tab> ""<Esc>i
inoremap `<Tab> ``<Esc>i



" Leader mappings
map <Space> <leader>
nnoremap <leader>l :setlocal invrelativenumber<CR>:setlocal relativenumber?<CR>
nnoremap <leader>s :setlocal invspell<CR>:setlocal spell?<CR>
nnoremap <leader>p :setlocal invpaste<CR>:setlocal paste?<CR>
nnoremap <leader>w :setlocal invwrap<CR>:setlocal wrap?<CR>
nnoremap <leader>n :noh<CR>
nnoremap <leader>f :find *
nnoremap <leader>b :bprevious \| bdelete #<CR>

" Misc mappings
nnoremap <F2> :buffers<CR>:b
nnoremap <F3> :registers<CR>
nnoremap <F4> :marks<CR>
nnoremap <C-m> :bnext<CR>
nnoremap <C-n> :bprevious<CR>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Make mappings
nnoremap <F9> :make!<CR>
nnoremap <F10> :cwindow<CR>
nnoremap <Down> :cnext<CR>
nnoremap <Up> :cprevious<CR>

" Folding
nnoremap , za
vnoremap , zf



" Custom file types
au BufRead,BufNewFile *.ino set filetype=arduino



" Plugins

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
set updatetime=1000

Plug 'ap/vim-buftabline'
let g:buftabline_show = 1
let g:buftabline_indicators = 1

Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-dirvish'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'sophacles/vim-processing'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

call plug#end()

