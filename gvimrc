" setting up Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'plasticboy/vim-markdown.git'
Plugin 'tpope/vim-surround.git'
Plugin 'vim-ruby/vim-ruby.git'
Plugin 't9md/vim-chef.git', {'name': 'vimchef'}
Plugin 'dougireton/vim-chef.git'
Plugin 'bling/vim-airline.git'
Plugin 'taq/vim-git-branch-info'
Plugin 'SirVer/ultisnips.git'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'tpope/vim-endwise.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'tpope/vim-sensible.git'
Plugin 'kien/rainbow_parentheses.vim.git'
Plugin 'szw/vim-ctrlspace.git'
Plugin 'tomasr/molokai'
Plugin 'ervandew/supertab'
Plugin 'airblade/vim-gitgutter.git'
Plugin 'Raimondi/delimitMate.git'
Plugin 'ekalinin/Dockerfile.vim.git'
Plugin 'vim-pandoc/vim-pandoc.git'
Plugin 'rodjek/vim-puppet.git'
Plugin 'godlygeek/tabular.git'
Plugin 'honza/vim-snippets.git'
Plugin 'mtth/scratch.vim.git'
Plugin 'elzr/vim-json.git'
Plugin 'markcornick/vim-hashicorp-tools.git'
" Plugin 'Valloric/YouCompleteMe'

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


" if !has("win32")
"     set listchars=tab:▷.,trail:.,nbsp:.




set t_Co=256
" Colorscheme
colorscheme molokai
" colorscheme desert

" Statusline
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=\ %{fugitive#statusline()}     " fugitive
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position


set nobackup
set nowritebackup
set noswapfile
set number
set norelativenumber

set showtabline=2


" set nomodeline
" set guifont=Inconsolata\ for\ Powerline:h18
set guifont=Literation\ Mono\ Powerline:h16
" set guifont=Consolas:h16



nnoremap <c-f> :NERDTreeToggle<CR>
map <c-/> TComment<CR>
map <Tab><Tab> <C-W><C-W>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

if has("mac")
    set invmmta
endif

let g:airline_powerline_fonts = 1
" let g:airline_exclude_preview = 1
let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#enabled = 0


" fixing vim-chef autodetect
au BufNewFile,BufRead */*cookbooks/* set filetype=ruby.chef
au BufNewFile,BufRead *.rb set tabstop=2
au BufNewFile,BufRead *.rb set softtabstop=2
au BufNewFile,BufRead *.rb set shiftwidth=2

au VimEnter * RainbowParenthesesToggle
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

if has('gui')
    set lines=999 columns=9999
endif

highlight Comment gui=italic cterm=italic
highlight Comment cterm=italic
highlight Define gui=italic
highlight Define cterm=italic

set textwidth=80
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=234 guibg=#111111

