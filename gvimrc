" setting up Vundle
set nocompatible
filetype off
call plug#begin()
Plug 'VundleVim/Vundle.vim'

" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
" all the syntax highlighing
" Plug 'sheerun/vim-polyglot'
" enables foodcritic checks and aware environment
Plug 'dougireton/vim-chef'
" Plug 'bling/vim-bufferline'
" Plug 'neomake/neomake.git'
Plug 'dense-analysis/ale'
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
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'
Plug 'Yggdroot/indentLine'
" let's try ctrlp one more time
" Plug 'kien/ctrlp.vim'
Plug 'janko-m/vim-test'

Plug 'sbdchd/neoformat'

Plug 'vim-scripts/IndexedSearch'

" ruby blocks as text objects
" Plug 'kana/vim-textobj-user'
" Plug 'nelstrom/vim-textobj-rubyblock'

" Trying out easytags, automated ctag generation
" Plug 'xolox/vim-easytags'
" Plug 'xolox/vim-misc'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neovim/nvim-lsp'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'MattesGroeger/vim-bookmarks'

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
    colorscheme monokai
    " colorscheme ayu
    " colorscheme gruvbox
    " hi Normal ctermbg=16 guibg=#000000
    " hi LineNr ctermbg=16 guibg=#000000
    hi VertSplit guibg=bg guifg=fg
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme koehler
endtry

set guifont=Iosevka\ Term\ SS04:h13
if exists('g:GtkGuiLoaded')
    " call rpcnotify(1, 'Gui', 'Font', 'Iosevka Term Curly 13')
    " call rpcnotify(1, 'Gui', 'Font','Victor Mono 13')
    call rpcnotify(1, 'Gui', 'FontFeatures', 'PURS, cv17')
    
endif
set mouse=a

set nobackup
set nowritebackup
set noswapfile
set number
" set relativenumber
let g:NERDTreeShowLineNumbers=1
autocmd BufEnter NERD_* setlocal rnu

set showtabline=2
set colorcolumn=80
set enc=utf-8
set fillchars=vert:\│

" visual search and replacea for neovim
set inccommand=nosplit

augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" nnoremap <c-n> :NERDTreeToggle<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
map <Tab><Tab> <C-W><C-W>
" nnoremap <silent> <c-l> :CtrlPBuffer<CR>
nmap <silent> <F3> :Neoformat<CR>
nmap <silent> <F5> :TestFile<CR>
nmap <c-p> :Files<CR>
nmap <c-l> :Buffers<CR>

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

try
  " au BufWritePost * Neomake
  au BufWritePost * call SetMyStl()
endtry

let g:rainbow_active = 1
let loaded_matchparen = 0

" Disable quote concealing in JSON files
set conceallevel=0

hi Comment gui=italic cterm=italic
hi Define gui=italic cterm=italic

let g:indentLine_char = '┆'
let g:indentLine_fileTypeExclude = ['json']
let g:ale_sign_error = '⛔'
let g:ale_sign_warning = '⚠'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = { 'javascript': ['eslint'], 'ruby': ['rubocop'], 'json': ['jq']}

" make test commands execute using dispatch.vim
let test#strategy = "neovim"

if has('nvim')
    " control nvim terminal better
    tmap <C-o> <C-\><C-n>
end

" lua <<EOF
"     local nvim_lsp = require'nvim_lsp'
"     nvim_lsp.solargraph.setup{}
"     nvim_lsp.pyls.setup{
"         settings = {
"             pyls = {
"                 configurationSources = {
"                     pycodestyle,
"                     flake8
"                 }
"             }
"         }
"     }
" EOF

let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['tcp://localhost:7658']
    \ }

nnoremap <F4> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd FileType ruby setlocal omnifunc=LanguageClient#complete

let g:neoformat_enabled_ruby = ['rubocop']
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   "%dW %dE",
    \   all_non_errors,
    \   all_errors
    \)
endfunction

function! SetMyStl()
    set stl=
    set stl=%#StatuslineDefault#✸\ %n
    set stl+=\ git-branch:\ (%{fugitive#head()})
    set stl+=\ %f%m%r%h
    set stl+=%=
    set stl+=%y\ %{strlen(&fenc)?&fenc:'none'}[%{&ff}]
    set stl+=\ %3.3p%%\ ☰\ %4.4l/%-4.4L\ ㏑\ :%3.3c\ [%3.3b][0x%02.2B]

    set stl+=\ %{LinterStatus()}
endfunction

call SetMyStl()

" let g:hardtime_default_on = 1

runtime macros/matchit.vim

" Enable spell checking for markdown files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell
" :set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" let g:ackprg = 'ag --vimgrep'

if !exists('s:is_neovim_gtk_gui')
	let s:is_neovim_gtk_gui = exists('g:GtkGuiLoaded') ? 1 : 0
en

" works for neovim-gtk and for neovim-qt since a250faf from 25-07-2018.
" earlier neovim-qt have been supposed to be run with --no-ext-tabline option.
call rpcnotify((s:is_neovim_gtk_gui ? 1 : 0), 'Gui', 'Option', 'Tabline', 0)

let s:font_family = 'Iosevka Term Curly'
let s:font_size = 13

function! s:update_font()
	if s:is_neovim_gtk_gui " neovim-gtk
		call rpcnotify(
			\ 1, 'Gui', 'Font', s:font_family.' '.string(s:font_size))
	el " neovim-qt
		call rpcnotify(
			\ 0, 'Gui', 'Font', s:font_family.':h'.string(s:font_size))
	en
endfunction

function! s:set_font_family(family)
	let s:font_family = a:family
	call s:update_font()
endfunction

command! -nargs=1 GuiFontFamily call <SID>set_font_family(<args>)

" fast font inc/dec

call s:update_font()

function! s:font_size_dec(count)
	let l:count = a:count | if l:count < 1 | let l:count = 1 | endif
	let s:font_size = s:font_size - l:count
	if s:font_size < 1 | let s:font_size = 1 | endif
	call s:update_font()
endfunction

function! s:font_size_inc(count)
	let l:count = a:count | if l:count < 1 | let l:count = 1 | endif
	let s:font_size = s:font_size + l:count
	if s:font_size < 1 | let s:font_size = 1 | endif
	call s:update_font()
endfunction

command! GuiFontSizeDec call <SID>font_size_dec(1)
command! GuiFontSizeInc call <SID>font_size_inc(1)
command! -nargs=1 GuiFontSizeDecN call <SID>font_size_dec(<args>)
command! -nargs=1 GuiFontSizeIncN call <SID>font_size_inc(<args>)

" nnoremap <leader>- :<C-u>call <SID>font_size_dec(v:count)<CR>
" nnoremap <leader>+ :<C-u>call <SID>font_size_inc(v:count)<CR>
" nnoremap <leader>= :<C-u>call <SID>font_size_inc(v:count)<CR>

nnoremap <C-ScrollWheelUp>   :call <SID>font_size_inc(1)<CR>
nnoremap <C-ScrollWheelDown> :call <SID>font_size_dec(1)<CR>
