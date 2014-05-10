set shell=bash
set nocompatible
set exrc

set hlsearch
set wildmenu
set ruler

set sts=4 ts=4 sw=4
set smartindent
set expandtab

set foldmethod=indent

set number
set relativenumber

set guifont=Monaco:h14

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'codeape2/vim-multiple-monitors'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/AutoComplPop.git'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'noahfrederick/vim-hemisu'

Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|target'

Bundle 'mileszs/ack.vim'

Bundle 'scrooloose/syntastic'
let g:syntastic_js_checkers=['jshint']
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

Bundle 'scrooloose/nerdtree'
Bundle 'tomasr/molokai'
Bundle 'itchyny/lightline.vim'

filetype plugin indent on
syntax on
let g:molokai_original = 1
color molokai

vmap <Leader>s "_dP
map <Leader>e :NERDTreeToggle<CR>
map <Leader>rs :!rspec -f doc<CR>
map <Leader>b :CtrlPBuffer<CR>
map <Leader>j :set syntax=javascript<CR>
map <Leader>fn :set nofoldenable<CR>
map <Leader>fi :set foldmethod=indent<CR>
map <Leader>i2 :set ts=2 sw=2 sts=2<CR>
map <Leader>i4 :set ts=4 sw=4 sts=4<CR>
map <Leader>cd :cd %:h<CR>

" enabling moving line up or down
nnoremap <C-k> mz:m-2<CR>`z==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
nnoremap <C-j> mz:m+<CR>`z==
vnoremap <C-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" Search for selected text.
" http://vim.wikia.com/wiki/VimTip171
let s:save_cpo = &cpo | set cpo&vim
if !exists('g:VeryLiteral')
  let g:VeryLiteral = 0
endif

function! s:VSetSearch(cmd)
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  normal! gvy
  if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && g:VeryLiteral
    let @/ = @@
  else
    let pat = escape(@@, a:cmd.'\')
    if g:VeryLiteral
      let pat = substitute(pat, '\n', '\\n', 'g')
    else
      let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
      let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
      let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
    endif
    let @/ = '\V'.pat
  endif
  normal! gV
  call setreg('"', old_reg, old_regtype)
endfunction

vnoremap <silent> * :<C-U>call <SID>VSetSearch('/')<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call <SID>VSetSearch('?')<CR>?<C-R>/<CR>
vmap <kMultiply> *

nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
  \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<CR>
if !hasmapto("<Plug>VLToggle")
  nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpo = s:save_cpo | unlet s:save_cpo
