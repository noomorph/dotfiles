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

if has("gui_macvim")
    set transparency=8
    set guifont=Terminus\ (TTF):h18
    set noanti
endif

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
map <Leader>js :call jslibsyntax#load()<CR>
map <Leader>fn :set nofoldenable<CR>
map <Leader>fi :set foldmethod=indent<CR>
map <Leader>i2 :set ts=2 sw=2 sts=2<CR>
map <Leader>i4 :set ts=4 sw=4 sts=4<CR>
map <Leader>cd :cd %:h<CR>
map <Leader>cp :read!pbpaste<CR>
map <Leader>cf :!cat % \| pbcopy<CR>
map <Leader>cc :!pbcopy<CR>u
map <Leader>sudo :w !sudo tee %<CR>
map <Leader>as :mksession! ~/auto.vimsession<CR>
map <Leader>ts :read!date -u +"\%Y-\%m-\%dT\%H:\%M:\%S"<CR>

call plug#begin('~/.vim/plugged')

" General plugins
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter' 
Plug 'mileszs/ack.vim'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|target'
map <Leader>b :CtrlPBuffer<CR>
" indentline settings
let g:indentLine_enabled    = 0
let g:indentLine_char       = '¦'
let g:indentLine_color_term = 239
let g:indentLine_color_gui  = '#A4E57E'
nmap <Leader>i :IndentLinesToggle<CR>
" neocomplete settings
let g:neocomplete#enable_at_startup = 1
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" NerdTree
map <Leader>e :NERDTreeToggle<CR>

" Syntax plugins
let b:current_syntax = "javascript"
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
let g:used_javascript_libs = 'lodash, requirejs, jasmine, jquery'

Plug 'tpope/vim-haml',             { 'for': 'haml'   }
Plug 'wavded/vim-stylus',          { 'for': 'stylus' }
Plug 'groenewege/vim-less',        { 'for': 'less'   }
Plug 'digitaltoad/vim-jade',       { 'for': 'jade'   }
Plug 'slim-template/vim-slim',     { 'for': 'slim'   }
Plug 'othree/html5-syntax.vim',    { 'for': 'html'   }
Plug 'kchmck/vim-coffee-script',   { 'for': 'coffee' }
Plug 'cakebaker/scss-syntax.vim',  { 'for': 'scss'   }
Plug 'heavenshell/vim-jsdoc',      { 'for': 'js'     }
Plug 'hail2u/vim-css3-syntax',     { 'for': ['html','css'] }
Plug 'maksimr/vim-jsbeautify',     { 'for': ['html','css', 'js' ] }
vnoremap <Leader>fbh :call HtmlBeautify()<cr>
vnoremap <Leader>fbc :call CSSBeautify()<cr>
vnoremap <Leader>fbj :call JsBeautify()<cr>

augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

Plug 'Keithbsmiley/investigate.vim', { 'for': ['html','css', 'javascript'] }
nnoremap <Leader>1 :call investigate#Investigate()<CR>
Plug 'scrooloose/syntastic', { 'for': ['ruby','html','css', 'javascript', 'haml'] }
let g:syntastic_auto_jump           = 1
let g:syntastic_error_symbol        = '✖'
let g:syntastic_warning_symbol      = '►'
let g:syntastic_javascript_checkers = ['jshint'   ]
let g:syntastic_html_checkers       = ['jshint'   ]
let g:syntastic_ruby_checkers       = ['rubylint' ]
let g:syntastic_haml_checkers       = ['haml-lint']
let g:syntastic_css_checkers        = ['csslint'  ]
let g:syntastic_css_csslint_args    = "--ignore=zero-units"

Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript',      { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
let javascript_enable_domhtmlcss = 1
let g:html_indent_inctags        = "html,body,head,tbody"
let g:html_indent_script1        = "inc"
let g:html_indent_style1         = "inc"

Plug 'altercation/vim-colors-solarized'

call plug#end()

syntax on
se t_Co=256
let g:solarized_termcolors=256  
set foldmethod=indent
colorscheme solarized
set background=light
