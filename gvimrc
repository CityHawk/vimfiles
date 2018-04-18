" setting up Vundle
set nocompatible
filetype off
call plug#begin()
Plug 'VundleVim/Vundle.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
" all the syntax highlighing
Plug 'sheerun/vim-polyglot'
" enables foodcritic checks and aware environment
Plug 'dougireton/vim-chef'
" Plug 'bling/vim-bufferline'
" Plug 'neomake/neomake.git'
Plug 'w0rp/ale'
" rainbow brackets
Plug 'luochen1990/rainbow'
" Plug 'jonathanfilip/vim-lucius'
Plug 'ntpeters/vim-better-whitespace'
" Completion by tab, not sure I need it
" Plug 'ervandew/supertab'
" shows git aware ruler to the left
Plug 'airblade/vim-gitgutter'
" aligns text by whatever
Plug 'godlygeek/tabular'
" I don't need it but let's keep it here as a remainder
Plug 'takac/vim-hardtime'
Plug 'tomasr/molokai'
Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'
" let's try ctrlp one more time
Plug 'kien/ctrlp.vim'
Plug 'janko-m/vim-test'

Plug 'sbdchd/neoformat'

Plug 'vim-scripts/IndexedSearch'

" ruby blocks as text objects
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
filetype on

" here comes the flood

set ic
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
" set foldmethod=indent   "fold based on indent
" set foldnestmax=10
set nofoldenable        "dont fold by default
set noshowmatch
" set foldlevel=1
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
    " colorscheme ayu
    hi VertSplit guibg=bg guifg=fg
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme koehler
endtry

if !has('nvim')
    set guifont=Menlo:h14
endif

set nobackup
set nowritebackup
set noswapfile
set number
set relativenumber
let g:NERDTreeShowLineNumbers=1
autocmd BufEnter NERD_* setlocal rnu

set showtabline=2
set colorcolumn=80
set enc=utf-8
set fillchars=vert:\│

nnoremap <c-f> :NERDTreeToggle<CR>
map <Tab><Tab> <C-W><C-W>
nnoremap <silent> <c-l> :CtrlPBuffer<CR>
nmap <silent> <F3> :Neoformat<CR>
nmap <silent> <F5> :TestFile<CR>

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

try
  " au BufWritePost * Neomake
  au BufWritePost * call SetMyStl()
endtry

let g:rainbow_active = 1
let loaded_matchparen = 0

hi Comment gui=italic cterm=italic
hi Define gui=italic cterm=italic

let g:indentLine_char = '┆'
let g:ale_sign_error = '⚠'
let g:ale_sign_warning = '»'

" make test commands execute using dispatch.vim
let test#strategy = "neovim"

if has('nvim')
    " control nvim terminal better
    tmap <C-o> <C-\><C-n>
end

let g:neoformat_enabled_ruby = ['rubocop']
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

function! SetMyStl()
    set stl=
    set stl=%#StatuslineDefault#✸\ %n
    set stl+=\ ᚠ\ %{fugitive#head()}
    set stl+=\ %f%m%r%h
    set stl+=%=
    set stl+=%y\ %{strlen(&fenc)?&fenc:'none'}[%{&ff}]
    set stl+=\ %3.3p%%\ ☰\ %4.4l/%-4.4L\ ㏑\ :%3.3c\ [%3.3b][0x%02.2B]

    set stl+=\ %#ErrorMsg#%{LinterStatus()}
endfunction

call SetMyStl()

" let g:hardtime_default_on = 1

runtime macros/matchit.vim

" Enable spell checking for markdown files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell
