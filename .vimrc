call pathogen#infect()

syntax on
colorscheme zenburn
filetype plugin indent on

set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set nonumber
set norelativenumber
set laststatus=2
set history=1000
set list
set listchars=trail:·
set shell=/bin/bash
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿,vert:│
set autowrite
set autoread
set shiftround
set title
set linebreak
set dictionary=/usr/share/dict/words

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=+1
set synmaxcol=800

set notimeout
set ttimeout
set ttimeoutlen=10

au FocusLost * :silent! wall
au VimResized * :wincmd =

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undofile
set undoreload=10000
set backup
set noswapfile

let mapleader=","
let maplocalleader="\\"

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <leader>v <C-w>v
noremap <leader>q <C-w>q

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

if has('gui_running')
    " GUI Vim

    set guifont=Menlo\ Regular\ for\ Powerline:h12

    " Remove all the UI cruft
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R

    highlight SpellBad term=underline gui=undercurl guisp=Orange

    if has("gui_macvim")
        " Full screen means FULL screen
        set fuoptions=maxvert,maxhorz

        " Use the normal HIG movements, except for M-Up/Down
        let macvim_skip_cmd_opt_movement = 1
        no   <D-Left>       <Home>
        no!  <D-Left>       <Home>
        no   <M-Left>       <C-Left>
        no!  <M-Left>       <C-Left>

        no   <D-Right>      <End>
        no!  <D-Right>      <End>
        no   <M-Right>      <C-Right>
        no!  <M-Right>      <C-Right>

        no   <D-Up>         <C-Home>
        ino  <D-Up>         <C-Home>
        imap <M-Up>         <C-o>{

        no   <D-Down>       <C-End>
        ino  <D-Down>       <C-End>
        imap <M-Down>       <C-o>}

        imap <M-BS>         <C-w>
        inoremap <D-BS>     <esc>my0c`y
    else
        " Non-MacVim GUI, like Gvim
    end
else
    " Console Vim
    " For me, this means iTerm2, possibly through tmux

    " Mouse support
    set mouse=a
endif

let python_highlight_builtins=1
