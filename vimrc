" Payball's VIM configuration
"""""""""""""""""""""""""""""

" Defaults (generated by VimConfig.com)
"""""""""""""""""""""""""""""""""""""""

set expandtab                  " Converts tabs to spaces
set noswapfile                 " Disables swap files
set nobackup nowritebackup     " Disables backup files
set encoding=utf-8             " Read encoding
set fileencoding=utf-8         " Saving encoding
set termencoding=utf-8         " Terminal encoding
set number                     " Show line numbers
set linebreak                  " Break lines at word (requires Wrap lines)
set showbreak=+++              " Wrap-broken line prefix
set textwidth=100              " Line wrap (number of cols)
set showmatch                  " Highlight matching brace
set visualbell                 " Use visual bell (no beeping)
set hlsearch                   " Highlight all search results
set smartcase                  " Enable smart-case search
set nolazyredraw               " Don't redraw while executing macros
set ignorecase                 " Always case-insensitive
set incsearch                  " Searches for strings incrementally
set autoindent                 " Auto-indent new lines
set smartindent                " Enable smart-indent
"set ruler                      " Show row and column ruler information
set undolevels=1000            " Number of undo levels
set backspace=indent,eol,start " Backspace behaviour
set magic                      " Set magic on, for regex
set mat=2                      " How many tenths of a second to blink
"set cursorline                 " Draws an horizontal line at cursor position

" Tab control
set noexpandtab " tabs ftw
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" faster redrawing
set ttyfast

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" make backspace behave in a sane manner
set backspace=indent,eol,start

set pastetoggle=<F2>

" Switch syntax highlighting on
syntax on

" Plugins
"""""""""

" Vundle config
set nocompatible " be IMproved
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Vundle Plugins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'godlygeek/tabular'
Bundle 'nanotech/jellybeans.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-fugitive'
Plugin 'ryanoasis/vim-devicons'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'dracula/vim'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'

call vundle#end()            " required
filetype plugin indent on    " required


" NERDTree
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" VIM Airline
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=0

" Javascript
let g:javascript_plugin_jsdoc = 1

" Themes
""""""""

" Solarized config
syntax enable
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256 "256 | 16
set background=dark "dark|light
"colorscheme solarized

" Mappings
""""""""""

" Moving up and down work as you would expect
"nnoremap <silent> j gj
"nnoremap <silent> k gk

" Open VIMRC with shortcut
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Switch between buffers
nnoremap <silent> <C-Left> :bp<CR>
nnoremap <silent> <C-Right> :bn<CR>

" Switch between splits
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Hide higlighted matches after search
:nnoremap <silent> <CR> :nohlsearch<CR><CR>
