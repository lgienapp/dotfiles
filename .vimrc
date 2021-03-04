" ---------------------------------------------------------------
" Vim config file
" Author: Lukas Gienapp
" ---------------------------------------------------------------



" ---------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

" Nordic color scheme
Plug 'arcticicestudio/nord-vim'
" Status bar
Plug 'itchyny/lightline.vim'

call plug#end()

" ---------------------------------------------------------------
" General
" ---------------------------------------------------------------
"Enable syntax highlighting
syntax on
colorscheme nord
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_bold = 0
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" Fix terminal color after exit
" (may be messed up after exiting Vim, especially when using GNU Screen)
au VimLeave * !echo -ne "\033[0m"↲

" GUI settings
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
    set guifont=IBM\ Plex\ Mono
endif


filetype plugin indent on

" Set UTF-8 as default encoding
set encoding=utf8
scriptencoding utf-8

" Set Unix as standard file type
set ffs=unix,mac,dos

" Ignore certain binary files
set wildignore=*.o,*.a,*.lib,*~,*.pyc

" Height of the command bar
set cmdheight=1

" Configure backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Line numbers
set number

" Highlight current line (disable if you experience slow scroll speed)
" set cursorline

" Highlight columns beyond 80 characters
let &colorcolumn=join(range(81,999),",")

" Highlight search results
set hlsearch

" Always show status line
set laststatus=2

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros
set nolazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
set matchtime=0

" Search settings
set ignorecase
set smartcase
set incsearch

" Tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set autoindent

" Non-printing characters
" set list
" set listchars=eol:↲,tab:→\ ,trail:·

" Spell checking
map <leader>ss :setlocal spell!<cr>
set spell
set spelllang=en_us

" Make Vim more useful
set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
