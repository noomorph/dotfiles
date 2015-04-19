set shell=bash
set nocompatible
set hlsearch
set wildmenu
set ruler
set exrc
set noswapfile
set sts=4 ts=4 sw=4
set expandtab
set number
set relativenumber
set splitbelow
set splitright

au FileType python setl sw=2 sts=2 ts=2 et
au FileType coffee setl sw=2 sts=2 ts=2 et
au BufRead,BufNewFile *.json set filetype=json

" automatic copy/paste with correct indentation
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

" replace without buffers: Sw, Si, Si(
nnoremap <silent> S :set opfunc=PasteReplace<CR>g@
function! PasteReplace(type, ...)
    if a:0
        silent exe "normal! `<" . a:type . "`>p"
    elseif a:type == 'line'
        silent exe "normal! '[V']p"
    elseif a:type == 'block'
        silent exe "normal! `[\<C-V>`]p"
    else
        silent exe "normal! `[v`]p"
    endif
endfunction
nmap SS S$

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

vmap <Leader>_ :s/\%V /_/g
nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
  \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<CR>
if !hasmapto("<Plug>VLToggle")
  nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpo = s:save_cpo | unlet s:save_cpo

map <Leader>sj :set syntax=javascript<CR>
map <Leader>sh :set syntax=html<CR>
map <Leader>fn :set nofoldenable<CR>
map <Leader>fi :set foldmethod=indent<CR>
map <Leader>i2 :set ts=2 sw=2 sts=2<CR>
map <Leader>i4 :set ts=4 sw=4 sts=4<CR>
map <Leader>cd :cd %:h<CR>
map <Leader>c- :cd -<CR>
map <Leader>cp :read!pbpaste<CR>
map <Leader>cf :!cat % \| pbcopy<CR>
map <Leader>cc :!pbcopy<CR>u
map <Leader>sw :w !sudo tee %<CR>
map <Leader>as :mksession! ~/auto.vimsession<CR>
map <Leader>ts :read!date -u +"\%Y-\%m-\%dT\%H:\%M:\%S"<CR>

so ~/.vimplugged

syntax on
color molokai

if has("gui_macvim")
    "highlight LineNr guifg=darkgrey
    set guifont=Monaco:h12
    set fullscreen
else
    set t_Co=256
    "highlight LineNr ctermfg=darkgrey
endif
