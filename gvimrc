call pathogen#infect()
call pathogen#helptags()

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


" if !has("win32")
"     set listchars=tab:▷.,trail:.,nbsp:.
" endif


noremap <silent> <c-e> :NERDTreeToggle<CR>

" Colorscheme
colorscheme Tomorrow-Night

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


" set nomodeline
set guifont=Sauce\ Code\ Powerline\ Light:h15

set columns=128

nnoremap <c-f> :NERDTreeToggle<CR>
map <c-/> TComment<CR>

if has("mac")
    set invmmta
endif

let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'

let g:airline_powerline_fonts = 1

" fixing vim-chef autodetect
autocmd BufNewFile,BufRead cookbooks/*/\(attributes\|definitions\|libraries\|providers\|recipes\|resources\)/*.rb set filetype=ruby.chef
autocmd BufNewFile,BufRead community-cookbooks/*/\(attributes\|definitions\|libraries\|providers\|recipes\|resources\)/*.rb set filetype=ruby.chef

autocmd BufNewFile,BufRead cookbooks/*/templates/*/*.erb set filetype=eruby.chef
autocmd BufNewFile,BufRead cookbooks/*/metadata.rb set filetype=ruby.chef

