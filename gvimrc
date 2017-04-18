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
Plugin 'plasticboy/vim-markdown.git'
Plugin 'vim-ruby/vim-ruby.git'
" Apparently runs rspecs, but not sure it's useful
" Plugin 'thoughtbot/vim-rspec'
" ctags like jumping around in chef code
" Plugin 't9md/vim-chef.git', {'name': 'vimchef'}
" enables foodcritic checks and aware environment
Plugin 'dougireton/vim-chef.git'
Plugin 'vim-airline/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'tomtom/tcomment_vim.git'
" Plugin 'scrooloose/syntastic.git'
Plugin 'neomake/neomake.git'
" Plugin 'kien/rainbow_parentheses.vim.git'
Plugin 'luochen1990/rainbow'
" Plugin 'szw/vim-ctrlspace.git'
Plugin 'tomasr/molokai'
" Completion by tab, not sure I need it
Plugin 'ervandew/supertab'
Plugin 'airblade/vim-gitgutter.git'
" This plug-in provides automatic closing of quotes, parenthesis, brackets,
" Plugin 'Raimondi/delimitMate.git'
Plugin 'godlygeek/tabular.git'
Plugin 'honza/vim-snippets.git'
Plugin 'elzr/vim-json.git'
" can export theme to tmux
" Plugin 'edkolev/tmuxline.vim'
" I don't need it but let's keep it here as a remainder
" Plugin 'takac/vim-hardtime'
Plugin 'ayu-theme/ayu-vim'
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
set noshowmode

set path+=**
" set lazyredraw
set cursorline
set ttyfast

set t_Co=256
" Colorscheme
set termguicolors
try
    " let g:molokai_original = 0
    " set background=dark
    " colorscheme chroma
    colorscheme ayu
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry


set nobackup
set nowritebackup
set noswapfile
set number
set relativenumber

set showtabline=2
" set cursorline


" set nomodeline
set guifont=InputMonoNarrow:h14

nnoremap <c-f> :NERDTreeToggle<CR>
map <c-/> TComment<CR>
map <Tab><Tab> <C-W><C-W>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <silent> <c-l> :CtrlPBuffer<CR>

let g:airline_powerline_fonts = 0
" let g:airline_exclude_preview = 1
" let g:airline_theme = 'murmur'
let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#enabled = 1
let g:bufferline_echo = 0
" let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
let g:airline#extensions#tmuxline#enabled = 0

" fixing vim-chef autodetect
au BufNewFile,BufRead *.rb set tabstop=2
au BufNewFile,BufRead *.rb set softtabstop=2
au BufNewFile,BufRead *.rb set shiftwidth=2
au BufNewFile,BufRead *.rb set re=1
au BufNewFile,BufRead *.rb set lazyredraw

" Rakefile should respect common settings
au BufNewFile,BufRead Rakefile set tabstop=2
au BufNewFile,BufRead Rakefile set softtabstop=2
au BufNewFile,BufRead Rakefile set shiftwidth=2
au BufNewFile,BufRead Rakefile set re=1
au BufNewFile,BufRead Rakefile set lazyredraw

" fixing vim-chef autodetect
au BufNewFile,BufRead *.rake set tabstop=2
au BufNewFile,BufRead *.rake set softtabstop=2
au BufNewFile,BufRead *.rake set shiftwidth=2
au BufNewFile,BufRead *.rake set re=1
au BufNewFile,BufRead *.rake set lazyredraw

try
    au BufWritePost * Neomake
endtry

let g:rainbow_active = 1

set colorcolumn=80

set enc=utf-8
set fillchars=vert:\│
" set t_8f=^[[38;2;%lu;%lu;%lum
" set t_8b=^[[48;2;%lu;%lu;%lum

" hi Comment gui=italic cterm=italic
" hi Define gui=italic cterm=italic
"
" hi Conditional gui=bold cterm=bold
" hi Constant gui=bold cterm=bold
" hi Debug gui=bold cterm=bold
" hi DiffText gui=italic,bold cterm=italic,bold
" hi Directory gui=bold cterm=bold
" hi ErrorMsg gui=bold cterm=bold
" hi Exception gui=bold cterm=bold
" hi Keyword gui=bold cterm=bold
" hi Macro gui=italic cterm=italic
" hi SpecialKey gui=italic cterm=italic
" hi MatchParen gui=bold cterm=bold
" hi PreCondit gui=bold cterm=bold
" hi Repeat gui=bold cterm=bold
" hi SpecialChar gui=bold cterm=bold
" hi SpecialComment gui=bold cterm=bold
" hi Special gui=italic cterm=italic
" hi Statement gui=bold cterm=bold
" hi StorageClass gui=italic cterm=italic
" hi Tag gui=italic cterm=italic
" hi Todo gui=bold cterm=bold
" hi Underlined gui=underline cterm=underline
" hi VertSplit gui=bold cterm=bold
" hi WarningMsg gui=bold



" set cursor shape for different modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#151A1E'
let g:indentLine_char = '┆'

