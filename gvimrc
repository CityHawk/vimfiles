" System-wide vimrc file for ALTLinux distribution
"
" Maintainer:   Vim Development Team <vim@packages.altlinux.ru>
" Last change:  2003 Apr 25 by Sir Raorn <raorn@altlinux.ru>
"
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
end

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" set paste

" language en
set ai
set ic
set hls


set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4

set foldmethod=indent   "fold based on indent
set foldnestmax=10
set nofoldenable        "dont fold by default
set foldlevel=1  
set list

call pathogen#infect()
call pathogen#helptags()

if !has("win32")
    set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
endif
"set listchars=tab:,trail:,nbsp:

set t_Co=256


noremap <silent> <c-e> :NERDTreeToggle<CR>

" allow backspacing over everything in insert mode
colorscheme Tomorrow-Night
set backspace=indent,eol,start

let g:git_branch_status_head_current=1

set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
" set statusline+=\ %{fugitive#statusline()}     " fugitive
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position
set statusline+=%{GitBranchInfoString()}                        " file position


set nobackup
set nowritebackup
set noswapfile
set autoindent      " always set autoindenting on
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " show partial command in status line
set number

syntax enable

"if !has("gui")
"    let g:CSApprox_loaded = 1
"endif

map <F3> NERDComLineSexyMap 
map <F4> NERDComUncommentLine

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-X><C-O>


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  filetype on

endif " has("autocmd")

set nomodeline
set wildmenu
if has("mac")
    set guifont=Sauce\ Code\ Powerline\ Light:h15
else
    set guifont=Liberation\ Mono\ 14
endif
if has("win32") 
    set guifont=Lucida_Console:h16
    language us
endif
set columns=128

nnoremap <c-f> :NERDTreeToggle<CR>
"set hidden
map <c-/> NERDComToggleComment<CR>

if has("mac")
    " set fu
    set invmmta
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

au BufNewFile,BufRead */*cookbooks/*  call s:ft_chef_hook()

let g:chef = {}
let g:chef.hooks = ['ChefNerdTreeFind']
let g:chef.any_finders = ['Attribute', 'Source', 'Recipe', 'Definition', "LWRP"]
let g:airline_powerline_fonts = 1

function! s:ft_chef_hook()"{{{
  " Keyboard:
  nnoremap <buffer> <silent> <M-a> :<C-u>ChefFindAny<CR>
  nnoremap <buffer> <silent> <M-s> :<C-u>ChefFindAnySplit<CR>
  nnoremap <buffer> <silent> <M-r> :<C-u>ChefFindRelated<CR>
  " nnoremap <buffer> <silent> <CR>  :<C-u>ChefFindAny<CR>
  let b:phrase_ext = 'chef'
endfunction"}}}

