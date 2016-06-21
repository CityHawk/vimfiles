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
Plugin 'scrooloose/syntastic.git'
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
set hidden
set hlsearch
set noshowmode
set t_Co=256
" Colorscheme
try
    colorscheme molokai
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry


set nobackup
set nowritebackup
set noswapfile
set number
set relativenumber

set showtabline=2


" set nomodeline
set guifont=Cousine\ for\ Powerline:h14



nnoremap <c-f> :NERDTreeToggle<CR>
map <c-/> TComment<CR>
map <Tab><Tab> <C-W><C-W>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

if has("mac")
    set invmmta
endif

let g:airline_powerline_fonts = 1
" let g:airline_exclude_preview = 1
let g:airline_theme = 'murmur'
let g:airline#extensions#tabline#enabled = 1
let g:bufferline_echo = 0
let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
let g:airline#extensions#tmuxline#enabled = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" fixing vim-chef autodetect
au BufNewFile,BufRead *.rb set tabstop=2
au BufNewFile,BufRead *.rb set softtabstop=2
au BufNewFile,BufRead *.rb set shiftwidth=2

if exists(':RainbowParenthesesActivate')
    au VimEnter * RainbowParenthesesToggle
    au VimEnter * RainbowParenthesesActivate
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
endif

if has('gui')
    set lines=999 columns=9999
endif

set textwidth=80
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=234 guibg=#111111
let g:hardtime_default_on = 1

set enc=utf-8
set fillchars=vert:\│

