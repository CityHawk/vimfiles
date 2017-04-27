" setting up Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise.git'
Plugin 'tpope/vim-sensible.git'
Plugin 'tpope/vim-commentary.git'
" all the syntax highlighing
Plugin 'sheerun/vim-polyglot'
" enables foodcritic checks and aware environment
Plugin 'dougireton/vim-chef.git'
" Plugin 'bling/vim-bufferline'
Plugin 'neomake/neomake.git'
" rainbow brackets
Plugin 'luochen1990/rainbow'
" Plugin 'jonathanfilip/vim-lucius'
Plugin 'ntpeters/vim-better-whitespace'
" Completion by tab, not sure I need it
Plugin 'ervandew/supertab'
" shows git aware ruler to the left
Plugin 'airblade/vim-gitgutter.git'
" aligns text by whatever
Plugin 'godlygeek/tabular.git'
" I don't need it but let's keep it here as a remainder
" Plugin 'takac/vim-hardtime'
Plugin 'tomasr/molokai'
" Plugin 'ayu-theme/ayu-vim'
Plugin 'Yggdroot/indentLine'
" let's try ctrlp one more time
Plugin 'kien/ctrlp.vim'

Plugin 'IndexedSearch'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype on

set ic
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set foldmethod=indent   "fold based on indent
set foldnestmax=10
set nofoldenable        "dont fold by default
set foldlevel=1
set list
set listchars=tab:\ \ ,trail:·,nbsp:_
set hidden
set hlsearch
" set noshowmode
set path+=**
" set lazyredraw
set cursorline
set ttyfast
set t_Co=256
" Colorscheme
set termguicolors
try
    colorscheme molokai
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme koehler
endtry
set nobackup
set nowritebackup
set noswapfile
set number
set relativenumber
set showtabline=2
set guifont=Menlo:h14
set colorcolumn=80
set enc=utf-8
set fillchars=vert:\│

nnoremap <c-f> :NERDTreeToggle<CR>
map <Tab><Tab> <C-W><C-W>
nnoremap <silent> <c-l> :CtrlPBuffer<CR>

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

try
  au BufWritePost * Neomake
  au BufWritePost * call SetMyStl()
endtry

let g:rainbow_active = 1

hi Comment gui=italic cterm=italic
hi Define gui=italic cterm=italic

" set cursor shape for different modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

let g:indentLine_char = '┆'

function! SetMyStl()
    set stl=
    set stl=%#StatuslineDefault#✸\ %n
    set stl+=\ ᚠ\ %{fugitive#head()}
    set stl+=\ %f%m%r%h
    set stl+=%=
    set stl+=%y\ %{strlen(&fenc)?&fenc:'none'}[%{&ff}]
    set stl+=\ %3.3p%%\ ☰\ %4.4l/%-4.4L\ ㏑\ :%3.3c\ [%3.3b][0x%02.2B]
    set stl+=\ %#ErrorMsg#%{neomake#statusline#LoclistStatus('')}
endfunction

call SetMyStl()
