set nocompatible

" Backup/swap files
set backupdir=~/.vim/backup
set directory=~/.vim/backup



""" Global mapping options

" Easier :
nnoremap ; :
nnoremap : ;

" Leader key
map <Space> <leader>

" No delay when pressing Esc
set timeoutlen=1000 ttimeoutlen=0



""" Display

set laststatus=2
set showcmd

" Colors
if has("termguicolors")
  set termguicolors
endif
set background=dark
let base16colorspace=256
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
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

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

" Netrw navigation
nnoremap <F1> :Vex<CR>
let g:netrw_liststyle=3

" Buffer navigation
nnoremap <silent> <leader>b :if &buflisted \|
      \ bprevious \| bdelete # \|
      \ else \| q \| endif<CR>
nnoremap <C-m> :bnext<CR>
nnoremap <C-n> :bprevious<CR>
nnoremap <F2> :buffers<CR>:b
nnoremap <F3> :registers<CR>
nnoremap <F4> :marks<CR>
nnoremap <F5> :TagbarOpenAutoClose<CR>

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
set smartindent
set cindent
set cinoptions=g0
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab

" Filetype extras
filetype on
filetype indent on



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
nnoremap <leader>r :setlocal invrelativenumber<CR>:setlocal relativenumber?<CR>
nnoremap <leader>s :setlocal invspell<CR>:setlocal spell?<CR>
nnoremap <leader>p :setlocal invpaste<CR>:setlocal paste?<CR>
nnoremap <leader>w :setlocal invwrap<CR>:setlocal wrap?<CR>

" Build systems
nnoremap <F9> :make!<CR>
nnoremap <F10> :cwindow<CR>
nnoremap <Down> :cnext<CR>
nnoremap <Up> :cprevious<CR>
" No qf in :ls/:bn/etc, and use abs line numbers (from romainl's vim-qf)
autocmd FileType qf set nobuflisted | setlocal norelativenumber number



""" Plugins

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'editorconfig/editorconfig-vim'
Plug 'lervag/vimtex'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'wellle/targets.vim'

Plug 'airblade/vim-gitgutter'
set updatetime=1000

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'base16_ocean'
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1
let g:airline_extensions = ['tabline', 'tagbar']
let g:airline#extensions#tabline#buffer_min_count = 2

Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1

Plug 'tpope/vim-commentary'
autocmd FileType c,cpp,h,hpp setlocal commentstring=//\ %s

Plug 'tpope/vim-fugitive'
nnoremap <leader>gs :Gstatus<CR>

call plug#end()

