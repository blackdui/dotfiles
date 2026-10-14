set number
set relativenumber
set incsearch
set hlsearch
set wildmenu
set expandtab
set cursorline
set modeline
"set termguicolors
set colorcolumn=80
let &t_ut=''
set wildmode=list,full


let mapleader = " "
" map{{{1
inoremap jk <esc>

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>ee :e %:h<cr>
inoremap <C-u> <ESC>mmgUiw`ma
nnoremap <C-c> :nohl<cr>
nnoremap <leader>fc :Commands<CR>
nnoremap <leader>ff :Files<CR>         
nnoremap <leader>fg :Rg <c-r><c-w><CR>
nnoremap <leader>fb :Buffers<CR>       
nnoremap <leader>fh :History<CR>       

syntax on

" plugin{{{1
packadd! matchit

call plug#begin()
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'habamax/vim-habamax'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme habamax
