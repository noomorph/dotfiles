let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
let &t_ti.="\e[?7727h"
let &t_te.="\e[?7727l"
noremap <Esc>O[ <Esc>
noremap! <Esc>O[ <Esc>

set nocompatible
filetype off

" set rtp+=/home/sela/.vim/bundle/vundle/
" call vundle#rc()

filetype plugin indent on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number

color railscasts
syntax on
