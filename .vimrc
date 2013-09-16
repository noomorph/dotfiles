set nocompatible
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set guifont=saxMono:h12
color railscasts
let g:molokai_original = 1

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/AutoComplPop.git'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'phleet/vim-mercenary'

filetype plugin indent on
syntax on

map <F2> :NERDTreeToggle<CR>
map <F3> :CtrlPBuffer<CR>
