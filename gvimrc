" setting up Vundle
set nocompatible
filetype off
call plug#begin()
Plug 'VundleVim/Vundle.vim'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" tpope stuff
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
" rainbow brackets
Plug 'p00f/nvim-ts-rainbow'
Plug 'ntpeters/vim-better-whitespace'
" shows git aware ruler to the left
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'

Plug 'lukas-reineke/format.nvim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'

Plug 'vim-scripts/IndexedSearch'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

set mouse=a

set nobackup
set nowritebackup
set noswapfile
set number
set relativenumber

set showtabline=2
set colorcolumn=80
set enc=utf-8
set fillchars=vert:\│

" visual search and replacea for neovim
set inccommand=nosplit

nnoremap <c-n> :NvimTreeToggle<CR>
map <Tab><Tab> <C-W><C-W>
nmap <silent> <F3> :Format<CR>
nmap <c-p> :Files<CR>
nmap <c-l> :Buffers<CR>
" reload vim config on the fly
nnoremap <Leader>r :source $MYVIMRC<CR>

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype terraform setlocal ts=2 sts=2 sw=2
autocmd Filetype tf setlocal ts=2 sts=2 sw=2

" Disable quote concealing in JSON files
set conceallevel=0

hi Comment gui=italic cterm=italic
hi Define gui=italic cterm=italic

let g:indentLine_char = '┆'
let g:indentLine_fileTypeExclude = ['json']

" In ~/.vim/vimrc, or somewhere similar.

if has('nvim')
    " control nvim terminal better
    tmap <C-o> <C-\><C-n>
end

lua <<EOF
require "format".setup {
    ["*"] = {
        {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
    },

    terraform = {
        {cmd = {"terraform fmt"}}
    },

    tf = {
        {cmd = {"terraform fmt"}}
    },
    python = {
        {cmd = {"black"}}
    },
    json = {
        {cmd = {"python -m json.tool"}}
    },
}

require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  }
}


local gl = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'coc-explorer'}

gls.left[1] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}

gls.left[2] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.left[3] = {
  GitIcon = {
    provider = function() return ' ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.left[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.left[5] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '   ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[6] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '   ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.left[7] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '   ',
    highlight = {colors.cyan,colors.bg},
  }
}

gls.left[8] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '   ',
    highlight = {colors.blue,colors.bg},
  }
}

gls.right[1] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}

gls.right[2] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}


gls.right[3] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg},
  },
}

gls.right[4] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'},
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
EOF

" Enable spell checking for markdown files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell

augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END

set background=dark " or light if you want light mode
colorscheme gruvbox
