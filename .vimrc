""""""""""
" .vimrc
""""""""""

" plugins
call plug#begin()
  Plug 'sainnhe/sonokai'
call plug#end()

" colorscheme
syntax on
set background=dark
colorscheme sonokai

" for transparent background
function! AdaptColorscheme()
   highlight Normal ctermbg=none
   highlight LineNr ctermbg=none
   highlight Folded ctermbg=none
   highlight NonText ctermbg=none
   highlight SpecialKey ctermbg=none
   highlight VertSplit ctermbg=none
   highlight SignColumn ctermbg=none
endfunction
autocmd ColorScheme * call AdaptColorscheme()


highlight Normal guibg=NONE ctermbg=NONE
highlight Comment cterm=NONE ctermbg=NONE ctermfg=242
highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE

highlight clear LineNr
highlight clear CursorLine
highlight clear SignColumn
highlight clear StatusLine


" bindings
let mapleader="\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
inoremap <silent> jk <ESC>


" display
set fenc=utf-8
set number relativenumber
set virtualedit=onemore
set smartindent
set showmatch

set nobackup
set noswapfile
set autoread
set hidden
set nowrap
set showcmd
set nocompatible
set wildmenu
set wildmode=longest:list,full


" move
set whichwrap=b,s,h,l,<,>,[,],~


" cursor
let &t_TI .= "\e[2 q" " when enter into vim
let &t_EI .= "\e[2 q" " normal mode
let &t_SI .= "\e[5 q" " insert mode
let &t_TE .= "\e[4 q" " when exit from vim


" editor
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard=unnamedplus


" search
set ignorecase
set incsearch
set smartcase
set wrapscan
set hlsearch
nnoremap <ESC><ESC> :nohl<CR>

if has('persistent_undo')
  set undodir=~/.vim/undodir/
  set undofile
endif
