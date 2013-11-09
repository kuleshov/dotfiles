" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ Remap ESC ========================

imap jj <Esc>
vmap jj <Esc>

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

nnoremap <Leader>z <C-O>
nnoremap <Leader>x <C-I>
nnoremap ; :

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

" ============== Pathogen Initialization =============

" execute pathogen#infect()

" =============== Vundle Initialization ===============

" This loads all the plugins specified in ~/.vim/vundle.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set copyindent    " copy the previous indentation on autoindenting
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*.pyc
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Search ========================

set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
nmap <silent> ,/ :nohlsearch<CR>
                  " ^ untoggle current search highlight

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Enable pasting code ===========

set pastetoggle=<Leader>p

" ======== Enable scrolling with the mouse ======

" set mouse=nicr

" ================ Paragraphs  ===================

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" ================ Vundle ========================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'git://git.wincent.com/command-t.git'
"Bundle 'scrooloose/nerdcommenter'
Bundle 'tomtom/tcomment_vim'
Bundle 'travisjeffery/vim-gotosymbol'
Bundle 'kien/ctrlp.vim.git'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'bling/vim-airline'
" Bundle 'terryma/vim-smooth-scroll'
Bundle 'joeytwiddle/sexy_scroller.vim'

" ================ Bundle Config ================
let g:neocomplcache_enable_at_startup = 1
nmap <silent> <Leader>t :CtrlP<CR>
set laststatus=2
let g:airline_powerline_fonts = 1
let g:SexyScroller_EasingStyle = 1
let g:SexyScroller_ScrollTime = 20

" ================ Colors ========================

syntax enable
set background=light
colorscheme solarized
"let g:solarized_termcolors=256
if !has('gui_running')
    " Compatibility for Terminal
    let g:solarized_termtrans=1

    if (&t_Co >= 256 || $TERM == 'xterm-256color')
        " Do nothing, it handles itself.
    else
        " Make Solarized use 16 colors for Terminal support
        let g:solarized_termcolors=16
    endif
endif
