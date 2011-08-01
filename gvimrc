" System-wide vimrc file for ALTLinux distribution
"
" Maintainer:	Vim Development Team <vim@packages.altlinux.ru>
" Last change:	2003 Apr 25 by Sir Raorn <raorn@altlinux.ru>
"
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
	finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" set paste

set ai
set ic
set hls


set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4

noremap <silent> <c-e> :NERDTreeToggle<CR>

" allow backspacing over everything in insert mode
colorscheme desert256
set backspace=indent,eol,start

set nobackup
set autoindent		" always set autoindenting on
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" show partial command in status line
set number


syntax enable

" set viminfo='50,r/mnt/floppy,r/mnt/zip,%,n~/.viminfo
" map Q gq
" map <F12> :r !LANG=C date '+\%a \%b \%d \%Y Eugene Suchkov <suchkov@linux-online.ru>'
" map <F12>  1GO :r !date '+\%Y-\%m-\%d' 2GA  Jason Molenda  ( :r !whoami kJxA@ :r !hostname A) kJxkddjO
" au FileType spec map <buffer> <F12> <Plug>AddChangelogEntry


if !has("gui")
    let g:CSApprox_loaded = 1
endif

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


" add key mappings for national keyboards
" if has("langmap") && filereadable( $VIMRUNTIME . "/langmap/" . $LANG . ".vim" )
"	exe "so " . $VIMRUNTIME . "/langmap/" . $LANG . ".vim"
"endif

" Disabled for security reasons
set nomodeline
set wildmenu
set guifont=Menlo\ 12
set columns=128

let g:twitterusername='cityhawk' 
let g:twitterpassword='CisOrgye'

nnoremap <c-f> :FuzzyFinderTextMate<CR>

set list
set lcs+=trail:.

#set hidden
map <C-TAB> :bnext!<CR>
map <C-S-TAB> :bprev!<CR>
map <C-\> :b#<CR>

map <C-S-R> :ruby finder.rescan!<CR>
map <C-/> NERDComToggleComment<CR>
 
