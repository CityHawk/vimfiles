" setting up Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise.git'
Plugin 'tpope/vim-sensible.git'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-liquid'
Plugin 'plasticboy/vim-markdown.git'
Plugin 'vim-ruby/vim-ruby.git'
Plugin 't9md/vim-chef.git', {'name': 'vimchef'}
Plugin 'dougireton/vim-chef.git'
Plugin 'vim-airline/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'tomtom/tcomment_vim.git'
" Plugin 'scrooloose/syntastic.git'
Plugin 'neomake/neomake.git'
Plugin 'kien/rainbow_parentheses.vim.git'
Plugin 'szw/vim-ctrlspace.git'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'ervandew/supertab'
Plugin 'airblade/vim-gitgutter.git'
" This plug-in provides automatic closing of quotes, parenthesis, brackets,
" Plugin 'Raimondi/delimitMate.git'
Plugin 'godlygeek/tabular.git'
Plugin 'honza/vim-snippets.git'
Plugin 'elzr/vim-json.git'
Plugin 'thoughtbot/vim-rspec'
Plugin 'benmills/vimux'
Plugin 'edkolev/tmuxline.vim'
Plugin 'bling/vim-bufferline'
Plugin 'takac/vim-hardtime'
Plugin 'ayu-theme/ayu-vim'

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
set t_Co=256
" Colorscheme
try
    " let g:molokai_original = 0
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
set cursorline


" set nomodeline
set guifont=InputMonoNarrow:h14

nnoremap <c-f> :NERDTreeToggle<CR>
map <c-/> TComment<CR>
map <Tab><Tab> <C-W><C-W>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

let g:airline_powerline_fonts = 0
" let g:airline_exclude_preview = 1
" let g:airline_theme = 'murmur'
let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#enabled = 1
let g:bufferline_echo = 0
let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
let g:airline#extensions#tmuxline#enabled = 0

" fixing vim-chef autodetect
au BufNewFile,BufRead *.rb set tabstop=2
au BufNewFile,BufRead *.rb set softtabstop=2
au BufNewFile,BufRead *.rb set shiftwidth=2

" Rakefile should respect common settings
au BufNewFile,BufRead Rakefile set tabstop=2
au BufNewFile,BufRead Rakefile set softtabstop=2
au BufNewFile,BufRead Rakefile set shiftwidth=2

au BufWritePost * Neomake


if exists(':RainbowParenthesesActivate')
    au VimEnter * RainbowParenthesesToggle
    au VimEnter * RainbowParenthesesActivate
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
endif

set colorcolumn=80

set enc=utf-8
set fillchars=vert:\│

" set t_8f=^[[38;2;%lu;%lu;%lum
" set t_8b=^[[48;2;%lu;%lu;%lum

set termguicolors
highlight Comment gui=italic cterm=italic
highlight Comment cterm=italic
highlight Define gui=italic
highlight Define cterm=italic

" set cursor shape for different modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
