set nocompatible

" Backup/swap files
set backupdir=~/.vim/backup
set directory=~/.vim/backup



""" Global mapping options

" Leader key
map <Space> <leader>

" No delay when pressing Esc
set timeoutlen=1000 ttimeoutlen=0



""" Display

set laststatus=2
set showcmd

""" Status line
set statusline=%<
set statusline+=%f\ %m%r
set statusline+=\ \(%{&filetype}\|%{&ff}\)
set statusline+=%=
set statusline+=%-18.(%l,%c%V%)\ %P/%L

" Colors
set t_Co=256
let base16colorspace=256
set background=dark
color base16-ocean

" Show invisibles
set list
set listchars=tab:»\ ,trail:·
let &showbreak = '↳ '

" Line highlighting/numbering
set number
set relativenumber
set cursorline
set colorcolumn=80

" Matching brackets
set showmatch

" Bells
set noerrorbells
set visualbell
set t_vb=



""" Navigation

" Correct backspace/movement wrapping
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]
nnoremap j gj
nnoremap k gk

" Better wrapping behavior
set breakindent
set display=lastline

" Scrolloff
set scrolloff=5
set sidescrolloff=5

" Folding
nnoremap , za
vnoremap , zf
set foldlevelstart=99

" Buffer navigation
nnoremap <leader>b :bprevious \| bdelete #<CR>
nnoremap <C-m> :bnext<CR>
nnoremap <C-n> :bprevious<CR>
nnoremap <F2> :buffers<CR>:b
nnoremap <F3> :registers<CR>
nnoremap <F4> :marks<CR>

" Switch buffers without write
set hidden

" Split nagivation
nnoremap <leader>f :find *
nnoremap <leader>\| :vsplit \| find *
nnoremap <leader>- :split \| find *
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Split to right and below
set splitright
set splitbelow



""" Editing

" Indentation
set autoindent
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab

" Filetype extras
filetype on
filetype indent on

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



""" Command-line behavior

" Search
set incsearch
set hlsearch
set ignorecase smartcase
nnoremap <leader>n :noh<CR>

" Completion options
set path=.,**
set wildmode=list,full
set wildmenu

" Setting toggles
nnoremap <leader>l :setlocal invrelativenumber<CR>:setlocal relativenumber?<CR>
nnoremap <leader>s :setlocal invspell<CR>:setlocal spell?<CR>
nnoremap <leader>p :setlocal invpaste<CR>:setlocal paste?<CR>
nnoremap <leader>w :setlocal invwrap<CR>:setlocal wrap?<CR>

" Build systems
nnoremap <F9> :make!<CR>
nnoremap <F10> :cwindow<CR>
nnoremap <Down> :cnext<CR>
nnoremap <Up> :cprevious<CR>



""" Plugins

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

