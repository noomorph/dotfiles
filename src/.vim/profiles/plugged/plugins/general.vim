" General plugins
Plug 'editorconfig/editorconfig-vim'
Plug 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'cssCache\|node_modules\|bower_components\|target'
map <Leader>b :CtrlPBuffer<CR>

Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Valloric/YouCompleteMe'

let g:NERDTreeShowHidden=1
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
map <Leader>e :NERDTreeToggle<CR>

Plug 'scrooloose/syntastic', { 'for': ['ruby','coffee','html','css', 'javascript', 'haml', 'scss', 'json', 'typescript', 'less'] }

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_auto_jump           = 1
let g:syntastic_check_on_open       = 1
let g:syntastic_check_on_wq         = 1
" let g:syntastic_debug             = 1
let g:syntastic_aggregate_errors    = 1
let g:syntastic_error_symbol        = '✖'
let g:syntastic_warning_symbol      = '►'
let g:syntastic_javascript_checkers = ['eslint']
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_json_checkers       = ['jsonlint' ]
let g:syntastic_html_checkers       = ['jshint'   ]
let g:syntastic_ruby_checkers       = ['rubylint' ]
let g:syntastic_haml_checkers       = ['haml-lint']
let g:syntastic_coffee_checkers     = ['coffeelint']
let g:syntastic_css_checkers        = ['csslint'  ]
let g:syntastic_css_csslint_args    = "--ignore=zero-units"

map <Leader>0 :Errors<CR>
